import 'package:flutter/material.dart';
import '../models/product.dart';

/// Acciones disponibles en el menú emergente (⋮) de cada producto.
enum ProductAction { editar, eliminar, compartir, configuracion }

/// Tarjeta de producto que incluye un `PopupMenuButton` (menú de tres
/// puntos) con acciones secundarias: Editar, Eliminar, Compartir y
/// Configuración.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart;

  const ProductCard({super.key, required this.product, this.onAddToCart});

  void _handleAction(BuildContext context, ProductAction action) {
    late final String message;
    switch (action) {
      case ProductAction.editar:
        message = 'Editar "${product.name}"';
        break;
      case ProductAction.eliminar:
        message = '"${product.name}" eliminado del catálogo';
        break;
      case ProductAction.compartir:
        message = 'Compartiendo "${product.name}"...';
        break;
      case ProductAction.configuracion:
        message = 'Configuración de "${product.name}"';
        break;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final formattedPrice = '\$${product.price.toStringAsFixed(0)}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 1.5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: product.color.withOpacity(0.15),
          child: Icon(product.icon, color: product.color),
        ),
        title: Text(product.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${product.brand} · ${product.category}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formattedPrice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // ---- Popup Menu (⋮) por producto ----
            PopupMenuButton<ProductAction>(
              tooltip: 'Más acciones',
              icon: const Icon(Icons.more_vert),
              onSelected: (action) => _handleAction(context, action),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: ProductAction.editar,
                  child: ListTile(
                    leading: Icon(Icons.edit_outlined),
                    title: Text('Editar'),
                  ),
                ),
                PopupMenuItem(
                  value: ProductAction.eliminar,
                  child: ListTile(
                    leading: Icon(Icons.delete_outline),
                    title: Text('Eliminar'),
                  ),
                ),
                PopupMenuItem(
                  value: ProductAction.compartir,
                  child: ListTile(
                    leading: Icon(Icons.share_outlined),
                    title: Text('Compartir'),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: ProductAction.configuracion,
                  child: ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Configuración'),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: onAddToCart,
      ),
    );
  }
}
