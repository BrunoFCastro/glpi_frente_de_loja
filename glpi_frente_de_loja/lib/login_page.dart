import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static Base64Codec base64 = Base64Codec();

  Future<http.Response> authenticate(String username, String password) {
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    String AppToken = dotenv.env{'APP_TOKEN'}
    final response = http.get(
      Uri.parse('${dotenv.env['API_URL']}initSession'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': basicAuth,
        'App-Token': ,
        },
    );
    return 0;
  }

  // 200 (OK) with the session_token string.
  // 400 (Bad Request) with a message indicating an error in input parameter.
  // 401 (UNAUTHORIZED)

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao GLPI Frente de Loja',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: queryData.size.width * 0.6,
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: queryData.size.width * 0.6,
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: Adicionar lógica de login real
                  // Por enquanto, vamos simular o login e navegar para a home.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}