import 'package:flutter/material.dart';

import './product_edit.dart';
import '../widgets/UI elements/colordividerline.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage(this.updateProduct, this.deleteProduct, this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Dismissible(
            key: Key(products[index]['title']),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteProduct(index);
              }
            },
            background: Container(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]['image']),
                  ),
                  subtitle: Text('\$${products[index]['price'].toString()}'),
                  title: Text(products[index]['title']),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ProductEditPage(
                              product: products[index],
                              updateProduct: updateProduct,
                              productIndex: index,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                ColorDividerLine(),
              ],
            ),
          ),
      itemCount: products.length,
    );
  }
}
