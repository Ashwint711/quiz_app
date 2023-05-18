import 'package:flutter/material.dart';

class RowIndex extends StatelessWidget {
  const RowIndex(
      {required this.questionMapObject,
      required this.isCorrectAnswer,
      super.key});
  final bool isCorrectAnswer;
  final Map<String, Object> questionMapObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrectAnswer ? Colors.blue : Colors.pink.shade300,
      ),
      child: Text(
        ((questionMapObject['index'] as int) + 1).toString(),
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 1, 1, 101),
        ),
      ),
    );
  }
}
