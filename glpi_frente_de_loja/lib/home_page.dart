import 'package:flutter/material.dart';

import 'form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.sessionToken});

  final List<Map<String, dynamic>> botoes = const [
    {'caso': 'Impressora HP', 'icone': Icons.print, 'color': Colors.blue},
    {'caso': 'Bematech', 'icone': Icons.print, 'color': Colors.green},
    {'caso': 'Pinpad', 'icone': Icons.credit_card, 'color': Colors.orange},
    {'caso': 'Scanner de Mão', 'icone': Icons.barcode_reader, 'color': Colors.purple},
    {'caso': 'Scanner de Mesa', 'icone': Icons.chrome_reader_mode, 'color': Colors.red},
    {'caso': 'Monitor', 'icone': Icons.monitor, 'color': Colors.pink},
    {'caso': 'Sistema', 'icone': Icons.web, 'color': Colors.teal},
    {'caso': 'Computador', 'icone': Icons.computer, 'color': Colors.brown},
  ];
  
  final dynamic sessionToken;

  Widget buildClickableBox(Map<String, dynamic> botao, BuildContext context) {
    return SizedBox(
        width: 200,
        height: 200,
        child: Card(
          color: botao['color'],
          elevation: 5,
          child:
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => FormPage(sessionToken: sessionToken, caso: botao['caso'],)),
                );
              },
              child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  botao['icone'],
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  botao['caso'],
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chamados'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: queryData.orientation == Orientation.portrait ? queryData.size.width * 0.5 : queryData.size.width * 0.25,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1,
              mainAxisExtent: queryData.orientation == Orientation.portrait ? queryData.size.height * 0.2 : queryData.size.height * 0.4,
            ),
            children: botoes.map((botao) => buildClickableBox(botao, context)).toList(),
          ),
        ),
      ),
    );
  }
}