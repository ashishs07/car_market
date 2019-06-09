import 'package:course_project/pages/home.dart';
import 'package:flutter/material.dart';

class ManagerAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Manager'),
      ),
      body: Center(
        child: Text('Admin Access only'),
      ),
    );
  }
}
