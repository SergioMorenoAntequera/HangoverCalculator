import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/LateralButton.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        child: ListView(
          children: <Widget>[
            Beer(
              capacity: 0.25,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appbar = new AppBar(
    title: Text("Alcoholico"),
  );
}

class Beer extends StatefulWidget {
  double capacity;
  Beer({Key key, this.capacity});

  @override
  _BeerState createState() => _BeerState();
}

class _BeerState extends State<Beer> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: LateralButton(false),
      leading: LateralButton(true),
      title: Center(
        child: Text("${widget.capacity} // cantidad: ${amount}"),
      ),
    );
  }
}
