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
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<http.Response> authenticate (String username, String password) async {
    String basicAuth = 'Basic ${LoginPage.base64.encode(utf8.encode('$username:$password'))}';
    return await http.get(
      Uri.parse('${dotenv.env['API_URL']}initSession'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': basicAuth,
        'App-Token': dotenv.env['APP_TOKEN']!,
      },);
  }

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: queryData.size.width * 0.6,
                      child: TextFormField(
                        controller: _loginController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Login',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: queryData.size.width * 0.6,
                      child:  TextFormField(
                        controller: _senhaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
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
                        try {
                          if (_formKey.currentState!.validate()) {
                            final sessao = authenticate(_loginController.text, _senhaController.text);
                            switch (sessao.statusCode) {
                              case 200:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage(sessionToken: sessao.body,)),
                                );
                                break;
                              case 400:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Erro no servidor, tente novamente mais tarde')),
                                );
                                _senhaController.clear();
                                break;
                              case 401:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Usuário ou senha inválidos')),
                                );
                                _senhaController.clear();
                                break;
                            }
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Erro ao conectar ao servidor')),
                          );
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                ],)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Future<http.Response> {
  get statusCode => 400;
  get body => null;
}