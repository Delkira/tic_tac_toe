import 'package:flutter/material.dart';
import 'package:practica5_app/models/estado.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: 9,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => gameState.makeMove(index),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              border: Border.all(color: Colors.black54),
            ),
            child: Center(
              child: Text(
                gameState.board[index] ?? '',
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
