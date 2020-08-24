import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beer extends StatefulWidget {
  double capacity;
  int cuantity;
  final void Function(double capacityToAdd, int cuantityToAdd) addAction;
  final void Function(double capacityToRemove, int cuantityToRemove)
      removeAction;

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
  double price = 2;

  @override
  Widget build(BuildContext context) {
    // Right Button
    var addButton = GestureDetector(
      onTap: () => {widget.addAction(widget.capacity, 1)},
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
    );
    // Left Button
    var minusButton = GestureDetector(
      onTap: () => {
        setState(() {
          if (this.amount > 0) this.amount--;
        }),
        widget.removeAction(widget.capacity, 1)
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
    );
    // Information in the middle
    var middleInformation = Center(
      // child: Text("${widget.capacity} // cantidad: $amount"),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Imagen
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: getImage(),
              width: 70,
            ),
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
              Row(
                children: [
                  Text(
                    widget.cuantity.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: _showPriceDialog,
                    child: Text(
                      "$price€",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );

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
        // Plus
        trailing: addButton,
        // Minus
        leading: minusButton,
        // Information
        title: middleInformation,
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////
  //AUXILIAR METHODS //////////////////////////////////////////////////////////

  // To get and place the image for the beer
  AssetImage getImage() {
    var auxString = widget.capacity.toString().replaceAll(".", "");
    if (auxString.length < 3) {
      auxString += "0";
    }
    return AssetImage("assets/images/" + auxString + ".PNG");
  }

  // To show the price dialog
  void _showPriceDialog() async {
    // var preferencesPrice = await getPriceOrSetDefault();
    // print(preferencesPrice);
    // setState(() {
    //   price = preferencesPrice;
    // });

    final myController = TextEditingController();

    var priceDialog = AlertDialog(
      title: Text("Establecer precio"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            // controller: myController,
            // initialValue: this.price.toString(),
            decoration: InputDecoration(
              hintText: 'Introduce el nuevo precio',
            ),
          )
        ],
      ),
      actions: [
        RaisedButton(
          onPressed: () => {Navigator.pop(context)},
          child: Text("Cancelar"),
        ),
        RaisedButton(
          onPressed: () => {},
          child: Text("Confirmar"),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return priceDialog;
      },
    );
  }

  // To get the price or set the default one
  Future<double> getPriceOrSetDefault() async {
    String priceKey = "price" + widget.capacity.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double beerPrice = prefs.getDouble(priceKey);

    // return Future.delayed(Duration(seconds: 1), () => "DESDE MI CASA CHAVALIN");
    if (beerPrice == null) {
      prefs.setDouble(priceKey, 1.0);
      return 1.0;
    }

    return beerPrice;
  }

  // To set a new price when we close the dialog (mainly)
  void setPrice(double price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("price" + widget.capacity.toString(), price);
  }
}
