import 'package:flutter/material.dart';
import 'dropdown_screen.dart';
import 'nav_drawer_screen.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _idioma = 'Español';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 42,
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.person, size: 46, color: Colors.white),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text('Usuario CompraYA',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const Center(
          child: Text('usuario@compraya.com',
              style: TextStyle(color: Colors.grey)),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 12),
                const Text('Idioma preferido'),
                const Spacer(),
                // ---- Ejemplo simple de DropdownButton ----
                DropdownButton<String>(
                  value: _idioma,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'Español', child: Text('Español')),
                    DropdownMenuItem(value: 'English', child: Text('English')),
                    DropdownMenuItem(
                        value: 'Português', child: Text('Português')),
                  ],
                  onChanged: (value) => setState(() => _idioma = value!),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.filter_list),
                title: const Text('Ver todos los Dropdown menus'),
                subtitle: const Text('DropdownButton, FormField y Menu'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DropdownScreen()),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.view_sidebar_outlined),
                title: const Text('Ver Navigation Drawer (Material 3)'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NavDrawerScreen()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
