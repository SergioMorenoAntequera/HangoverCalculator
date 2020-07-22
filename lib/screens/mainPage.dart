import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Beer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
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
    );
  }

  AppBar appbar = new AppBar(
    title: Text("Hangover Calculator"),
  );
}
