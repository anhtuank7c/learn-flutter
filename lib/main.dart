import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const Learn());
}

class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LearnState();
  }
}

class _LearnState extends State<Learn> {
  int _questionIndex = 0;
  final questions = <String>[
    'What\'s your favorite color?',
    'What\'s your favorite animal?',
  ];

  void answerQuestion() {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Column(
          children: [
            QuestionWidget(questions[_questionIndex]),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Answer 01'),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Answer 02'),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  _questionIndex = 0;
                })
              },
              child: Text('Reset question index'),
            )
          ],
        ),
      ),
    );
  }
}
