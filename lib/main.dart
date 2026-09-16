import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CompraYaApp());
}

class CompraYaApp extends StatelessWidget {
  const CompraYaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compra YA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 1,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
