import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShakeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> offsetAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    offsetAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
    ]).animate(animationController);
  }

  void triggerShake() {
    animationController.forward(from: 0.0);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
