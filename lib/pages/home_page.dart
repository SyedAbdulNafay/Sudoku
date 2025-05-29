import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/animation_controller.dart';
import 'package:sudoku/controllers/sudoku_controller.dart';
import 'package:sudoku/services/widgets/number_block.dart';
import 'package:sudoku/services/widgets/sudoku_cell.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SudokuController sudokuController = Get.put(SudokuController());
    final ShakeController shakeController = Get.put(ShakeController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: shakeController.offsetAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(shakeController.offsetAnimation.value, 0),
                  child: child,
                );
              },
              child: GridView.builder(
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
                    row: row,
                    col: col,
                    onTap: () => sudokuController.onBoxTapped(row, col),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(9, (index) {
                    final isTapped =
                        sudokuController.tappedIndex.value == index;
                    return AnimatedScale(
                      scale: isTapped ? 0.9 : 1.0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn,
                      onEnd: () {
                        if (isTapped) sudokuController.tappedIndex.value = -1;
                      },
                      child: GestureDetector(
                        onTap: () {
                          sudokuController.tappedIndex.value = index;
                          sudokuController.onNumberTapped(index + 1);
                        },
                        child: NumberBlock(index: index),
                      ),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
