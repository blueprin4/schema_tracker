// File: schema_tracker/lib/schema_parser.dart

import 'dart:io';
import 'package:path/path.dart' as path;
import 'models.dart';

Future<CollectionSchema> parseSchemaFile(File file) async {
  final content = await file.readAsString();
  final name =
      path.basenameWithoutExtension(file.path).replaceAll('_record', '');

  final fieldRegex = RegExp(
      r'(\w+)\s*(\??)\s*_(\w+);.*?(\w+)\s+get\s+\w+\s*=>\s*_\w+\s*(\?\?.*?)?;',
      multiLine: true);
  final fields = <CollectionField>[];

  for (final match in fieldRegex.allMatches(content)) {
    final type = match.group(1)!;
    final isNullable = match.group(2) == '?' || match.group(5) != null;
    final name = match.group(3)!;
    fields.add(CollectionField(name, type, isNullable));
  }

  return CollectionSchema(name, fields);
}

Future<List<CollectionSchema>> readAllSchemas(String projectPath) async {
  final schemaDir =
      Directory(path.join(projectPath, 'lib', 'backend', 'schema'));
  final files = schemaDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('_record.dart'))
      .toList();

  final schemas = <CollectionSchema>[];
  for (final file in files) {
    schemas.add(await parseSchemaFile(file));
  }

  return schemas;
}
