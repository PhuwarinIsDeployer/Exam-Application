import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  final titleText = 'Oracle Certification Testing';

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 1,
          child: Image.asset(
            'assets/images/exam-icon.png',
            width: 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          titleText,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 233, 254, 96),
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.access_alarms_rounded),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20),
            ))
      ],
    ));
  }
}
