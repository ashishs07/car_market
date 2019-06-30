import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/product.dart';
import './pages/products.dart';
import './widgets/products/products.dart';
//import './models/productmodel.dart';
import './scoped-models/main_smodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.teal,
          fontFamily: 'Karla',
          buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => ProductsPage(model),
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
                builder: (BuildContext context) => ProductPage(index));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => Products(),
          );
        },
      ),
    );
  }
}
