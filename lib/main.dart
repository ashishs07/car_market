import 'package:flutter/material.dart';

import './product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Easy Listing'),
        ),
        body: ProductManager(),
      ),
    );
    return materialApp;
  }
}
