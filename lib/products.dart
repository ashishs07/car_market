import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/car.jpg',
          ),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Container(
            child: Center(
              child: Text('No Products added.'),
            ));
  }
}
