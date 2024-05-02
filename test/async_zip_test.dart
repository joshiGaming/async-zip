import 'package:flutter_test/flutter_test.dart';
import 'package:async_zip/async_zip.dart';
import 'package:async_zip/async_zip_platform_interface.dart';
import 'package:async_zip/async_zip_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAsyncZipPlatform
    with MockPlatformInterfaceMixin
    implements AsyncZipPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AsyncZipPlatform initialPlatform = AsyncZipPlatform.instance;

  test('$MethodChannelAsyncZip is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAsyncZip>());
  });

  test('getPlatformVersion', () async {
    AsyncZip asyncZipPlugin = AsyncZip();
    MockAsyncZipPlatform fakePlatform = MockAsyncZipPlatform();
    AsyncZipPlatform.instance = fakePlatform;

    expect(await asyncZipPlugin.getPlatformVersion(), '42');
  });
}
