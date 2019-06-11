import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

//import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

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
  final List<Map<String, String>> products = [];

  void addProduct(Map<String, String> product) {
    setState(() {
      products.add(product);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.light,
        // primarySwatch: Colors.red,
        accentColor: Colors.blueAccent[100],
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>
            ProductsPage(products, addProduct, deleteProduct),
        '/admin': (BuildContext context) => ManagerAdmin(),
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
                  products[index]['title'], products[index]['image2']));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ProductsPage(products, addProduct, deleteProduct),
        );
      },
    );
    return materialApp;
  }
}
