import 'package:alura_crashlytics/components/centered_message.dart';
import 'package:alura_crashlytics/components/waiting.dart';
import 'package:alura_crashlytics/http/web_clients/transaction_webclient.dart';
import 'package:alura_crashlytics/models/transferencia.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {

  final TransactionWebClient _transactionWebClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    //transactions.add(Transaction(100.0, Contato(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transferencia>>(
        future: _transactionWebClient.findAll(),
        builder: (context, snapshot) {
          //final List<Transaction>? transactions = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Waiting();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              // Verifica se retornou dados e não um 404 por exemplo.
              if (snapshot.hasData) {
                final List<Transferencia>? transactions = snapshot.data;
                // Verifica  se tem registros.
                if (transactions != null && transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transferencia transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.numeroDaConta.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );
                }
              }
              return CenteredMessage("Nenhuma transação encontrada");
          }
          return CenteredMessage("Erro Desconhecido");
        },
      ),
    );
  }
}
