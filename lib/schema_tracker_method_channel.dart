import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'schema_tracker_platform_interface.dart';

/// An implementation of [SchemaTrackerPlatform] that uses method channels.
class MethodChannelSchemaTracker extends SchemaTrackerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('schema_tracker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
