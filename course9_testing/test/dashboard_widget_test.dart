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
  testWidgets("Should display the first feature", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final feature = find.byType(FeatureItem);
    expect(feature, findsWidgets);
  });
}
