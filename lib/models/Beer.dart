import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hangover_calculator/models/TotalBar.dart';
import 'package:provider/provider.dart';

class Beer {
  double cuantity;
  int amount;
  double price;
  String image;
  Map totalCuantity;

  Beer(this.cuantity, this.amount, this.price, this.image, this.totalCuantity);

  //////////////////////////////////////
  // Add and remove beer from the amount
  addBeerAmount(int amountToAdd, BuildContext context) {
    this.amount += amountToAdd;
    // totalCuantity['value'] += ;
    Provider.of<TotalBar>(context, listen: false)
        .addCuantity(amountToAdd * cuantity);
    Provider.of<TotalBar>(context, listen: false).addPrice(amountToAdd * price);
  }

  removeBeerAmount(int amountToRemove, BuildContext context) {
    if (amountToRemove <= this.amount) {
      this.amount -= amountToRemove;
      Provider.of<TotalBar>(context, listen: false)
          .removeCuantity(amountToRemove * cuantity);
      Provider.of<TotalBar>(context, listen: false)
          .removePrice(amountToRemove * price);
    }
  }

  setPrice(double newPrice) {
    this.price = newPrice;
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
    var priceStringAux = this.price.toString();
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
