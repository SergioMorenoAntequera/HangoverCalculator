import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Beer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _totalDrinks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // body:
      body: Stack(
        children: <Widget>[
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
                Beer(key: UniqueKey(), capacity: 0.25),
                Beer(key: UniqueKey(), capacity: 0.33),
                Beer(key: UniqueKey(), capacity: 0.50),
                Beer(key: UniqueKey(), capacity: 1.00),
              ],
            ),
          ),

          // Position absolute Thingy
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xffFFAB99),
              padding: EdgeInsets.all(20),
              child: Row(
                // Total y total de litros a la izquierda
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("TOTAL"),
                      Text(this._totalDrinks.toString()),
                    ],
                  ),
                  RaisedButton(
                    child: Text("PRA"),
                    onPressed: (null),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar appbar = new AppBar(
    title: Text("Hangover Calculator"),
  );
}
