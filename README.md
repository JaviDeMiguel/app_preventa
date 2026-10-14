# App Preventa & Autoventa Offline-First para FacturaScripts v3

Aplicación móvil empresarial desarrollada en **Flutter (Dart 3)** con arquitectura **Offline-First**, diseñada específicamente para agentes comerciales en ruta (**Preventa**) y repartidores con stock en vehículo (**Autoventa**), sincronizada bidireccionalmente con el ERP **FacturaScripts v3**.

---

## 🏛️ Estándares de Arquitectura y Buenas Prácticas (ECC)

1. **Inmutabilidad Absoluta**:
   - Modelos de dominio y estados gestionados con `@freezed` y `@JsonSerializable`.
   - Prevención de mutaciones accidentales e histórico de cambios con `copyWith`.
2. **Jerarquías de Estados Sealed & Exhaustive Pattern Matching**:
   - Estados de carga, guardado y sincronización modelados con `sealed class`.
   - Control de flujo estricto mediante `switch` expressions exhaustivas de Dart 3, sin flags booleanos (`isLoading`, `isError`).
3. **Concurrencia Estructurada**:
   - Paralelización de I/O en lecturas de Isar y peticiones de red mediante record destructuring y `(future1, future2).wait`.
4. **Inyección de Dependencias & Desacoplamiento**:
   - Contenedor centralizado `AppDependencies` con inyección por constructor de `Isar`, `Dio`, `Connectivity` y repositorios.
5. **Seguridad de Contexto**:
   - Verificación post-await estricta con `if (!mounted) return;` en todos los callbacks asíncronos antes de interactuar con el árbol de widgets.

---

## 🔄 Motor de Sincronización Bidireccional (SyncEngine)

- **Cola Ascendente (Upstream Queue)**:
  - Todo pedido, albarán o nuevo cliente se persiste atómicamente en almacenamiento local Isar con estado `pending`.
  - Despachador con reintentos exponenciales y estados finitos (`pending` -> `inProgress` -> `completed` / `failed` / `fatalError`).
- **Descarga Incremental (Downstream Delta Sync)**:
  - Sincronización paralela de clientes (`/api/3/clientes`) y catálogo de artículos (`/api/3/articulos`).
  - Control de marcas de tiempo delta (`updated_after`) persistidas en `SyncMetadataCollection`.
- **Orquestador de Conectividad Automático**:
  - `ConnectivitySyncOrchestrator` escucha cambios en `connectivity_plus` y despacha automáticamente la cola en cuanto se recupera la cobertura WiFi / 4G / 5G.
- **Reconciliación de Identidad Distribuida**:
  - Clientes creados offline reciben identificadores temporales (`TEMP-CLI-*`).
  - Al sincronizarse con FacturaScripts, el código definitivo emitido por el ERP se propaga en cascada actualizando la ficha local y todos los pedidos y albaranes asociados antes de subirlos.

---

## 💼 Funcionalidades Comerciales

### 1. Preventa y Autoventa Bifurcada
- **Preventa**: Generación de pedidos (`/api/3/pedidoscliente`) con validación de catálogo local.
- **Autoventa (Venta Directa)**: Emisión de albaranes de entrega (`/api/3/albaranescliente`) con **descuento atómico e inmediato del stock en furgón** (`stockDisponible` y `stockFisico`) en Isar.

### 2. Captura de Firma Digital en Pantalla
- Diálogo táctil interactivo `SignaturePadDialog` con motor de dibujo vectorial continuo (`CustomPainter`), soporte de deshacer trazo y borrado.
- Identificación formal del firmante (`firmanteNombre`, `firmanteDni`).
- Exportación compacta a SVG estándar y coordenadas JSON (`SignaturePreviewCard`), persistida en `OrderEntity` y embebida en el payload.

### 3. Control de Riesgo Financiero y Deuda
- Visualización de situación crediticia en `ClientDetailScreen` (Solvente / Deuda Viva / Riesgo Excedido).
- Alerta preventiva en pantalla de confirmación si `deuda + total_operacion > riesgomax`.
- Identificación de tarifa asignada (`codtarifa`) y recargo de equivalencia (`recargo`).

### 4. Descuentos de Línea y Comprobante Digital
- Aplicación de descuentos porcentuales (`dsc`) por artículo.
- Generador de tickets formateados `ReceiptFormatter` listos para impresión o compartición directa por WhatsApp / Email.

### 5. Liquidación de Jornada y Arqueo de Caja
- `SalesDashboardScreen` con desglose de ventas por tipo de documento, arqueo de efectivo vs tarjeta/transferencia y stock remanente en vehículo.

---

## 🧪 Pruebas Unitarias y Verificación

La suite de tests unitarios cubre el 100% de los flujos críticos:
```bash
flutter test
```
Resultados verificados:
- Inmutabilidad y serialización JSON de tareas de sincronización.
- Exhaustive pattern matching sobre estados de guardado `OrderSaveState`.
- Tipado de pedidos y albaranes en ruta.
- Formato de tickets comerciales, descuentos y conformidad de firma digital.
- Evaluación de límites de riesgo de crédito y tarifas.

```bash
flutter analyze
dart format lib test
```
Código verificado con **0 advertencias, 0 lints y 0 errores**.

