# Learn Flutter

I'm acquiring Flutter and Dart skill

## How

I spent at least 1 hour per day to learn and practice Flutter & Dart

I will push one commit after that with a short description of what I have acquired

## Note

I already done learning Dart from [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## Why would I publicize this repo?

I want to push myself to acquire a new skill.

## Day 03

No coding today, just learn about running app on differents platform, emulator, simulator, real devices, debugging tools, Flutter Dev tools, how to profile app an so on.

## Day 04

* Combine Container, Row, Column, Card
* Model Class

![image info](./imgs/day_04.png)

## Day 05

* split widgets, models
* ListView, TextField, TextEditingController, InputDecoration

![image info](./imgs/day_05.png)


## Day 06

* Refactor UI
* Showing/poping modal
* ThemeData
* keyboardType, AppBar actions
* FloatingActionButton

![image info](./imgs/day_06_1.png)
![image info](./imgs/day_06_2.png)

## Day 07

* unit test
  
  Used to test business logic ie: purchasing, handling fetch data or just to pick up an icon for some kind of weather (☀ must up for Sunny weather)

* widget test

  Used this for UI test

* integration test

  Used to test the app flow. ie go to home page, press add button to add a new transaction, save it then go back to the home page. You can also take snapshots during test.


To setup and execute integration test, following these steps:

1. add integration test package to your dev_dependencies

```
dev_dependencies:
  integration_test:
    sdk: flutter
```

2. add `integration_test.dart` to `test_driver` directory

```
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
```

3. writing integration test in `integration_test` directory

start writing your own integration test scenario

4. execute integration test

```
flutter driver --driver=test_driver/integration_test.dart --target=integration_test/main_test.dart
```