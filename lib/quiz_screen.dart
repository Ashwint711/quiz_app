import 'package:flutter/material.dart';
import 'package:quiz_app/data/actual_questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/question_answer_summary.dart/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String activeScreen = "home-screen";
  List<String> selectedAnswers = [];
  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomeScreen(
      switchScreen: switchScreen,
    );
    if (activeScreen == "question-screen") {
      screen = QuestionsScreen(chosenAnswer);
    }
    if (activeScreen == "result-screen") {
      screen = ResultsScreen(
        selectedAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 24, 245),
                Color.fromARGB(255, 100, 13, 251),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screen,
        ),
      ),
    );
    ;
  }
}
