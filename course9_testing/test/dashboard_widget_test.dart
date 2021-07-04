import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets("Checks if the Dashboard image is present",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets("Should display the transfer feature", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final transferFeatureItem = find.byWidgetPredicate((widget) {
      if (widget is FeatureItem) {
        return widget.name == 'Transfer' &&
            widget.icon == Icons.monetization_on;
      }
      return false;
    });
    expect(transferFeatureItem, findsOneWidget);
  });

  testWidgets("Should display the transaction feed feature", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final transactionFeedFeatureIcon =
        find.widgetWithIcon(FeatureItem, Icons.description);
    final transactionFeedFeatureName =
        find.widgetWithText(FeatureItem, "Transaction Feed");
    expect(transactionFeedFeatureIcon, findsOneWidget);
    expect(transactionFeedFeatureName, findsOneWidget);
  });
}
