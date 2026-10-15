import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Carga el binario nativo empaquetado por `isar_community_flutter_libs` (sin red).
Future<void> initIsarCoreForTests() async {
  final packageConfig = jsonDecode(
    await File('.dart_tool/package_config.json').readAsString(),
  ) as Map<String, dynamic>;
  final libsRoot = (packageConfig['packages'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .firstWhere(
              (p) => p['name'] == 'isar_community_flutter_libs')['rootUri']
      as String;
  final root = Uri.parse(libsRoot).toFilePath();
  await Isar.initializeIsarCore(
    libraries: {
      Abi.windowsX64: '$root/windows/libisar.dll',
      Abi.linuxX64: '$root/linux/libisar.so',
    },
  );
}

var _instanceCounter = 0;

/// Abre una base Isar efímera en un directorio temporal propio.
Future<(Isar, Directory)> openTestIsar() async {
  final dir = await Directory.systemTemp.createTemp('preventa_it_');
  final isar = await Isar.open(
    [
      SyncTaskCollectionSchema,
      SyncMetadataCollectionSchema,
      ClientEntitySchema,
      ProductEntitySchema,
      OrderEntitySchema,
      AppSettingsEntitySchema,
    ],
    directory: dir.path,
    name: 'it_${_instanceCounter++}_$pid',
    inspector: false,
  );
  return (isar, dir);
}

Future<void> closeTestIsar(Isar isar, Directory dir) async {
  await isar.close(deleteFromDisk: true);
  await dir.delete(recursive: true);
}
