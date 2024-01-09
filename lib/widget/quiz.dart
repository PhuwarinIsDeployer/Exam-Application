import 'package:flutter/material.dart';
import 'package:flutter_learning/data/questions.dart';
import 'package:flutter_learning/screens/questions_screen.dart';
import 'package:flutter_learning/screens/result_screen.dart';
import 'package:flutter_learning/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  late bool isRetakeQuiz = false;

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void retakeQuiz() {
    setState(() {
      isRetakeQuiz = true;
    });
    selectedAnswers = [];
    switchScreen();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        retakeQuiz: isRetakeQuiz,
      );
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultsScreen(
        chooseAnswers: selectedAnswers,
        onRatakeQuiz: retakeQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 184, 255, 212),
              Color.fromARGB(255, 2, 162, 58)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
