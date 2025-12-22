import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belanja App',
      // Halaman awal menggunakan initialRoute
      initialRoute: '/',
      // Definisi route untuk setiap halaman
      routes: {
        '/': (context) => HomePage(),
        '/item': (context) => const ItemPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
