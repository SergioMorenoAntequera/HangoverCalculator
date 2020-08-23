import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Beer.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                        Beer(
                          key: UniqueKey(),
                          capacity: 0.25,
                          addAction: addDrinks,
                          removeAction: removeDrinks,
                          cuantity: amount025,
                        ),
                        Beer(
                          key: UniqueKey(),
                          capacity: 0.33,
                          addAction: addDrinks,
                          removeAction: removeDrinks,
                          cuantity: amount033,
                        ),
                        Beer(
                          key: UniqueKey(),
                          capacity: 0.50,
                          addAction: addDrinks,
                          removeAction: removeDrinks,
                          cuantity: amount050,
                        ),
                        Beer(
                          key: UniqueKey(),
                          capacity: 1.00,
                          addAction: addDrinks,
                          removeAction: removeDrinks,
                          cuantity: amount100,
                        ),
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
                        Text(
                          "TOTAL",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "${formatTotal()}L",
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
                  // RaisedButton(
                  //   child: Text("RESET"),
                  //   onPressed: resetDrinks,
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addDrinks(double amount, int cuantity) {
    setState(() {
      _totalDrinks += amount;
      switch (amount.toString()) {
        case "0.25":
          amount025 += cuantity;
          break;
        case "0.33":
          amount033 += cuantity;
          break;
        case "0.5":
          amount050 += cuantity;
          break;
        case "1.0":
          amount100 += cuantity;
          break;
        default:
      }
    });
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
