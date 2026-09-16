import 'package:flutter/material.dart';

/// Modelo simple de un producto del catálogo de CompraYA.
class Product {
  final String id;
  final String name;
  final String category;
  final String brand;
  final double price;
  final IconData icon;
  final Color color;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.price,
    required this.icon,
    required this.color,
  });
}
