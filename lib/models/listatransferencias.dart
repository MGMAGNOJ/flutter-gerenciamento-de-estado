import 'package:alura_crashlytics/models/transferencia.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends ChangeNotifier {
  final List <Transferencia> _listaDeTransferencias =  [];

  List<Transferencia> get transaction => _listaDeTransferencias;

  add(Transferencia _transf) {
    _listaDeTransferencias.add(_transf);
    notifyListeners();
  }
}