// lib/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à Homepage!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}