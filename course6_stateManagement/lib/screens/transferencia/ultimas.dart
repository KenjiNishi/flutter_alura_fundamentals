import 'package:bytebank/models/transfers.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = {
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Ultimas Transferencias'),
        Consumer<Transfers>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias =
                transferencias.transfers.reversed.toList();
            return ListView.builder(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: transferencias.transfers.length > 2
                  ? 2
                  : transferencias.transfers.length,
              itemBuilder: (context, indice) {
                if (transferencias.transfers.length == 0)
                  return SemTransferenciaCadastrada();
                return ItemTransferencia(_ultimasTransferencias[indice]);
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
          child: Text(
            'Transfer',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(48),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text('You didnt register any transfer.'),
      ),
    );
  }
}
