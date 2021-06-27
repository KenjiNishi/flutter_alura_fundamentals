import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/foundation.dart';

class Transfers extends ChangeNotifier {
  final List<Transferencia> _transfers = [];

  List<Transferencia> get transfers => _transfers;

  add(Transferencia newTransfer) {
    transfers.add(newTransfer);
    notifyListeners();
  }
}
