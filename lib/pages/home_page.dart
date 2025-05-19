import 'package:flutter/material.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/services/widgets/sudoku_cell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SudokuController sudokuController = SudokuController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
              ),
              itemCount: 81,
              itemBuilder: (context, index) {
                final row = index ~/ 9;
                final col = index % 9;

                return SudokuCell(
                    value: sudokuController.sudokuBoard[row][col],
                    row: row,
                    col: col);
              },
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(9, (index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
