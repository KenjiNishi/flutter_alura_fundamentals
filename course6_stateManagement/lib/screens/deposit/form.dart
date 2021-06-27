import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _title = 'Deposit';
const _dicaCampoValor = '00.00';
const _rotuloCampoValor = 'Value';
const _textoBotaoConfirmar = 'Confirm';

class DepositForm extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaDeposito(BuildContext context) {
    final double value = double.tryParse(_controladorCampoValor.text);
    if (_validaDeposito(value)) {
      _atualizaEstado(context, value);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final preenchido = valor != null;
    return preenchido;
  }

  _atualizaEstado(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
