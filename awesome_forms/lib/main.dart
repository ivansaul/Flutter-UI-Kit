import 'package:flutter/material.dart';
import 'package:flutter_awesome_forms/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Forms',
      home: HomeScreen(),
    );
  }
}
