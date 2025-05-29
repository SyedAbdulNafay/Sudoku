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
          animation: shakeController.bounceAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: shakeController.bounceAnimation.value,
              child: child,
            );
          },
          child: GestureDetector(
            onTap: () => shakeController.bounce(),
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
