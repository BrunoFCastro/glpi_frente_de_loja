// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart'; // Importe a home page
import 'login_page.dart'; // Importe a login page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false; // Estado de login inicial

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    // TODO: Adicione a lógica para verificar se o usuário está logado
    // Por exemplo, checando um token em SharedPreferences.
    // Por enquanto, vamos simular a verificação.
    // Se estiver logado: setState(() { _isLoggedIn = true; });
    // Se não estiver: _isLoggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login e Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A home do MaterialApp vai exibir a tela de acordo com o estado de login.
      home: _isLoggedIn ? const HomePage() : const LoginPage(),
    );
  }
}