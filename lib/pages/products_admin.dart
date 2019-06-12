import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ManagerAdmin extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ManagerAdmin(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Admin Controls'),
              ),
              ListTile(
                title: Text('Go to Main Page'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manager'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(addProduct),
            ProductListPage(deleteProduct),
          ],
        ),
      ),
    );
  }
}
