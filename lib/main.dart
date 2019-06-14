import 'package:course_project/pages/auth.dart';
import 'package:course_project/pages/products.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/product.dart';
import './products.dart';

void main() {
  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintPointersEnabled =true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        //brightness: Brightness.light,
        primarySwatch: Colors.teal,
        accentColor: Colors.teal,
      ),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/home': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ManagerAdmin(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                    _products[index]['title'],
                    _products[index]['image'],
                    _products[index]['description'],
                  ));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => Products(_products),
        );
      },
    );
    return materialApp;
  }
}
