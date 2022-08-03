import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final VoidCallback resetQuiz;
  const ResultWidget({required this.score, required this.resetQuiz, super.key});

  String get resultPhrase {
    String text = 'You did it!';
    if (score > 0 && score <= 10) {
      text = 'You are awesome!';
    } else if (score > 10) {
      text = 'Pretty likeable';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '$score points',
            style: const TextStyle(
              fontSize: 36,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(resultPhrase),
          ElevatedButton(
              key: const Key('resetBtn'),
              onPressed: resetQuiz,
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 17,
                ),
              ))
        ],
      ),
    );
  }
}
