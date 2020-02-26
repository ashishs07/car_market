/* import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ManagerAdmin extends StatelessWidget {
  Widget _buildAdminDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Admin Controls'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Go to Main Page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }

  Widget _buildMainAppBar() {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildAdminDrawer(context),
        appBar: _buildMainAppBar(),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}
 */
