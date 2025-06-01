import 'dart:math';

class SudokuGenerator {
  final Random _rand = Random();

  // Generate a full, valid board
  List<List<int>> generateFullBoard() {
    final board = List.generate(9, (_) => List.filled(9, 0));
    _fillBoard(board, 0, 0);
    return board;
  }

  bool _fillBoard(List<List<int>> board, int row, int col) {
    if (row == 9) return true;
    if (col == 9) return _fillBoard(board, row + 1, 0);

    final numbers = List.generate(9, (i) => i + 1)..shuffle(_rand);

    for (int number in numbers) {
      if (_isValid(board, row, col, number)) {
        board[row][col] = number;
        if (_fillBoard(board, row, col + 1)) return true;
        board[row][col] = 0;
      }
    }

    return false;
  }

  bool _isValid(List<List<int>> board, int row, int col, int number) {
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == number || board[i][col] == number) return false;
    }

    int startRow = (row ~/ 3) * 3;
    int startCol = (col ~/ 3) * 3;
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        if (board[startRow + r][startCol + c] == number) return false;
      }
    }

    return true;
  }

  // Create a puzzle board
  List<List<int>> generatePuzzle(
      {int clues = 30,
      required List<List<int>> fullBoard,
      required Map<int, int> numberBlocks}) {
    final List<List<int>> puzzle =
        List.generate(9, (i) => List.from(fullBoard[i]));
    int removed = 0;

    final cells = List.generate(81, (i) => i)..shuffle(_rand);

    for (int index in cells) {
      if (81 - removed <= clues) break;

      int row = index ~/ 9;
      int col = index % 9;
      // int backup = puzzle[row][col];

      if (numberBlocks[puzzle[row][col]] != 9) {
        numberBlocks[puzzle[row][col]] = numberBlocks[puzzle[row][col]]! + 1;
      }

      puzzle[row][col] = 0;

      // Optional: add uniqueness check here

      removed++;
    }

    return puzzle;
  }
}
