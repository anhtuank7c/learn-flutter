import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn/models/transaction.dart';
import 'package:learn/widgets/transaction_list.dart';

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
    final List<Transaction> transactions = [
      Transaction(
        id: DateTime.now().toString(),
        title: 'Adidas shoes',
        amount: 123.456,
        createdAt: DateTime.now(),
      ),
    ];

    final transactionListWidget = TransactionList(transactions: transactions);

    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: transactionListWidget));

    // verify that have at least one transaction
    expect(find.byKey(const Key('title')), findsWidgets);
    expect(find.byKey(const Key('amount')), findsWidgets);

    // verify by transaction title
    expect(find.text('Adidas shoes').first, findsOneWidget);
  });
}
