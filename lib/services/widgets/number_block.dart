import 'package:flutter/material.dart';

class NumberBlock extends StatelessWidget {
  final int index;
  final int numbersLeft;
  const NumberBlock({
    super.key,
    required this.index,
    required this.numbersLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          Text(
            (index + 1).toString(),
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            numbersLeft.toString(),
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
