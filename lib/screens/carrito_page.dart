import 'package:flutter/material.dart';

class CarritoPage extends StatelessWidget {
  final List<String> items;
  final VoidCallback? onClear;

  const CarritoPage({super.key, required this.items, this.onClear});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text('Tu carrito está vacío',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 4),
            Text('Toca un producto en "Productos" para agregarlo aquí.',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(items[index]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete_sweep_outlined),
              label: const Text('Vaciar carrito'),
              onPressed: onClear,
            ),
          ),
        ),
      ],
    );
  }
}
