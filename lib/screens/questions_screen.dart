import 'package:flutter/material.dart';
import 'package:flutter_learning/data/questions.dart';
import 'package:flutter_learning/widget/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key, required this.onSelectAnswer, required this.retakeQuiz});

  final void Function(String answer) onSelectAnswer;
  final bool retakeQuiz;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.retakeQuiz) {
      setState(() {
        currentQuestionIndex = 0;
      });
    }
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${currentQuestion.text} ?',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 4, 106, 23),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ...currentQuestion.shuffledAnswers.map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
