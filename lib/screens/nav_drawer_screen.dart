import 'package:flutter/material.dart';

/// Pantalla que demuestra el `NavigationDrawer` de Material 3:
/// destinos con ícono, texto y selección activa resaltada.
class NavDrawerScreen extends StatefulWidget {
  const NavDrawerScreen({super.key});

  @override
  State<NavDrawerScreen> createState() => _NavDrawerScreenState();
}

class _NavDrawerScreenState extends State<NavDrawerScreen> {
  int _selectedIndex = 0;

  static const List<_Destino> _destinos = [
    _Destino('Ofertas', Icons.local_offer_outlined, Icons.local_offer,
        'Descuentos y promociones activas esta semana.'),
    _Destino('Categorías', Icons.category_outlined, Icons.category,
        'Explora el catálogo organizado por categoría.'),
    _Destino('Pedidos', Icons.receipt_long_outlined, Icons.receipt_long,
        'Historial y estado de tus pedidos recientes.'),
    _Destino('Favoritos', Icons.favorite_border, Icons.favorite,
        'Productos que has marcado como favoritos.'),
    _Destino('Ayuda', Icons.support_agent_outlined, Icons.support_agent,
        'Preguntas frecuentes y soporte al cliente.'),
  ];

  @override
  Widget build(BuildContext context) {
    final destinoActual = _destinos[_selectedIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Menú moderno (NavigationDrawer)')),
      // ---- NavigationDrawer (Material 3) ----
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context); // cierra el drawer tras seleccionar
        },
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'CompraYA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 16, 10),
            child: Text(
              'Basado en Material 3',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          for (final destino in _destinos)
            NavigationDrawerDestination(
              icon: Icon(destino.iconOutline),
              selectedIcon: Icon(destino.iconFilled),
              label: Text(destino.label),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 16, 8),
            child: Text(
              'Los destinos muestran ícono, texto y\nresaltan la selección activa automáticamente.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(destinoActual.iconFilled,
                  size: 72, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(
                destinoActual.label,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                destinoActual.descripcion,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Text(
                'Abre el menú ☰ para cambiar de sección',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Destino {
  final String label;
  final IconData iconOutline;
  final IconData iconFilled;
  final String descripcion;

  const _Destino(
      this.label, this.iconOutline, this.iconFilled, this.descripcion);
}
