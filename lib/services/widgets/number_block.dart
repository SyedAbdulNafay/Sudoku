import 'package:flutter/material.dart';

class NumberBlock extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  const NumberBlock({
    super.key,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(3)),
        child: Text(
          (index + 1).toString(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
