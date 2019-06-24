import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/UI elements/product_title.dart';
import '../widgets/products/product_location.dart';
import '../scoped-models/product_smodel.dart';
import '../models/productmodel.dart';

class ProductPage extends StatelessWidget {
  final int index;

  ProductPage(this.index);

  Widget _buildScaffold(BuildContext context, ProductModel products) {
    return Scaffold(
      appBar: AppBar(title: Text(products.title)),
      body: Column(
        children: <Widget>[
          Image.asset(products.image),
          ProductTitle(products.title),
          Text(
            products.description,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          ProductLocation('United Kingdom'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, ProductSModel model) {
        return _buildScaffold(context, model.products[index]);
      }),
    );
  }
}

/* _showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Go Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  }),
            ],
          );
        });
  }
*/
