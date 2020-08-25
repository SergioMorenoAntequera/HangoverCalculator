import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/mainPage.dart';

class Beer {
  double cuantity;
  int amount;
  double price;
  String image;
  double totalAmount;

  Beer(this.cuantity, this.amount, this.price, this.image, this.totalAmount);

  //////////////////////////////////////
  // Add and remove beer from the amount
  addBeerAmount(int amountToAdd) {
    this.amount += amountToAdd;
    // Here we update it
    this.totalAmount += this.cuantity * amountToAdd;
    print("Adding to beer " +
        this.cuantity.toString() +
        " // " +
        amountToAdd.toString());
    print("Total:" + this.totalAmount.toString());
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
