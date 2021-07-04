import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should return the value when creating a transaction", () {
    final transaction = Transaction(null, 420, null);
    expect(transaction.value, 420);
  });
  test("Should fail when creating a transaction with value lesser than zero",
      () {
    expect(() => Transaction(null, 0, null), throwsAssertionError);
    expect(() => Transaction(null, -66, null), throwsAssertionError);
  });
}
