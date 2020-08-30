import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangover_calculator/models/Beer.dart';
import 'package:hangover_calculator/models/TotalBar.dart';
import 'package:provider/provider.dart';
import '../widgets/BeerTile.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // We need to pass a map to use it as a
  static Map<String, double> totalCuantity = {'value': 0};

  Beer beer025 = new Beer(0.25, 0, 2.5, "025", totalCuantity);
  Beer beer033 = new Beer(0.33, 0, 2.8, "033", totalCuantity);
  Beer beer050 = new Beer(0.50, 0, 4, "050", totalCuantity);
  Beer beer100 = new Beer(1.00, 0, 1.8, "100", totalCuantity);

  @override
  Widget build(BuildContext context) {
    AppBar appbar = new AppBar(
      title: Text("Hangover Calculator"),
    );

    //Button to Reset
    Container fab = new Container(
      height: 70,
      width: 70,
      child: Padding(
        padding: EdgeInsets.all(0),
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
      // floatingActionButton: fab,
      backgroundColor: Theme.of(context).backgroundColor,

      // body:
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              children: <Widget>[
                Stack(
                  children: [
                    // App background at the top
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

          // Total bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColorDark,
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 13, right: 13),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            // CONSUMER (Preferences)
                            child: Consumer<TotalBar>(
                              builder: (context, bar, child) {
                                return Text(
                                  "${bar.totalCuantity}",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: fab,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void updateTotal() {
    print("Metodo de dentro de mainPage");
  }

  resetDrinks() {
    Provider.of<TotalBar>(context, listen: false).resetCuantity();
    setState(() {
      totalCuantity['value'] = 0;
      beer025.amount = 0;
      beer033.amount = 0;
      beer050.amount = 0;
      beer100.amount = 0;
    });
  }
}
