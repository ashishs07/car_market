import 'package:flutter/material.dart';

//import 'package:course_project/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      // color: Colors.grey,
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image1']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  //child: Container(child: Image.asset(products[index]['image1']),height: 140.0,),
                  onPressed: () {
                    Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        deleteProduct(index);
                      }
                    });
                  }),
              FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  deleteProduct(index);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text('No Vehicles added.'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
