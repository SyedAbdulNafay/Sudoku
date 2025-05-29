import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku/controllers/animation_controller.dart';

class Lab extends StatelessWidget {
  const Lab({super.key});

  @override
  Widget build(BuildContext context) {
    final ShakeController shakeController = Get.put(ShakeController());

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: shakeController.offsetAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(shakeController.offsetAnimation.value, 0),
              child: child,
            );
          },
          child: GestureDetector(
            onTap: () => shakeController.triggerShake(),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
