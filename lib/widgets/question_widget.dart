import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final String answer;

  const QuestionWidget({
    required this.question,
    required this.options,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Column(
          children: options.map((option) {
            return ElevatedButton(
              onPressed: () {
                // Handle option selection here
              },
              child: Text(option),
            );
          }).toList(),
        ),
      ],
    );
  }
}
