import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Beer extends StatefulWidget {
  double capacity;
  final void Function(double amountToAdd) addAction;
  final void Function(double amountToRemove) removeAction;

  Beer({Key key, this.capacity, this.addAction, this.removeAction});

  @override
  _BeerState createState() => _BeerState();
}

class _BeerState extends State<Beer> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: ListTile(
        //Sumar
        trailing: GestureDetector(
          onTap: () => {
            setState(() {
              this.amount++;
            }),
            widget.addAction(widget.capacity)
          },
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.green[700],
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            width: 60,
            height: 60,
            child:
                Icon(Icons.add_circle_outline, color: Colors.white, size: 50),
          ),
        ),
        // Restar
        leading: GestureDetector(
          onTap: () => {
            setState(() {
              if (this.amount > 0) this.amount--;
            }),
            widget.removeAction(widget.capacity)
          },
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            width: 60,
            height: 60,
            child: Icon(Icons.remove_circle_outline,
                color: Colors.white, size: 50),
          ),
        ),
        // Información
        title: Center(
          // child: Text("${widget.capacity} // cantidad: $amount"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text("Imagen"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.capacity}L",
                    // style: Theme.of(context).textTheme.headline2,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Cantidad:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$amount",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
