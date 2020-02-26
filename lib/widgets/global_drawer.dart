import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/userListing_screen.dart';

class GlobalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildDrawerHead(),
          _buildHomeTile(context),
          _buildUserListingTile(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHead() {
    return UserAccountsDrawerHeader(
      accountName: Text('Admin'),
      accountEmail: Text('admin@kriov.in'),
    );
  }

  Widget _buildHomeTile(BuildContext context) {
    return ListTile(
      leading: Icon(HomeScreen.routeIcon),
      title: Text(HomeScreen.routeHeader),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      },
    );
  }

  Widget _buildUserListingTile(BuildContext context) {
    return ListTile(
      leading: Icon(UserListingScreen.routeIcon),
      title: Text(UserListingScreen.routeHeader),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(UserListingScreen.routeName);
      },
    );
  }
}
