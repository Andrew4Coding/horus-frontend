import 'package:flutter/material.dart';
import 'package:horus_frontend/Start/start.dart';
import 'package:horus_frontend/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const Start(),
    );
  }
}
