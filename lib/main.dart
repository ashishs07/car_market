import 'package:flutter/material.dart';

import './product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      theme: ThemeData(
        accentColor: Colors.lightBlue,
        primarySwatch: Colors.deepPurple
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easy Listing'),
        ),
        body: ProductManager('Food Tester'),
      ),
    );
    return materialApp;
  }
}
