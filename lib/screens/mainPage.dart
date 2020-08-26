import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangover_calculator/models/Beer.dart';
import '../widgets/BeerTile.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int amount025 = 0;
  int amount033 = 0;
  int amount050 = 0;
  int amount100 = 0;
  double _totalDrinks = 0;

  // static double totalAmount = 0;
  // We need to pass a map to use it as a
  static Map<String, double> totalCuantity = {'value': 0};

  Beer beer025 = new Beer(0.25, 0, 1, "025", totalCuantity);
  Beer beer033 = new Beer(0.33, 0, 1, "033", totalCuantity);
  Beer beer050 = new Beer(0.50, 0, 1, "050", totalCuantity);
  Beer beer100 = new Beer(1.00, 0, 1, "100", totalCuantity);

  @override
  Widget build(BuildContext context) {
    AppBar appbar = new AppBar(
      title: Text("Hangover Calculator"),
    );

    Container fab = new Container(
      height: 85,
      width: 85,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: resetDrinks,
          backgroundColor: Theme.of(context).backgroundColor,
          child: Icon(
            Icons.refresh,
            size: 40,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appbar,
      floatingActionButton: fab,
      backgroundColor: Theme.of(context).backgroundColor,

      // body:
      body: Stack(
        children: <Widget>[
          // App background I guess
          Container(
            child: ListView(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      color: Theme.of(context).primaryColor,
                      height: 160,
                      width: 900,
                    ),
                    Column(
                      children: [
                        // Alcholico title on top of the list
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Alcoholico",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                        BeerTile(
                          key: UniqueKey(),
                          beer: beer025,
                        ),
                        BeerTile(
                          key: UniqueKey(),
                          beer: beer033,
                        ),
                        BeerTile(
                          key: UniqueKey(),
                          beer: beer050,
                        ),
                        BeerTile(
                          key: UniqueKey(),
                          beer: beer100,
                        ),
                        // BeerTile(
                        //   key: UniqueKey(),
                        //   capacity: 0.33,
                        //   addAction: addDrinks,
                        //   removeAction: removeDrinks,
                        //   cuantity: amount033,
                        // ),
                        // BeerTile(
                        //   key: UniqueKey(),
                        //   capacity: 0.50,
                        //   addAction: addDrinks,
                        //   removeAction: removeDrinks,
                        //   cuantity: amount050,
                        // ),
                        // BeerTile(
                        //   key: UniqueKey(),
                        //   capacity: 1.00,
                        //   addAction: addDrinks,
                        //   removeAction: removeDrinks,
                        //   cuantity: amount100,
                        // ),
                        SizedBox(
                          height: 115,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Position absolute Thingy
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColorDark,
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 13, right: 13),
              child: Row(
                // Total y total de litros a la izquierda
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 0, right: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Total TEXTO
                        Text(
                          "TOTAL",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Total NUMERO
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "${totalCuantity['value']}",
                            style: TextStyle(
                              fontSize: 40,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addDrinks(double amount, int cuantity) {
    // setState(() {
    //   _totalDrinks += amount;
    //   switch (amount.toString()) {
    //     case "0.25":
    //       amount025 += cuantity;
    //       break;
    //     case "0.33":
    //       amount033 += cuantity;
    //       break;
    //     case "0.5":
    //       amount050 += cuantity;
    //       break;
    //     case "1.0":
    //       amount100 += cuantity;
    //       break;
    //     default:
    //   }
    // });
  }

  void removeDrinks(double amount, int cuantity) {
    setState(() {
      if (_totalDrinks >= amount) {
        switch (amount.toString()) {
          case "0.25":
            if (amount025 - cuantity >= 0) {
              amount025 -= cuantity;
              _totalDrinks -= amount;
            }
            break;
          case "0.33":
            if (amount033 - cuantity >= 0) {
              amount033 -= cuantity;
              _totalDrinks -= amount;
            }
            break;
          case "0.5":
            if (amount050 - cuantity >= 0) {
              amount050 -= cuantity;
              _totalDrinks -= amount;
            }
            break;
          case "1.0":
            if (amount100 - cuantity >= 0) {
              amount100 -= cuantity;
              _totalDrinks -= amount;
            }
            break;
          default:
        }
      }
    });
    if (amount025 == 0 && amount033 == 0 && amount050 == 0 && amount100 == 0) {
      _totalDrinks = 0;
    }
  }

  resetDrinks() {
    setState(() {
      _totalDrinks = 0;
      // totalAmount['value'] = 0;
      beer025.amount = 0;
      beer033.amount = 0;
      beer050.amount = 0;
      beer100.amount = 0;
      // beer025.totalAmount = 0;
      amount025 = 0;
      amount033 = 0;
      amount050 = 0;
      amount100 = 0;
    });
  }

  // To avoid problems with periodic numbers
  String formatTotal() {
    if (this._totalDrinks.toString().length < 12)
      return this._totalDrinks.toString();

    int indexAux = this._totalDrinks.toString().indexOf(".");
    return this._totalDrinks.toString().substring(0, indexAux + 3);
  }
}
