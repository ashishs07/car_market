import 'package:flutter/material.dart';

import '../models/carmodel.dart';

class CarsProvider with ChangeNotifier {
  List<CarModel> _cars = [];

  List<CarModel> get cars {
    return [..._cars];
  }

  void addCar(String title, String description, String image, Color color,
      double price, String userEmail) {
    final newCar = CarModel(
      title: title,
      description: description,
      price: price,
      color: color,
      image:
          'https://www.seriouseats.com/2018/04/20180410-milk-chocolates-vicky-wasik-1-1500x1125.jpg',
      userEmail: 'userEmail',
    );

    _cars.add(newCar);
    notifyListeners();
  }
}
