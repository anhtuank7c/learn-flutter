// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn/main.dart';

void main() {
  testWidgets('Quiz smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Learn());

    // Verify that our first question's answer containing Rose, Red, Blue, Green
    expect(find.text('Rose'), findsOneWidget);
    expect(find.text('Red'), findsOneWidget);
    expect(find.text('Blue'), findsOneWidget);
    expect(find.text('Green'), findsOneWidget);
    expect(find.text('Pickle'), findsNothing);

    // Tap the Rose answer and trigger a frame.
    await tester.tap(find.text('Rose'));
    await tester.pump();

    // Verify that our question index has been increamented
    expect(find.text('Fired rice'), findsOneWidget);
    expect(find.text('Pickle'), findsOneWidget);
    expect(find.text('Spring roll'), findsOneWidget);
    expect(find.text('Pho'), findsOneWidget);
    expect(find.text('Rose'), findsNothing);

    // Tap the Spring roll answer and trigger a frame.
    await tester.tap(find.text('Spring roll'));
    await tester.pump();

    // Verify that we reach the result screen
    expect(find.text('20 points'), findsOneWidget);
    expect(find.text('Pretty likeable'), findsOneWidget);

    // Reset Quiz by click on Reset Button which can find by key
    const resetBtn = Key('resetBtn');
    await tester.tap(find.byKey(resetBtn));
    await tester.pump();

    // Verify that our first question's answer containing Rose
    expect(find.text('Rose'), findsOneWidget);
  });
}
