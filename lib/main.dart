import 'package:flutter/material.dart';

import './product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.lightBlueAccent[100],
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easy Listing'),
        ),
        body: ProductManager(startingProduct: 'Food Tester'),
      ),
    );
    return materialApp;
  }
}
