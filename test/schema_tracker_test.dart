import 'package:flutter_test/flutter_test.dart';
import 'package:schema_tracker/schema_tracker.dart';
import 'package:schema_tracker/schema_tracker_platform_interface.dart';
import 'package:schema_tracker/schema_tracker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSchemaTrackerPlatform
    with MockPlatformInterfaceMixin
    implements SchemaTrackerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SchemaTrackerPlatform initialPlatform = SchemaTrackerPlatform.instance;

  test('$MethodChannelSchemaTracker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSchemaTracker>());
  });

  test('getPlatformVersion', () async {
    SchemaTracker schemaTrackerPlugin = SchemaTracker();
    MockSchemaTrackerPlatform fakePlatform = MockSchemaTrackerPlatform();
    SchemaTrackerPlatform.instance = fakePlatform;

    expect(await schemaTrackerPlugin.getPlatformVersion(), '42');
  });
}
