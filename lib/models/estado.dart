import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  List<String?> _board = List.filled(9, null);
  bool _isXTurn = true;
  String? _winner;

  List<String?> get board => _board;
  bool get isXTurn => _isXTurn;
  String? get winner => _winner;

  void makeMove(int index) {
    if (_board[index] == null && _winner == null) {
      _board[index] = _isXTurn ? 'X' : 'O';
      _isXTurn = !_isXTurn;
      _winner = _checkWinner();
      notifyListeners();
    }
  }

  String? _checkWinner() {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (_board[combo[0]] != null &&
          _board[combo[0]] == _board[combo[1]] &&
          _board[combo[0]] == _board[combo[2]]) {
        return _board[combo[0]];
      }
    }

    if (!_board.contains(null)) {
      return 'Empate';
    }
    return null;
  }

  void resetGame() {
    _board = List.filled(9, null);
    _isXTurn = true;
    _winner = null;
    notifyListeners();
  }
}
