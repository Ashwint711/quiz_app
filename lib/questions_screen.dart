import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/actual_questions.dart';
import 'package:quiz_app/option_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chosenAnswer, {super.key});
  final Function(String) chosenAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int index = 0;
  void changeQuestion(String answer) {
    widget.chosenAnswer(answer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[index].question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...questions[index].shuffledAnswer.map(
                  (listItem) => OptionButton(
                      buttonText: listItem,
                      onTapChangeQuestion: () {
                        changeQuestion(listItem);
                      }),
                ), //map
          ],
        ),
      ),
    );
  }
}
