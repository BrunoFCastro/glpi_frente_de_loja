import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Base64Codec base64 = Base64Codec();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<http.Response> authenticate(String username, String password) {
    String basicAuth = 'Basic ${LoginPage.base64.encode(utf8.encode('$username:$password'))}';
    return http.get(
      Uri.parse('${dotenv.env['API_URL']}initSession'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': basicAuth,
        'App-Token': dotenv.env['APP_TOKEN']!,
        },
    );
  }

  // 200 (OK) with the session_token string.
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
                child: TextField(
                  controller: loginController,
                  decoration: const InputDecoration(
                    labelText: 'Login',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: queryData.size.width * 0.6,
                child:  TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
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
                  final sessao = authenticate(loginController.text, senhaController.text);
                  if (sessao.statusCode == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    throw sessao.statusCode;
                  }
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

extension on Future<http.Response> {
  get statusCode => null;
}