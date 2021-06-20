import 'package:flutter/material.dart';
import 'package:flutter_alura_fundamentals/components/transfer_item.dart';
import 'package:flutter_alura_fundamentals/models/transfer.dart';

final _title = "Transfers";

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          Transfer transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.pushNamed(context, '/new');
          future.then((receivedTransfer) {
            if (receivedTransfer != null) {
              _updateList(receivedTransfer);
            }
          });
        },
      ),
    );
  }

  void _updateList(Transfer receivedTransfer) {
    debugPrint('Adding to List: $receivedTransfer');
    setState(() {
      widget._transfers.add(receivedTransfer);
    });
    var aaa = widget._transfers.length;
    debugPrint('List size: $aaa');
  }
}
