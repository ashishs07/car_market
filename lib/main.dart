import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/cars_provider.dart';
import './providers/users_provider.dart';
import './screens/home_screen.dart';
import './screens/userListing_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CarsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UsersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.teal,
          fontFamily: 'Karla',
          buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          UserListingScreen.routeName: (ctx) => UserListingScreen(),
        },
      ),
    );
  }
}
