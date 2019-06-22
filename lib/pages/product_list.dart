import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage(this.deleteProduct, this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
            leading: Image.asset(products[index]['image']),
            title: Text(products[index]['title']),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
      itemCount: products.length,
    );
  }
}
