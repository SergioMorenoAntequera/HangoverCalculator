import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TotalBar extends ChangeNotifier {
  double totalCuantity = 0;
  double totalPrice = 0;

  addCuantity(double toAdd) {
    this.totalCuantity += toAdd;
    prepareTotalCuantityToShow();
    notifyListeners();
  }

  removeCuantity(double toRemove) {
    this.totalCuantity -= toRemove;
    prepareTotalCuantityToShow();
  }

  resetCuantity() {
    totalCuantity = 0;
  }

  addPrice(double toAdd) {
    totalPrice += toAdd;
    prepareTotalPriceToShow();
    notifyListeners();
  }

  removePrice(double toRemove) {
    totalPrice -= toRemove;
    prepareTotalPriceToShow();
    notifyListeners();
  }

  prepareTotalCuantityToShow() {
    this.totalCuantity = num.parse(this.totalCuantity.toStringAsFixed(2));
  }

  prepareTotalPriceToShow() {
    this.totalPrice = num.parse(this.totalPrice.toStringAsFixed(2));
  }
}
