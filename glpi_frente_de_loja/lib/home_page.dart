import 'package:flutter/material.dart';
import 'form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Lista de dados para cada caixa: texto, ícone e cor
  final List<Map<String, dynamic>> items = const [
    {'text': 'Impressora HP', 'icon': Icons.print, 'color': Colors.blue},
    {'text': 'Bematech', 'icon': Icons.print, 'color': Colors.green},
    {'text': 'Pinpad', 'icon': Icons.credit_card, 'color': Colors.orange},
    {'text': 'Scanner de Mão', 'icon': Icons.barcode_reader, 'color': Colors.purple},
    {'text': 'Scanner de Mesa', 'icon': Icons.chrome_reader_mode, 'color': Colors.red},
    {'text': 'Monitor', 'icon': Icons.monitor, 'color': Colors.pink},
    {'text': 'Sistema', 'icon': Icons.web, 'color': Colors.teal},
    {'text': 'Computador', 'icon': Icons.computer, 'color': Colors.brown},
  ];

  Widget buildClickableBox(Map<String, dynamic> item, BuildContext context) {
    return SizedBox(
        width: 200, // Largura fixa para cada caixa
        height: 200, // Altura fixa
        child: Card(
          color: item['color'],
          elevation: 5,
          child:
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // Ação ao clicar na caixa
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
              child: 
            Column(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamados'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: 
          // if (contraint.maxWidth < constraint.maxHeight) [

          // ] else [

          // ]

          Wrap(
            spacing: 16.0, // Espaçamento horizontal entre os widgets
            runSpacing: 16.0, // Espaçamento vertical entre as linhas
            alignment: WrapAlignment.center, // Alinha os widgets ao centro
            children: items.map((item) => buildClickableBox(item, context)).toList(),
          ),
        ),
      ),
    );
  }

  
}