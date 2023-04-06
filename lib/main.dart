import 'package:flutter/material.dart';
import 'package:recipe_app/auth/landing_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        //
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
