import 'package:flutter/foundation.dart';

class Balance extends ChangeNotifier {
  final double value;
  Balance(this.value);

  @override
  String toString() {
    return 'R\$ $value';
  }
}
