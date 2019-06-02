import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './product_manager.dart';

void main() {
  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintPointersEnabled =true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.light,
        // primarySwatch: Colors.red,
        accentColor: Colors.blueAccent[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Car Listing'),
        ),
        body: ProductManager(),
      ),
    );
    return materialApp;
  }
}
