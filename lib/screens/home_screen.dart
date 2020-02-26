import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars_provider.dart';
import '../widgets/car_card.dart';
import '../widgets/global_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  static const routeHeader = 'Home';
  static const routeIcon = Icons.home;

  @override
  Widget build(BuildContext context) {
    final carData = Provider.of<CarsProvider>(context, listen: false).cars;
    return Scaffold(
      drawer: GlobalDrawer(),
      appBar: AppBar(title: Text(routeHeader)),
      body: ListView.builder(
        itemBuilder: (context, index) => CarCard(carData[index]),
        itemCount: carData.length,
      ),
    );
  }
}
