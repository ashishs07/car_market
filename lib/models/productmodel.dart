import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavourite;
  final String userEmail;
  final String userId;

  ProductModel({
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.image,
    this.isFavourite = false,
    @required this.userEmail,
    @required this.userId,
  });
}
