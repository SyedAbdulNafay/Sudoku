import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int? value;
  final int row;
  final int col;
  const SudokuCell({
    super.key,
    required this.value,
    required this.row,
    required this.col,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
        child: Text(value != null ? value.toString() : ""),
      ),
    );
  }
}
