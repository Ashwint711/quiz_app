import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_answer_summary.dart/index_of_row.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow(this.getSummaryData, {super.key});
  final Function getSummaryData;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summaryData = getSummaryData();
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((questionMapObject) {
            final bool isCorrectAnswer = questionMapObject['user_answer'] ==
                questionMapObject['correct_answer'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowIndex(
                    questionMapObject: questionMapObject,
                    isCorrectAnswer: isCorrectAnswer),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questionMapObject['question'].toString(),
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        questionMapObject['user_answer'].toString(),
                        style: TextStyle(
                          color: isCorrectAnswer
                              ? Colors.blue
                              : Colors.pink.shade300,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        questionMapObject['correct_answer'].toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
