import 'package:flutter/material.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

/// Pantalla de "Filtros avanzados" que demuestra los tres widgets de
/// dropdown de Flutter: `DropdownButton`, `DropdownButtonFormField`
/// y `DropdownMenu`, aplicándolos como filtros reales sobre el catálogo.
class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  // --- Estado: DropdownButton (ordenar por) ---
  String _ordenarPor = 'Nombre (A-Z)';
  static const List<String> _opcionesOrden = [
    'Nombre (A-Z)',
    'Precio: menor a mayor',
    'Precio: mayor a menor',
  ];

  // --- Estado: DropdownButtonFormField (categoría, con validación) ---
  final _formKey = GlobalKey<FormState>();
  String? _categoriaSeleccionada;

  // --- Estado: DropdownMenu (marca, Material 3) ---
  String? _marcaSeleccionada;

  List<Product> get _productosFiltrados {
    var lista = List<Product>.from(sampleProducts);

    if (_categoriaSeleccionada != null) {
      lista = lista.where((p) => p.category == _categoriaSeleccionada).toList();
    }
    if (_marcaSeleccionada != null) {
      lista = lista.where((p) => p.brand == _marcaSeleccionada).toList();
    }

    switch (_ordenarPor) {
      case 'Precio: menor a mayor':
        lista.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Precio: mayor a menor':
        lista.sort((a, b) => b.price.compareTo(a.price));
        break;
      default:
        lista.sort((a, b) => a.name.compareTo(b.name));
    }
    return lista;
  }

  void _limpiarFiltros() {
    setState(() {
      _ordenarPor = 'Nombre (A-Z)';
      _categoriaSeleccionada = null;
      _marcaSeleccionada = null;
      _formKey.currentState?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final resultados = _productosFiltrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros (Dropdown menus)'),
        actions: [
          IconButton(
            tooltip: 'Limpiar filtros',
            icon: const Icon(Icons.filter_alt_off_outlined),
            onPressed: _limpiarFiltros,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---- 1) DropdownButton ----
                  Text('Ordenar por  ·  DropdownButton',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _ordenarPor,
                    items: _opcionesOrden
                        .map((op) =>
                            DropdownMenuItem(value: op, child: Text(op)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _ordenarPor = value!),
                  ),
                  const SizedBox(height: 16),

                  // ---- 2) DropdownButtonFormField ----
                  Text('Categoría  ·  DropdownButtonFormField',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  DropdownButtonFormField<String>(
                    value: _categoriaSeleccionada,
                    decoration: const InputDecoration(
                      hintText: 'Todas las categorías',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: categorias
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _categoriaSeleccionada = value),
                    validator: (_) => null, // validación de ejemplo (libre)
                  ),
                  const SizedBox(height: 16),

                  // ---- 3) DropdownMenu (Material 3) ----
                  Text('Marca  ·  DropdownMenu (Material 3)',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width - 32,
                    hintText: 'Todas las marcas',
                    initialSelection: _marcaSeleccionada,
                    dropdownMenuEntries: marcas
                        .map((m) =>
                            DropdownMenuEntry(value: m, label: m))
                        .toList(),
                    onSelected: (value) =>
                        setState(() => _marcaSeleccionada = value),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
              child: Row(
                children: [
                  Text('Resultados (${resultados.length})',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: _limpiarFiltros,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Limpiar'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: resultados.isEmpty
                  ? const Center(
                      child: Text('No hay productos con estos filtros.'),
                    )
                  : ListView.builder(
                      itemCount: resultados.length,
                      itemBuilder: (context, index) =>
                          ProductCard(product: resultados[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
