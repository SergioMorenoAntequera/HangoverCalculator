import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TotalBar extends ChangeNotifier {
  double totalCuantity = 0;

  addCuantity(double toAdd) {
    this.totalCuantity += toAdd;
    prepareTotalCuantityToShow();
    notifyListeners();
  }

  removeCuantity(double toRemove) {
    this.totalCuantity += toRemove;
    prepareTotalCuantityToShow();
    notifyListeners();
  }

  resetCuantity() {
    totalCuantity = 0;
  }

  prepareTotalCuantityToShow() {
    this.totalCuantity = num.parse(this.totalCuantity.toStringAsFixed(2));
  }
}
