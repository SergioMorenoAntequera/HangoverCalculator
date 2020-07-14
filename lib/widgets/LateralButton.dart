import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LateralButton extends StatelessWidget {
  bool positive;
  int amount;

  LateralButton(this.positive, this.amount);

  @override
  Widget build(BuildContext context) {
    _controlQuantity() {
      if (positive) {
        this.amount++;
      } else {
        this.amount--;
      }
    }

    return GestureDetector(
      onTap: _controlQuantity(),
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.green,
          borderRadius: new BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        width: 60,
        height: 60,
        child: positive
            ? Icon(Icons.remove_circle_outline, color: Colors.white, size: 50)
            : Icon(Icons.add_circle_outline, color: Colors.white, size: 50),
      ),
    );
  }
}
