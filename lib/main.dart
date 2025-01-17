import 'package:flutter/material.dart';
import 'package:hangover_calculator/models/TotalBar.dart';
import 'package:hangover_calculator/screens/mainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TotalBar(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: MainPage(),
    );
  }

  final ThemeData appTheme = new ThemeData(
    // Define the default brightness and colors.
    // brightness: Brightness.dark,
    primaryColor: Color(0xFFFFF4E3),
    backgroundColor: Color(0xFFFFCDAB),
    primaryColorDark: Color(0xFF5D5D5A),
    accentColor: Color(0xFFFFA45C),

    // Define the default font family.
    fontFamily: 'Roboto',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // Beer Header
      headline2: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
