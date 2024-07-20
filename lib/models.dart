// File: schema_tracker/lib/models.dart

class CollectionField {
  final String name;
  final String type;
  final bool isNullable;

  CollectionField(this.name, this.type, this.isNullable);
}

class CollectionSchema {
  final String name;
  final List<CollectionField> fields;

  CollectionSchema(this.name, this.fields);
}
