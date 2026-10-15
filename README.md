# Preventa ERP — Preventa y Autoventa offline para FacturaScripts

App Flutter para comerciales en ruta (**preventa**: pedidos) y repartidores con stock en el vehículo (**autoventa**: albaranes), que trabaja **sin conexión** y se sincroniza con [FacturaScripts](https://facturascripts.com) a través de su API REST v3.

Todo lo que hace el comercial se guarda primero en el dispositivo (Isar) y se envía al ERP cuando hay cobertura, sin perder ni duplicar documentos.

[![CI](https://github.com/JaviDeMiguel/app_preventa/actions/workflows/ci.yml/badge.svg)](https://github.com/JaviDeMiguel/app_preventa/actions/workflows/ci.yml)

## Funcionalidades

- **Clientes**: búsqueda con scroll infinito, ficha con riesgo de crédito (riesgo máximo vs. riesgo alcanzado), tarifa y recargo de equivalencia. Alta de clientes **sin conexión** con código temporal que se reconcilia al llegar al ERP.
- **Pedidos (preventa)** y **albaranes (autoventa)** con descuentos por línea, forma de pago y aviso si se supera el riesgo del cliente.
- **Stock de la furgoneta**: el albarán descuenta stock en el acto y la app lo mantiene coherente con el ERP aunque haya ventas aún sin enviar.
- **Firma del cliente** en pantalla; se adjunta al documento en el ERP.
- **Historial** con el estado de envío de cada documento y **revisión** de los que el ERP rechaza (ver motivo, reintentar o anular).
- **Resumen de jornada**: ventas por tipo de documento, cobros y stock del vehículo.
- **Comprobante** de texto listo para compartir.

## Requisitos

| Herramienta | Versión |
|---|---|
| Flutter | 3.47.3 (stable) |
| FacturaScripts | Versión reciente con la API activada que incluya los endpoints `crearPedidoCliente` / `crearAlbaranCliente` (aparecen en `GET /api/3`) |
| Android | 6.0 (API 23) o superior |
| Windows (opcional, para desarrollo) | Modo de desarrollador activado y Visual Studio 2022 con *Desktop C++* y el componente **«ATL de C++»** |

> La app **no funciona en web**: la base de datos local (Isar) no tiene soporte para navegador. Para probar en equipos modestos, usa la versión de escritorio de Windows.

## Puesta en marcha

### 1. Preparar FacturaScripts

1. En FacturaScripts, activa la API y crea una **clave de API** (Administración → API).
2. Concede a la clave acceso a los recursos que usa la app (o acceso completo): `clientes`, `contactos`, `productos`, `impuestos`, `stocks`, `pedidoclientes`, `albaranclientes`, `crearPedidoCliente`, `crearAlbaranCliente`, `attachedfiles` y `attachedfilerelations`.
3. Si usas autoventa, anota el **código del almacén** del vehículo (`codalmacen`).

### 2. Ejecutar la app

```bash
flutter pub get
flutter run -d windows      # escritorio (rápido en equipos modestos)
flutter run                 # dispositivo o emulador Android
```

### 3. Configurar la conexión en la app

En **Ajustes**:

- **URL del servidor**: la URL base de FacturaScripts. En las versiones de release **solo se admite HTTPS**; en debug se permite HTTP para un servidor local (desde el emulador de Android, `http://10.0.2.2/...`).
- **Token API**: la clave creada en el paso 1. Se guarda en el almacén seguro del sistema (Keystore en Android, DPAPI en Windows), nunca en la base de datos.
- **Almacén del vehículo**: el `codalmacen` de la furgoneta (opcional; vacío = almacén por defecto del ERP).

Pulsa **Probar conexión**, guarda y descarga el catálogo con el botón de sincronizar.

## Cómo funciona la sincronización

### Envío al ERP (cola ascendente)

Cada documento o alta de cliente se guarda junto con una **tarea** en una cola persistente. El motor (`SyncEngine`) la procesa así:

- **Una sola pasada a la vez.** Cada tarea se reserva de forma atómica antes de enviarse, así que dos disparos simultáneos no envían el mismo pedido dos veces.
- **Sin duplicados tras cortes.** Si la app se cierra a mitad de envío, o el ERP no responde a tiempo, la tarea queda marcada como *dudosa*. Antes de reenviarla, la app consulta al ERP por una clave generada en el móvil: `numero2` en documentos y `cifnif` en clientes.
- **Reintentos con espera exponencial** ante errores del servidor, guardados en la base de datos para que sobrevivan a reinicios. Los cortes de red no consumen intentos.
- **Protección contra el bloqueo de IP.** FacturaScripts bloquea la IP tras 5 tokens inválidos en 10 minutos. Ante un 401/403 la app deja de enviar hasta que se cambian las credenciales.
- **Tareas encadenadas.** Cuando el ERP confirma un alta o un documento, la app envía lo que dependía de ello: la dirección del cliente (en su contacto por defecto) y la firma (subida como adjunto y enlazada al documento).
- **Clientes creados sin conexión.** Sus pedidos esperan al alta del cliente y salen ya con el código definitivo del ERP.

Estados de una tarea:

| Estado | Significado |
|---|---|
| `pending` | En cola, pendiente de envío (o esperando su próximo reintento). |
| `inProgress` | Enviándose ahora. |
| `completed` | Confirmado por el ERP. |
| `failed` | Reintentos agotados por errores del servidor; se puede reintentar desde el historial. |
| `fatalError` | El ERP rechazó la petición (datos inválidos). |
| `conflict` | Regla de negocio del ERP (p. ej. stock insuficiente) o entrega imposible de verificar: requiere revisión. |
| `discarded` | Anulado por el comercial; no se envía y, si es un albarán, repone el stock. |

Un orquestador de red lanza la cola al recuperar la cobertura (esperando 3 s a que la red se estabilice), al volver la app a primer plano y cuando vence un reintento.

### Descarga del catálogo (descendente)

Descarga completa y paginada de clientes, productos, impuestos y stock del almacén del vehículo. El mapeo se hace fuera del hilo principal. A continuación:

- Se borran del dispositivo los clientes dados de baja y los productos que ya no se venden.
- Se descuenta del stock recibido lo vendido en albaranes que aún no han llegado al ERP, para no vender lo que ya salió de la furgoneta.

### Contrato con la API de FacturaScripts

Verificado contra el código fuente de FacturaScripts y contra una instancia real (ver [Pruebas](#pruebas)):

| Uso | Petición |
|---|---|
| Autenticación | Cabecera `X-Auth-Token` |
| Cuerpo de las peticiones de escritura | `application/x-www-form-urlencoded` (FacturaScripts no lee JSON en POST) |
| Crear pedido / albarán con líneas | `POST /api/3/crearPedidoCliente` · `POST /api/3/crearAlbaranCliente` (`lineas` como JSON) |
| Alta de cliente | `POST /api/3/clientes` |
| Dirección del cliente | `PUT /api/3/contactos/{idcontactofact}` |
| Firma | `POST /api/3/attachedfiles` (multipart) + `POST /api/3/attachedfilerelations` |
| Catálogo | `GET /api/3/{clientes,productos,impuestos,stocks}` con `limit`, `offset`, `sort[...]` y `filter[...]` |
| Verificación anti-duplicados | `GET /api/3/pedidoclientes?filter[numero2]=...` (y equivalentes) |

## Seguridad

- Token en el almacén seguro del sistema operativo; las instalaciones antiguas que lo tenían en la base de datos se migran solas.
- HTTPS obligatorio en release (también a nivel de Android con `network_security_config`), sin seguir redirecciones.
- La base de datos local queda excluida de las copias de seguridad de Android.
- Logs solo en debug y sin cabeceras ni cuerpos. Los mensajes de error que se guardan se sanean, y el DNI del firmante va enmascarado en el ERP.

## Pruebas

```bash
flutter analyze
flutter test                 # unitarias, contrato de la API, integración con Isar real y ERP simulado
```

**Contra un FacturaScripts de pruebas** (crean datos marcados y los borran al terminar; usa una clave con acceso completo y **nunca** una instancia de producción con datos reales):

```bash
# Contrato de la API con el motor real
FS_URL=http://localhost/facturascripts FS_TOKEN=<clave> FS_WAREHOUSE=<almacén> \
  flutter test test/erp_live_contract_test.dart

# Flujo completo sobre la interfaz: pedido sin conexión que se envía al volver la red
flutter test integration_test/offline_order_flow_test.dart -d windows \
  --dart-define=FS_URL=http://localhost/facturascripts \
  --dart-define=FS_TOKEN=<clave> --dart-define=FS_WAREHOUSE=<almacén>
```

Sin esas variables, ambas pruebas se saltan solas.

### Integración continua

[`.github/workflows/ci.yml`](.github/workflows/ci.yml) se ejecuta en cada PR hacia `main` y comprueba:
- el formato;
- que el código generado (freezed, Isar, JSON) esté al día;
- `flutter analyze`;
- los tests, con un mínimo del **80 % de cobertura** en el núcleo de sincronización;
- la compilación del APK, verificando que todas las librerías nativas estén **alineadas a 16 KB** (requisito de Google Play para Android 15+).

## Desarrollo

```bash
# Tras modificar modelos freezed / Isar / JSON
dart run build_runner build --delete-conflicting-outputs
```

Los archivos generados (`*.g.dart`, `*.freezed.dart`) están versionados; el CI falla si no están al día.

La base de datos local usa [`isar_community`](https://github.com/isar-community/isar-community), el fork mantenido de Isar 3, con la misma API. El paquete original está abandonado y su librería nativa no cumple el requisito de 16 KB.

```
lib/
├── core/
│   ├── di/            # AppDependencies: ensamblaje de la infraestructura
│   ├── network/       # Cliente Dio, autenticación y política de URL
│   ├── settings/      # Configuración y almacén seguro del token
│   ├── sync/
│   │   ├── engine/    # SyncEngine, cola, clasificación de errores, contrato ERP
│   │   ├── models/    # Entidades Isar y DTOs de la API
│   │   └── states/    # Estados y resultados tipados (freezed, sealed)
│   └── widgets/       # Widgets compartidos
└── features/          # clients, products, orders, dashboard, settings
```

## Publicación en Google Play

1. Genera el keystore de subida y crea `android/key.properties` a partir de [`android/key.properties.example`](android/key.properties.example). El keystore va **fuera** del repositorio y con copia de seguridad: sin él no podrás publicar actualizaciones.
2. Sustituye el icono por defecto (`android/app/src/main/res/mipmap-*`).
3. Ejecuta la prueba de contrato contra el ERP de preproducción.
4. Compila:

   ```bash
   flutter build appbundle --obfuscate --split-debug-info=build/symbols
   ```

   Guarda `build/symbols` para poder interpretar los informes de errores.

## Limitaciones conocidas

- Solo Android y Windows. iOS no está configurado y la web no es compatible.
- Los albaranes rechazados por el ERP siguen descontando stock del vehículo hasta que el comercial los reintenta o los anula desde el historial (la mercancía ya salió de la furgoneta).
- La firma se envía como adjunto SVG: comprueba que tu versión de FacturaScripts acepta ese tipo de archivo.
