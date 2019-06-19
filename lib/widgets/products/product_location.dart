import 'package:flutter/material.dart';

class ProductLocation extends StatelessWidget {
  final String location;

  ProductLocation(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(location),
    );
  }
}
