// File: schema_tracker/lib/version_control.dart

import 'dart:convert';
import 'dart:io';
import 'models.dart';

Future<void> saveSchemaVersion(
    List<CollectionSchema> schemas, String version) async {
  final schemaData = schemas
      .map((s) => {
            'name': s.name,
            'fields': s.fields
                .map((f) => {
                      'name': f.name,
                      'type': f.type,
                      'isNullable': f.isNullable,
                    })
                .toList(),
          })
      .toList();

  final versionFile = File('schema_versions.json');
  Map<String, dynamic> versions;
  if (await versionFile.exists()) {
    versions = jsonDecode(await versionFile.readAsString());
  } else {
    versions = {};
  }
  versions[version] = schemaData;
  await versionFile.writeAsString(jsonEncode(versions));
}
