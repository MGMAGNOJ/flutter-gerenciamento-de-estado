import 'package:alura_crashlytics/cofiguration/constants.dart';
import 'package:alura_crashlytics/components/editor.dart';
import 'package:alura_crashlytics/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrmDeposito extends StatelessWidget {

  final TextEditingController _controllerValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
     _controllerValor;
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.AppBarDepositoTittleText),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controllerValor,
                rotulo: Constants.EditorRotulo,
                dica: Constants.EditorDica,
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () {
                _criaDeposito(context);
              },
              child: const Text(Constants.BtnConfirmarText),
            ),
          ],
        ),
      ),
    );
  }


  _criaDeposito(context){
    final double? _valor = double.tryParse(_controllerValor.text);
    if (_validaDeposito(_valor)){
      _atualizaEstado(context, _valor);
      Navigator.of(context).pop();
    }

  }

  bool _validaDeposito(valor){
    final _campoPreenchido = valor != null;
    if (_campoPreenchido){
      return true;
    } else {
      return false;
    }
  }

  _atualizaEstado(context, valor){
    Provider.of<Saldo>(context, listen: false).add(valor);
  }
}



