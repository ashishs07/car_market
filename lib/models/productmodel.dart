import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String description;
  final double price;
  final String image;

  ProductModel({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,
  });
}
