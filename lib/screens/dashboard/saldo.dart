import 'package:alura_crashlytics/models/saldo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaldoCard extends StatelessWidget {

  final Saldo saldo;
  SaldoCard(this.saldo);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          saldo.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
