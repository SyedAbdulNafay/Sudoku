import 'package:get/get.dart';

class SudokuController extends GetxController {
  final sudokuBoard = List.generate(9, (_) => List.filled(9, 0)).obs;
  final selectedRow = Rxn<int>();
  final selectedCol = Rxn<int>();

  onBoxTapped(int row, int col) {
    selectedRow.value = row;
    selectedCol.value = col;
  }

  onNumberTapped(int number) {
    if (selectedRow.value != null &&
        selectedCol.value != null &&
        sudokuBoard[selectedRow.value!][selectedCol.value!] == 0 &&
        isValidMove(selectedRow.value!, selectedCol.value!, number,)) {
      sudokuBoard[selectedRow.value!][selectedCol.value!] = number;
      sudokuBoard.refresh();
    }
  }

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
