import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Beer extends StatefulWidget {
  double capacity;
  int cuantity;
  final void Function(double cuantityToAdd) addAction;
  final void Function(double cuantityToRemove) removeAction;

  Beer({
    Key key,
    this.capacity,
    this.addAction,
    this.removeAction,
    this.cuantity,
  });

  @override
  _BeerState createState() => _BeerState();
}

class _BeerState extends State<Beer> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(-5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: ListTile(
        //Sumar
        trailing: GestureDetector(
          onTap: () => {widget.addAction(widget.capacity)},
          child: Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            width: 60,
            height: 60,
            child: Icon(Icons.add, color: Colors.white, size: 40),
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
              color: Theme.of(context).primaryColorDark,
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            width: 60,
            height: 60,
            child: Icon(Icons.remove, color: Colors.white, size: 40),
          ),
        ),
        // Información
        title: Center(
          // child: Text("${widget.capacity} // cantidad: $amount"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Imagen
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text("Imagen"),
              ),
              // La info en si
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${widget.capacity}L",
                    // style: Theme.of(context).textTheme.headline2,
                    style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Cantidad:",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.cuantity.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
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
