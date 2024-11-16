import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:esthelogy_redesign/main.dart';

void main() {
  testWidgets('Initial app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EsthologyApp());

    // Verify that the app starts with the HomePage
    expect(find.byType(HomePage), findsOneWidget);

    // Verify that we have the correct app bar title
    expect(find.text('Esthélogy'), findsOneWidget);

    // Verify that we have the correct bottom navigation items
    expect(find.text('Diary'), findsOneWidget);
    expect(find.text('Community'), findsOneWidget);
    expect(find.text('Discovery'), findsOneWidget);
    expect(find.text('Quiz'), findsOneWidget);

    // Verify that we start on the DiaryPage
    expect(find.text('My Beauty Diary'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Write about your skincare journey today...'), findsOneWidget);

    // Tap the Community tab and verify its content
    await tester.tap(find.text('Community'));
    await tester.pumpAndSettle();
    expect(find.text('Community Page'), findsOneWidget);

    // Tap the Discovery tab and verify its content
    await tester.tap(find.text('Discovery'));
    await tester.pumpAndSettle();
    expect(find.text('Ask anything about Beauty'), findsOneWidget);

    // Tap the Quiz tab and verify its content
    await tester.tap(find.text('Quiz'));
    await tester.pumpAndSettle();
    expect(find.text('Discover more about yourself'), findsOneWidget);
  });
}