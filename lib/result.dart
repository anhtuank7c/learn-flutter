import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  const ResultWidget({required this.score, super.key});

  String get resultPhrase {
    String text = 'You did it!';
    if (score <= 10) {
      text = 'You are awesome!';
    } else if (score <= 20) {
      text = 'Pretty likeable';
    } else if (score == 0) {
      text = 'Oh man. You\'re so bad!';
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
        ],
      ),
    );
  }
}
