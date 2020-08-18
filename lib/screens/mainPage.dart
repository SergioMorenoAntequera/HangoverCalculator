import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Beer.dart';

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
    return Scaffold(
      appBar: appbar,
      // body:
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 300,
            height: 300,
            child: Text("TEST"),
          ),

          // App background I guess
          Container(
            color: Colors.grey[50],
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Alcoholico",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          ),

          // Position absolute Thingy
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xffFFAB99),
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
                          // style: Theme.of(context).textTheme.headline2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "${formatTotal()}L",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text("RESET"),
                    onPressed: resetDrinks,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addDrinks(double amount) {
    setState(() {
      _totalDrinks += amount;
      switch (amount.toString()) {
        case "0.25":
          amount025++;
          break;
        case "0.33":
          amount033++;
          break;
        case "0.5":
          amount050++;
          break;
        case "1.0":
          amount100++;
          break;
        default:
      }
    });
  }

  removeDrinks(double amount) {
    setState(() {
      if (_totalDrinks >= amount) {
        _totalDrinks -= amount;
      }
    });
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

  AppBar appbar = new AppBar(
    title: Text("Hangover Calculator"),
  );
}
