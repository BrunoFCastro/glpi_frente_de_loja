import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'login_page.dart';

Future main() async {
  await dotenv.load(fileName: "lib/variables.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GLPI Frente de Loja',
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}