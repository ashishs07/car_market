import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: () {
        addProduct({
          'title': 'Product',
          'image1': 'assets/food.jpg',
          'image2': 'assets/car.jpg'
        });
      },
      child: Text('Add Test'),
    );
  }
}
