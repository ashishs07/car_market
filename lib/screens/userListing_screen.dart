import 'package:flutter/material.dart';

import '../widgets/global_drawer.dart';

class UserListingScreen extends StatelessWidget {
  static const routeName = '/user-listing';
  static const routeHeader = 'My Listing';
  static const routeIcon = Icons.person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GlobalDrawer(),
      appBar: AppBar(
        title: Text(routeHeader),
      ),
    );
  }
}
