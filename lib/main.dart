import 'package:flutter/material.dart';
import 'package:practica5_app/models/estado.dart';
import 'package:practica5_app/screens/tic_tac_toe.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego del Gato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToeGame(),
    );
  }
}
