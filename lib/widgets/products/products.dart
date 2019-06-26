import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './products_card.dart';
import '../../models/productmodel.dart';
import '../../scoped-models/main_smodel.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<ProductModel> products) {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Container();
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
