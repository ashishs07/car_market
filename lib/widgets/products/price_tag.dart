import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      style: TextStyle(color: Colors.purple),
    );
  }
}
