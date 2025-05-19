import 'package:get/get.dart';

class SudokuController extends GetxController {
  List<List<int?>> sudokuBoard = List.generate(9, (_) => List.filled(9, null));

  bool isValidMove(int row, int col, int number) {
    // Check row
    if (sudokuBoard[row].contains(number)) return false;

    // Check column
    for (var r = 0; r < 9; r++) {
      if (sudokuBoard[r][col] == number) return false;
    }

    // Check 3x3 box
    int startRow = (row ~/ 3) * 3;
    int startCol = (col ~/ 3) * 3;

    for (var r = 0; r < 3; r++) {
      for (var c = 0; c < 3; c++) {
        if (sudokuBoard[startRow + r][startCol + c] == number) return false;
      }
    }

    return true;
  }
}