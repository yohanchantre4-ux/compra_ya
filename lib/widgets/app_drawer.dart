import 'package:flutter/material.dart';
import '../screens/dropdown_screen.dart';
import '../screens/nav_drawer_screen.dart';

/// Menú lateral clásico de la aplicación (widget `Drawer`).
///
/// Permite:
///  - Saltar directamente a una pestaña del `BottomNavigationBar`
///    (a través de [onSelectTab]).
///  - Navegar a la pantalla que demuestra `NavigationDrawer` (Material 3).
///  - Navegar a la pantalla que demuestra los `Dropdown` menus.
class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelectTab;

  const AppDrawer({
    super.key,
    required this.currentIndex,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget tile({
      required IconData icon,
      required String label,
      required VoidCallback onTap,
      bool selected = false,
    }) {
      return ListTile(
        leading: Icon(icon,
            color: selected ? theme.colorScheme.primary : null),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? theme.colorScheme.primary : null,
          ),
        ),
        selected: selected,
        onTap: onTap,
      );
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.colorScheme.primary),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.shopping_bag,
                        size: 30, color: Colors.deepPurple),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'CompraYA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Hola, Usuario 👋',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Text(
                      'SECCIONES PRINCIPALES',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  tile(
                    icon: Icons.home,
                    label: 'Inicio',
                    selected: currentIndex == 0,
                    onTap: () {
                      onSelectTab(0);
                      Navigator.pop(context);
                    },
                  ),
                  tile(
                    icon: Icons.storefront,
                    label: 'Productos',
                    selected: currentIndex == 1,
                    onTap: () {
                      onSelectTab(1);
                      Navigator.pop(context);
                    },
                  ),
                  tile(
                    icon: Icons.shopping_cart,
                    label: 'Carrito',
                    selected: currentIndex == 2,
                    onTap: () {
                      onSelectTab(2);
                      Navigator.pop(context);
                    },
                  ),
                  tile(
                    icon: Icons.person,
                    label: 'Perfil',
                    selected: currentIndex == 3,
                    onTap: () {
                      onSelectTab(3);
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      'OTROS MENÚS DE EJEMPLO',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  tile(
                    icon: Icons.view_sidebar_outlined,
                    label: 'Menú moderno (Material 3)',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NavDrawerScreen()),
                      );
                    },
                  ),
                  tile(
                    icon: Icons.filter_list,
                    label: 'Filtros avanzados (Dropdown)',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DropdownScreen()),
                      );
                    },
                  ),
                  const Divider(),
                  tile(
                    icon: Icons.settings,
                    label: 'Configuración',
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Abriendo configuración...')),
                      );
                    },
                  ),
                  tile(
                    icon: Icons.help_outline,
                    label: 'Ayuda',
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Centro de ayuda')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            tile(
              icon: Icons.logout,
              label: 'Cerrar sesión',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sesión cerrada')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
