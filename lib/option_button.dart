import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton(
      {required this.buttonText, required this.onTapChangeQuestion, super.key});
  final String buttonText;
  final void Function() onTapChangeQuestion;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 30, 3, 109),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onTapChangeQuestion,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
