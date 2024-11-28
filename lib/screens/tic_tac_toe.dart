import 'package:flutter/material.dart';
import 'package:practica5_app/models/estado.dart';
import 'package:practica5_app/widgets/juego.dart';
import 'package:provider/provider.dart';

class TicTacToeGame extends StatelessWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego del Gato'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GameBoard(), // Tablero de 3x3.
          const SizedBox(height: 16),
          if (gameState.winner != null)
            Text(
              gameState.winner == 'Empate'
                  ? '¡Es un empate!'
                  : '¡${gameState.winner} ha ganado!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: gameState.resetGame,
            child: const Text('Reiniciar Juego'),
          ),
        ],
      ),
    );
  }
}
