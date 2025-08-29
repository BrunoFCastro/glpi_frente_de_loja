// lib/main.dart

import 'package:flutter/material.dart';
import 'form_page.dart'; // Importe a nova página

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormPage(), // Defina FormPage como a tela inicial
    );
  }
}