# CompraYA 🛒

Aplicación de ejemplo en **Flutter** que demuestra, de forma funcional y
conectada en un solo flujo de navegación, los 5 tipos de menú más usados
en apps móviles:

| Menú | Widget | Dónde verlo en la app |
|---|---|---|
| Drawer (clásico) | `Drawer` | Ícono ☰ en el AppBar de la pantalla principal |
| Navigation Drawer (Material 3) | `NavigationDrawer` | Opción "Menú moderno (M3)" dentro del Drawer |
| Bottom Navigation Bar | `BottomNavigationBar` | Parte inferior de la pantalla principal (Inicio, Productos, Carrito, Perfil) |
| Popup Menu | `PopupMenuButton` | Ícono ⋮ del AppBar y en cada tarjeta de producto |
| Dropdown Menu | `DropdownButton`, `DropdownButtonFormField`, `DropdownMenu` | Opción "Filtros avanzados" dentro del Drawer |

## Estructura del proyecto

```
lib/
 ├── main.dart                     # Punto de entrada, tema Material 3
 ├── models/
 │    └── product.dart             # Modelo Product
 ├── data/
 │    └── products_data.dart       # Datos de ejemplo (catálogo)
 ├── widgets/
 │    ├── app_drawer.dart          # Drawer clásico (menú lateral)
 │    └── product_card.dart        # Tarjeta con PopupMenuButton de acciones
 └── screens/
      ├── home_screen.dart         # Scaffold raíz: Drawer + BottomNavigationBar + PopupMenu (AppBar)
      ├── inicio_page.dart         # Sección "Inicio" del Bottom Navigation
      ├── productos_page.dart      # Sección "Productos" del Bottom Navigation
      ├── carrito_page.dart        # Sección "Carrito" del Bottom Navigation
      ├── perfil_page.dart         # Sección "Perfil" del Bottom Navigation
      ├── nav_drawer_screen.dart   # Pantalla que usa NavigationDrawer (Material 3)
      └── dropdown_screen.dart     # Pantalla con los 3 tipos de Dropdown
```

## Cómo ejecutar

1. Tener Flutter instalado (`flutter --version`).
2. Descomprimir este zip.
3. Dentro de la carpeta `CompraYA/`, ejecutar:

```bash
flutter pub get
flutter run
```

No requiere paquetes externos ni conexión a internet: todo el catálogo
es data local (`lib/data/products_data.dart`) y los íconos vienen del
paquete `Icons` de Material.

## Notas de diseño

- Usa `Material 3` (`useMaterial3: true`) para que `NavigationDrawer` y
  `DropdownMenu` se vean con su estilo moderno nativo.
- El estado de navegación del `BottomNavigationBar` se maneja con un
  `IndexedStack` para conservar el estado de cada pestaña.
- El `Drawer` clásico funciona como "menú maestro": desde ahí puedes
  saltar a las pestañas del Bottom Nav, o entrar a las pantallas que
  muestran `NavigationDrawer` y los `Dropdown`.
- Cada `ProductCard` incluye su propio `PopupMenuButton` (⋮) con las
  acciones típicas: Editar, Eliminar, Compartir.
