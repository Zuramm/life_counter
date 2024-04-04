import 'package:flutter/material.dart';

import 'views/settings.dart';

void main() {
  runApp(const LifeCounterApp());
}

class LifeCounterApp extends StatelessWidget {
  const LifeCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
          background: Colors.black,
        ),
      ),
      home: const Settings(),
    );
  }
}
