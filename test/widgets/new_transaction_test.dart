import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn/widgets/new_transaction.dart';

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;

  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  testWidgets('new transaction', (WidgetTester tester) async {
    void handleSumit(String title, double amount) {}

    final newTransactionWidget = NewTransaction(handleSumit);

    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: newTransactionWidget));

    final titleInput = find.byKey(const Key('titleInput'));
    final amountInput = find.byKey(const Key('amountInput'));
    final addTransactionBtn = find.byKey(const Key('addTractionBtn'));

    // verify all required fields and button available
    expect(titleInput, findsOneWidget);
    expect(amountInput, findsOneWidget);
    expect(addTransactionBtn, findsOneWidget);

    // trying to fill the form
    await tester.enterText(titleInput, 'Adidas shoes');
    await tester.enterText(amountInput, '130.1238');

    // submit form
    await tester.tap(addTransactionBtn);
  });
}
