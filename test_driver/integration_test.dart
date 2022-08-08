// enable if you want to taking snapshot during execute integration test
import 'dart:io';

// required import
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  // enable if you just wants to execute integration test
  // await integrationDriver();

  // enable if you want to taking snapshot during execute integration test
  await integrationDriver(onScreenshot: (String name, List<int> bytes) async {
    final image = await File('screenshots/$name.png').create(recursive: true);
    image.writeAsBytesSync(bytes);
    return true;
  });
}
