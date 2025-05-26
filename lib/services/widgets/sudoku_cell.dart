import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';

class SudokuCell extends StatelessWidget {
  final int row;
  final int col;
  final void Function()? onTap;
  const SudokuCell({
    super.key,
    required this.row,
    required this.col,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final SudokuController sudokuController = Get.find();

    return Obx(() {
      final isSameCell = sudokuController.selectedCol.value == col &&
          sudokuController.selectedRow.value == row;
      final isSameRowOrCol = sudokuController.selectedCol.value == col ||
          sudokuController.selectedRow.value == row;
      final isSameBox = findBox(
        sudokuController.selectedRow.value,
        sudokuController.selectedCol.value,
      );

      final cellValue = sudokuController.sudokuBoard[row][col];

      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: isSameCell && sudokuController.invalidMove.value
                  ? Colors.red
                  : (isSameCell
                      ? Colors.grey[400]
                      : (isSameRowOrCol || isSameBox
                          ? Colors.grey[300]
                          : Colors.transparent)),
              border: Border(
                top: row % 3 == 0
                    ? const BorderSide(width: 2)
                    : const BorderSide(width: 0.5),
                left: col % 3 == 0
                    ? const BorderSide(width: 2)
                    : const BorderSide(width: 0.5),
                right: (col + 1) % 3 == 0
                    ? const BorderSide(width: 2)
                    : const BorderSide(width: 0.5),
                bottom: (row + 1) % 3 == 0
                    ? const BorderSide(width: 2)
                    : const BorderSide(width: 0.5),
              )),
          child: Center(
            child: Text(
              cellValue != 0 ? cellValue.toString() : "",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      );
    });
  }

  bool findBox(int? selectedRow, int? selectedCol) {
    if (selectedRow == null || selectedCol == null) return false;

    return (row ~/ 3 == selectedRow ~/ 3) && (col ~/ 3 == selectedCol ~/ 3);
  }
}
