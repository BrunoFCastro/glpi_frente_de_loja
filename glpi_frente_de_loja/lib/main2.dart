 import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var tapped = false;

  Function toggleTapped() {
    tapped = !tapped;
    setState(() {});
    return toggleTapped;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: DoNothingAction.new,
                    icon: const Icon(Icons.flutter_dash, size: 50, color: Colors.blue),
                    label: const Text(
                      'Flutter',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.print, size: 50),
                  const SizedBox(width: 10),
                  const Text(
                    'Flutter',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.android, size: 50, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    'Android',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('AH')),
                    label: const Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('ML')),
                    label: const Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('HM')),
                    label: const Text('Mulligan'),
                  ),
                  Chip(
                    avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  InputChip(label:  const Text('Input Chip'), onPressed: () {}),
                  ActionChip(label: const Text('Action Chip'), onPressed: () {}),
                  GestureDetector(
                    onTap: toggleTapped,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: tapped ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Custom Chip',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Badge(
                    label: const Text('Badge'),
                    backgroundColor: Colors.red,
                  ),
                  Text('$tapped',),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
