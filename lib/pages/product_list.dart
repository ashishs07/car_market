import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../widgets/UI elements/colordividerline.dart';
//import '../models/productmodel.dart';
import '../scoped-models/product_smodel.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(
      BuildContext context, int index, ProductSModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductSModel>(
        builder: (BuildContext context, Widget child, ProductSModel model) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => Dismissible(
              key: Key(model.products[index].title),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
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
                      backgroundImage: AssetImage(model.products[index].image),
                    ),
                    subtitle:
                        Text('\$${model.products[index].price.toString()}'),
                    title: Text(model.products[index].title),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  ColorDividerLine(),
                ],
              ),
            ),
        itemCount: model.products.length,
      );
    });
  }
}
