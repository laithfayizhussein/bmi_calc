import 'package:flutter/material.dart';

class DryWidget extends StatelessWidget {
  // here was the key i removed it and i will create constructor fun to custom the color

  // 1 i will add properties to class
  final Color customColor;
  //this child to customize the widget
  final Widget cardChild;
  // this for passing the fun as properties
  final Function onPress;
  // 2 the constructor part
  DryWidget({this.customColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    // i wrap the contaner into gesture button to clean the code in input page
    return GestureDetector(
      onTap: onPress, // need to explain
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: customColor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
