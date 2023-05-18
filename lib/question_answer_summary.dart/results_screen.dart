import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/actual_questions.dart';
import 'package:quiz_app/question_answer_summary.dart/summary_rows.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.selectedAnswers,
    required this.restartQuiz,
    super.key,
  }); //constructor

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'index': i,
        'question': questions[i].question,
        'user_answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = getSummaryData().where((mapObject) {
      return mapObject['user_answer'] == mapObject['correct_answer'];
    }).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SummaryRow(getSummaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
