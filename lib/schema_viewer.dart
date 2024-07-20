// File: schema_tracker/lib/schema_viewer.dart

import 'package:flutter/material.dart';
import 'models.dart';

class SchemaViewer extends StatelessWidget {
  final List<CollectionSchema> schemas;

  SchemaViewer(this.schemas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schemas.length,
      itemBuilder: (context, index) {
        final schema = schemas[index];
        return ExpansionTile(
          title: Text(schema.name),
          children: schema.fields
              .map((field) => ListTile(
                    title: Text(field.name),
                    subtitle:
                        Text('${field.type}${field.isNullable ? '?' : ''}'),
                  ))
              .toList(),
        );
      },
    );
  }
}
