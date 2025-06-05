import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';

void main() {
  runApp(const DividendApp());
}

class DividendApp extends StatelessWidget {
  const DividendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Trust Dividend Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF3E5F5), // Light purple background
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
