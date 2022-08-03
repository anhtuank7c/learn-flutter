import 'package:flutter/material.dart';
import 'package:learn/quiz.dart';
import 'package:learn/result.dart';
import 'quiz.dart';
import 'result.dart';

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
  int _totalScore = 0;
  final _questions = [
    {
      "questionText": 'What\'s your favorite color?',
      "answers": [
        {'text': 'Red', 'score': 0},
        {'text': 'Blue', 'score': 0},
        {'text': 'Green', 'score': 0},
        {'text': 'Rose', 'score': 10},
      ],
    },
    {
      "questionText": 'What\'s your favorite food?',
      "answers": [
        {'text': 'Fired rice', 'score': 0},
        {'text': 'Pickle', 'score': 0},
        {'text': 'Spring roll', 'score': 10},
        {'text': 'Pho', 'score': 0},
      ],
    }
  ];

  void _answerQuestion(int score) {
    // final currentQuestion = _questions[_questionIndex];
    // final correctAnswer = currentQuestion['correctAnswer'] as String;
    // final isCorrect = answer == correctAnswer;
    // final hasMore = _questionIndex < _questions.length;
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final question = _questions[_questionIndex];
    // final answers = question['answers']! as List<>;
    final hasMore = _questionIndex < _questions.length;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: hasMore
            ? QuizWidget(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : ResultWidget(score: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
