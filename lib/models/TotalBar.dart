import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TotalBar extends ChangeNotifier {
  double totalCuantity = 0;

  void addCuantity(double toAdd) {
    this.totalCuantity += toAdd;
    this.totalCuantity = num.parse(this.totalCuantity.toStringAsFixed(2));
    notifyListeners();
  }

  void removeCuantity(double toRemove) {
    this.totalCuantity += toRemove;
    this.totalCuantity = num.parse(this.totalCuantity.toStringAsFixed(2));
    notifyListeners();
  }

  void resetCuantity() {
    totalCuantity = 0;
  }
}
