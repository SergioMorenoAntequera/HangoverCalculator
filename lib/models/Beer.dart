import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Beer {
  double cuantity;
  int amount;
  double price;
  String image;
  Map totalCuantity;

  Beer(this.cuantity, this.amount, this.price, this.image, this.totalCuantity);

  //////////////////////////////////////
  // Add and remove beer from the amount
  addBeerAmount(int amountToAdd) {
    this.amount += amountToAdd;
    // Here we update it
    totalCuantity['value'] += amountToAdd * cuantity;
    print(totalCuantity['value']);
  }

  removeBeerAmount(int amountToRemove) {
    if (amountToRemove <= this.amount) {
      this.amount -= amountToRemove;
    }
  }

  ///////////////////////////////////
  // Get the full price and cuantity
  double getTotalPrice() {
    return price * amount;
  }

  double getTotalCuantity() {
    return cuantity * amount;
  }

  String getPriceToString() {
    var priceStringAux = price.toString();
    while (priceStringAux.length < 4) {
      priceStringAux += "0";
    }
    return priceStringAux;
  }

  AssetImage getImageAsset() {
    var auxString = this.cuantity.toString().replaceAll(".", "");
    if (auxString.length < 3) {
      auxString += "0";
    }
    return AssetImage("assets/images/" + auxString + ".PNG");
  }
}
