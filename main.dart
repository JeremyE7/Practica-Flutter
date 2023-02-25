import 'package:flutter/material.dart';
import 'package:prueba2/views/loginView.dart';
import 'package:prueba2/views/principalView.dart';
import 'package:prueba2/views/registerView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login",
      home: loginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

