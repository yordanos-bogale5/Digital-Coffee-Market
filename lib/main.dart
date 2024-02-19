
import 'package:flutter/material.dart';

import 'features/coffee_market/peresentation/screens/home_screen.dart';
void main() {

runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buna',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen (),
    );
  }
}