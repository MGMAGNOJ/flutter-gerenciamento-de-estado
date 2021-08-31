import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;
  Saldo (this.valor);

  @override
  String toString() {
    return 'Saldo: R\$ $valor';
  }

  void add(double valor) {
    this.valor += valor;
    notifyListeners();
  }

  void sub(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

}