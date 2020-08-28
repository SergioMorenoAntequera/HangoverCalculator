import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TotalBar extends ChangeNotifier {
  double totalCuantity = 0;

  void addCuantity(double toAdd) {
    this.totalCuantity += toAdd;
    notifyListeners();
  }

  void removeCuantity(double toRemove) {
    this.totalCuantity += toRemove;
    notifyListeners();
  }

  void resetCuantity() {
    totalCuantity = 0;
  }
}
