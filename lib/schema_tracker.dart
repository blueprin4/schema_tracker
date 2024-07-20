// File: schema_tracker/lib/schema_tracker.dart

library schema_tracker;

export 'models.dart';
export 'schema_parser.dart';
export 'schema_viewer.dart';
export 'version_control.dart';

import 'schema_tracker_platform_interface.dart';

class SchemaTracker {
  Future<String?> getPlatformVersion() {
    return SchemaTrackerPlatform.instance.getPlatformVersion();
  }
}
