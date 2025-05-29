import 'package:flutter/material.dart';

class NumberBlock extends StatelessWidget {
  final int index;
  const NumberBlock({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
