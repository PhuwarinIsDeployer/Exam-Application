import 'package:flutter/material.dart';
import 'package:flutter_learning/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      // Make the container circular
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: data['user_answer'] == data['correct_answer']
                            ? [
                                const Color.fromARGB(255, 42, 183, 89),
                                const Color.fromARGB(255, 4, 66, 13)
                              ]
                            : [
                                const Color.fromARGB(255, 220, 30, 30),
                                const Color.fromARGB(255, 245, 96, 96),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align content within Expanded
                      children: [
                        Text(
                          'Question :${data['question'] as String}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Your Answer : ${data['user_answer'] as String}',
                          style: TextStyle(
                            fontSize: 18,
                            color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 4, 255, 12)
                                : Colors.red,
                            shadows: [
                              // Add a shadow with desired properties
                              Shadow(
                                offset: const Offset(2.0,
                                    2.0), // Adjust offset for shadow position
                                blurRadius:
                                    3.0, // Adjust blur radius for shadow softness
                                color: const Color.fromARGB(255, 9, 4, 4)
                                    .withOpacity(
                                        0.4), // Adjust color and opacity
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'The Correct Answer is : ${data['correct_answer'] as String}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
