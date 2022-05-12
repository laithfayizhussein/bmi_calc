import 'package:flutter/material.dart';
import 'constents.dart';

class IconWidget extends StatelessWidget {
  // properties
  final IconData customIcon;
  final String label;
// constructor
  IconWidget({this.customIcon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          customIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: KLabelStyle),
      ],
    );
  }
}
