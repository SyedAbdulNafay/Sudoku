import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShakeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController bounceController;
  late Animation<double> offsetAnimation;
  late Animation<double> bounceAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    bounceController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.0,
    );

    offsetAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
    ]).animate(animationController);

    bounceAnimation = CurvedAnimation(
      parent: bounceController,
      curve: Curves.easeIn,
    );

    bounceController.value = 1.0;
  }

  void triggerShake() {
    animationController.forward(from: 0.0);
  }

  void bounce() async {
    await bounceController.reverse(from: 1.0);
    await bounceController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    bounceController.dispose();
    super.onClose();
  }
}
