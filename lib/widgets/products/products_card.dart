import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../UI elements/product_location.dart';
import '../UI elements/product_title.dart';
import '../../models/productmodel.dart';
import '../../scoped-models/main_smodel.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProductTitle(product.title),
              SizedBox(
                width: 10.0,
              ),
              PriceTag(product.price.toString()),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          ProductLocation('United Kingdom'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString());
                },
              ),
              ScopedModelDescendant<MainModel>(
                builder: (BuildContext context, Widget child, MainModel model) {
                  return IconButton(
                    icon: Icon(model.products[productIndex].isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {
                      model.selectProduct(productIndex);
                      model.toggleProductFavouriteStatus();
                    },
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
