import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrect = data['user_answer'] == data['correct_answer'];

              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: isCorrect
                              ? const Color.fromARGB(255, 150, 198, 241)
                              : const Color.fromARGB(255, 249, 133, 133),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 22, 2, 56),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the left
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 249, 133, 133),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                                height: 5), // Added space between answers
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 150, 198, 241),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Added space between rows
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
