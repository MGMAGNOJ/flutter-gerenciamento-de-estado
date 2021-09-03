import 'package:alura_crashlytics/cofiguration/constants.dart';
import 'package:alura_crashlytics/screens/dashboard/saldo.dart';
import 'package:alura_crashlytics/screens/contacts_list/contacts_list.dart';
import 'package:alura_crashlytics/screens/forms/frm_deposito.dart';
import 'package:alura_crashlytics/screens/transactions_list/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard ByteBankApp"),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      child: Text(Constants.AppBarDepositoTittleText),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FrmDeposito();
                        }));
                      })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text(Constants.AppBarNovaTransfTittleText),
                  onPressed: () {
                    _showContactList(context);
                  },
                ),
              ),
            ],
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text(Constants.AppBarListaDeTransfTittleText),
                  onPressed: () {
                    _showTransferenciasEfetuadas(context);
                  },
                ),
              ),
            ],
          ),
          // este endentamento permite rotação lateral.
          // Container.. Height / ListView.. ScrollDirection

        ],
      ),
    );
  }

  void _showContactList(BuildContext context) {
    // Test Crashlytics
    //FirebaseCrashlytics.instance.crash();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ContactsList();
        },
      ),
    );
  }

  void _showTransferenciasEfetuadas(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TransactionsList();
        },
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String _labelnome;
  final IconData _iconData;

  final Function onTapFeatureItem;

  const _FeatureItem(
    this._labelnome,
    this._iconData, {
    @required required this.onTapFeatureItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Envolver o Widget com funções de animaçao
      child: Material(
        // Neste caso o Material determina as cores
        color: Theme.of(context).primaryColor,

        // Envolver o Widget com funções de click
        child: InkWell(
          // Rota de navegação para a próxima página
          onTap: () {
            onTapFeatureItem();
          },
          child: Container(
            // Padding interno do container
            padding: EdgeInsets.all(8.0),
            height: 130,
            width: 130,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _iconData,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  _labelnome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
