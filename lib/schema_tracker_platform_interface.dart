import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'schema_tracker_method_channel.dart';

abstract class SchemaTrackerPlatform extends PlatformInterface {
  /// Constructs a SchemaTrackerPlatform.
  SchemaTrackerPlatform() : super(token: _token);

  static final Object _token = Object();

  static SchemaTrackerPlatform _instance = MethodChannelSchemaTracker();

  /// The default instance of [SchemaTrackerPlatform] to use.
  ///
  /// Defaults to [MethodChannelSchemaTracker].
  static SchemaTrackerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SchemaTrackerPlatform] when
  /// they register themselves.
  static set instance(SchemaTrackerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
