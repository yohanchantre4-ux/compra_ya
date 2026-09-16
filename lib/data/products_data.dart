import 'package:flutter/material.dart';
import '../models/product.dart';

/// Categorías disponibles en el catálogo.
const List<String> categorias = [
  'Frutas y Verduras',
  'Lácteos',
  'Limpieza',
  'Tecnología',
  'Panadería',
];

/// Marcas disponibles en el catálogo.
const List<String> marcas = [
  'CompraYA Fresh',
  'La Vaquita',
  'BrilloTotal',
  'TecnoMax',
  'Panificio',
];

/// Catálogo local de productos de ejemplo (no requiere internet).
final List<Product> sampleProducts = [
  const Product(
    id: 'p1',
    name: 'Manzanas Rojas (1kg)',
    category: 'Frutas y Verduras',
    brand: 'CompraYA Fresh',
    price: 5200,
    icon: Icons.apple,
    color: Colors.red,
  ),
  const Product(
    id: 'p2',
    name: 'Banano (docena)',
    category: 'Frutas y Verduras',
    brand: 'CompraYA Fresh',
    price: 3800,
    icon: Icons.eco,
    color: Colors.amber,
  ),
  const Product(
    id: 'p3',
    name: 'Leche Entera 1L',
    category: 'Lácteos',
    brand: 'La Vaquita',
    price: 4300,
    icon: Icons.local_drink,
    color: Colors.blue,
  ),
  const Product(
    id: 'p4',
    name: 'Yogurt Natural 900g',
    category: 'Lácteos',
    brand: 'La Vaquita',
    price: 8900,
    icon: Icons.icecream,
    color: Colors.lightBlue,
  ),
  const Product(
    id: 'p5',
    name: 'Detergente Líquido 3L',
    category: 'Limpieza',
    brand: 'BrilloTotal',
    price: 24900,
    icon: Icons.cleaning_services,
    color: Colors.teal,
  ),
  const Product(
    id: 'p6',
    name: 'Desinfectante Multiusos',
    category: 'Limpieza',
    brand: 'BrilloTotal',
    price: 12500,
    icon: Icons.soap,
    color: Colors.green,
  ),
  const Product(
    id: 'p7',
    name: 'Audífonos Bluetooth',
    category: 'Tecnología',
    brand: 'TecnoMax',
    price: 89900,
    icon: Icons.headphones,
    color: Colors.deepPurple,
  ),
  const Product(
    id: 'p8',
    name: 'Cargador USB-C 20W',
    category: 'Tecnología',
    brand: 'TecnoMax',
    price: 45900,
    icon: Icons.power,
    color: Colors.indigo,
  ),
  const Product(
    id: 'p9',
    name: 'Pan Tajado Integral',
    category: 'Panadería',
    brand: 'Panificio',
    price: 6700,
    icon: Icons.bakery_dining,
    color: Colors.brown,
  ),
  const Product(
    id: 'p10',
    name: 'Croissants (x4)',
    category: 'Panadería',
    brand: 'Panificio',
    price: 9800,
    icon: Icons.cookie,
    color: Colors.orange,
  ),
];
