import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LateralButton extends StatefulWidget {
  final bool positive;
  int amount;
  LateralButton({this.positive, this.amount});

  @override
  _LateralButtonState createState() => _LateralButtonState(this.amount);
}

class _LateralButtonState extends State<LateralButton> {
  int amount;
  _LateralButtonState(int amount) {
    this.amount = amount;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _controlQuantity,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.green,
          borderRadius: new BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        width: 60,
        height: 60,
        child: widget.positive
            ? Icon(Icons.remove_circle_outline, color: Colors.white, size: 50)
            : Icon(Icons.add_circle_outline, color: Colors.white, size: 50),
      ),
    );
  }

  _controlQuantity() {
    setState(() {
      if (widget.positive) {
        this.amount++;
      } else {
        if (this.amount >= 0) {
          this.amount--;
        }
      }
    });
  }
}
