import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';

Future<void> clickTransferFeatureItem(
    WidgetTester tester, String label, IconData icon) async {
  final transferFeatureItem = find
      .byWidgetPredicate((widget) => featureItemMatcher(widget, label, icon));
  expect(transferFeatureItem, findsOneWidget);
  return tester.tap(transferFeatureItem);
}
