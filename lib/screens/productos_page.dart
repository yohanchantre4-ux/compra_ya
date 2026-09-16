import 'package:flutter/material.dart';
import '../data/products_data.dart';
import '../widgets/product_card.dart';

class ProductosPage extends StatelessWidget {
  final ValueChanged<String>? onAddToCart;

  const ProductosPage({super.key, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: sampleProducts.length,
      itemBuilder: (context, index) {
        final product = sampleProducts[index];
        return ProductCard(
          product: product,
          onAddToCart: () => onAddToCart?.call(product.name),
        );
      },
    );
  }
}
