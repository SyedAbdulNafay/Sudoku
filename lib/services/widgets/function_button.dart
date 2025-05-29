import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final void Function()? onTap;
  const FunctionButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [icon, Text(text)],
      ),
    );
  }
}
