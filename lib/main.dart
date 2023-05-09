import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'forgotp.dart';
import 'signup.dart';
import 'homepage.dart';
import 'outputpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}