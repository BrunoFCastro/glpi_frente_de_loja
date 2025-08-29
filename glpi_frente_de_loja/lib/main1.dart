import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Caixas Clicáveis com Wrap'),
          centerTitle: true,
        ),
        body: const MyWrapPage(),
      ),
    );
  }
}

class MyWrapPage extends StatelessWidget {
  const MyWrapPage({super.key});

  // Lista de dados para cada caixa: texto, ícone e cor
  final List<Map<String, dynamic>> items = const [
    {'text': 'Home', 'icon': Icons.home, 'color': Colors.blue},
    {'text': 'Perfil', 'icon': Icons.person, 'color': Colors.green},
    {'text': 'Configurações', 'icon': Icons.settings, 'color': Colors.orange},
    {'text': 'Mensagens', 'icon': Icons.message, 'color': Colors.purple},
    {'text': 'Câmera', 'icon': Icons.camera, 'color': Colors.red},
    {'text': 'Favoritos', 'icon': Icons.favorite, 'color': Colors.pink},
    {'text': 'Buscar', 'icon': Icons.search, 'color': Colors.teal},
    {'text': 'Download', 'icon': Icons.download, 'color': Colors.brown},
  ];
  
  BuildContext? get context => null;

  Widget buildClickableBox(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        // Ação ao clicar na caixa
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text('Você clicou em "${item['text']}"'),
          ),
        );
      },
      child: SizedBox(
        width: 150, // Largura fixa para cada caixa
        height: 150, // Altura fixa
        child: Card(
          color: item['color'],
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item['icon'],
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                item['text'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 16.0, // Espaçamento horizontal entre os widgets
          runSpacing: 16.0, // Espaçamento vertical entre as linhas
          alignment: WrapAlignment.center, // Alinha os widgets ao centro
          children: items.map((item) => buildClickableBox(item)).toList(),
        ),
      ),
    );
  }

  
}

