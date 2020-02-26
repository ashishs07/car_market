import 'package:flutter/material.dart';

class CarModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final Color color;
  final bool isFavourite;
  final String userEmail;

  CarModel({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,
    @required this.color,
    this.isFavourite = false,
    @required this.userEmail,
  });
}
