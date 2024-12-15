import 'package:flutter/material.dart';
import 'package:mr_shop/bottomnavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}
