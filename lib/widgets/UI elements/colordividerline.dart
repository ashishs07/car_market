import 'package:flutter/material.dart';

class ColorDividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 1.0,
      color: Theme.of(context).primaryColor,
    );
  }
}
