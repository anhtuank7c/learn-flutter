import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('full app test', (tester) async {
    // Build our app
    app.main();

    String platform = Platform.isIOS ? 'ios' : 'android';

    if (Platform.isAndroid) {
      // required by Android to taking snapshot
      await binding.convertFlutterSurfaceToImage();
    }

    // trigger a frame.
    await tester.pumpAndSettle();

    final addBtn = find.byKey(const Key('addBtn'));

    // show Modal Bottom Sheet
    await tester.tap(addBtn);

    // trigger a frame.
    await tester.pumpAndSettle();

    final titleField = find.byKey(const Key('titleInput'));
    final amountField = find.byKey(const Key('amountInput'));
    final addTransactionBtn = find.byKey(const Key('addTractionBtn'));

    // feed the form
    await tester.enterText(titleField, 'Replace an iPhone battery');
    await tester.enterText(amountField, '300000');

    // trigger a frame.
    await tester.pumpAndSettle();

    // taking screenshot
    await binding.takeScreenshot('form-$platform');

    // tap add transaction button
    await tester.tap(addTransactionBtn);

    // trigger a frame.
    await tester.pumpAndSettle();

    // taking screenshot
    await binding.takeScreenshot('home-page-$platform');
  });
}
