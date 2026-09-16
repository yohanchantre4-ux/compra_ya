import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'carrito_page.dart';
import 'inicio_page.dart';
import 'perfil_page.dart';
import 'productos_page.dart';

/// Acciones del menú emergente (⋮) global del AppBar.
enum AppBarAction { editar, eliminar, compartir, configuracion }

/// Pantalla principal de CompraYA.
///
/// Combina:
///  - `Drawer` (menú lateral clásico, ícono ☰).
///  - `BottomNavigationBar` con 4 secciones principales.
///  - `PopupMenuButton` (⋮) en el AppBar con acciones secundarias.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _carrito = [];

  static const List<String> _titles = [
    'CompraYA · Inicio',
    'CompraYA · Productos',
    'CompraYA · Carrito',
    'CompraYA · Perfil',
  ];

  void _agregarAlCarrito(String nombreProducto) {
    setState(() => _carrito.add(nombreProducto));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('"$nombreProducto" agregado al carrito')));
  }

  void _vaciarCarrito() {
    setState(() => _carrito.clear());
  }

  void _onAppBarAction(AppBarAction action) {
    late final String message;
    switch (action) {
      case AppBarAction.editar:
        message = 'Editar perfil / preferencias';
        break;
      case AppBarAction.eliminar:
        message = 'Elemento eliminado';
        break;
      case AppBarAction.compartir:
        message = 'Compartiendo CompraYA...';
        break;
      case AppBarAction.configuracion:
        message = 'Abriendo configuración general';
        break;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const InicioPage(),
      ProductosPage(onAddToCart: _agregarAlCarrito),
      CarritoPage(items: _carrito, onClear: _vaciarCarrito),
      const PerfilPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          if (_selectedIndex == 2 && _carrito.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Center(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Text(
                    '${_carrito.length}',
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          // ---- Popup Menu (⋮) global del AppBar ----
          PopupMenuButton<AppBarAction>(
            tooltip: 'Más opciones',
            onSelected: _onAppBarAction,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: AppBarAction.editar,
                child: ListTile(
                  leading: Icon(Icons.edit_outlined),
                  title: Text('Editar'),
                ),
              ),
              PopupMenuItem(
                value: AppBarAction.eliminar,
                child: ListTile(
                  leading: Icon(Icons.delete_outline),
                  title: Text('Eliminar'),
                ),
              ),
              PopupMenuItem(
                value: AppBarAction.compartir,
                child: ListTile(
                  leading: Icon(Icons.share_outlined),
                  title: Text('Compartir'),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: AppBarAction.configuracion,
                child: ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Configuración'),
                ),
              ),
            ],
          ),
        ],
      ),
      // ---- Drawer clásico (menú lateral, ícono ☰ automático) ----
      drawer: AppDrawer(
        currentIndex: _selectedIndex,
        onSelectTab: (index) => setState(() => _selectedIndex = index),
      ),
      body: IndexedStack(index: _selectedIndex, children: pages),
      // ---- Bottom Navigation Bar (3 a 5 secciones principales) ----
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            activeIcon: Icon(Icons.storefront),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              isLabelVisible: _carrito.isNotEmpty,
              label: Text('${_carrito.length}'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            activeIcon: const Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
