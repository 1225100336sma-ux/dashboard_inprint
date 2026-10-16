import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final String price;

  const ProductModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.price,
  });
}