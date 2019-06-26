import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/products/products.dart';
import '../scoped-models/product_smodel.dart';

class ProductsPage extends StatelessWidget {
  Widget _buildMainDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  Widget _buildMainAppBar() {
    return AppBar(
      title: Text('Car Listing'),
      actions: <Widget>[
        ScopedModelDescendant<ProductSModel>(
          builder: (BuildContext context, Widget child, ProductSModel model) {
            return IconButton(
              icon: Icon(model.displayFavouritesOnly
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.toggledisplaymode();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildMainDrawer(context),
      appBar: _buildMainAppBar(),
      body: Products(),
    );
  }
}
