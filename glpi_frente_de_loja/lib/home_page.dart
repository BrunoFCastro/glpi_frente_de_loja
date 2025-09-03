import 'package:flutter/material.dart';

import 'form_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> items = const [
    {'text': 'Impressora HP', 'icon': Icons.print, 'color': Colors.blue, 'descrição': 'Impressora HP'},
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
        width: 200,
        height: 200,
        child: Card(
          color: item['color'],
          elevation: 5,
          child:
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
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
            children: items.map((item) => buildClickableBox(item, context)).toList(),
          ),
        ),
      ),
    );
  }
}