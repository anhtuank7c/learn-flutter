import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class QuizWidget extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function(int) answerQuestion;
  final int questionIndex;

  const QuizWidget({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    final answers = currentQuestion['answers']! as List<Map<String, Object>>;
    return Container(
      child: Column(
        children: [
          QuestionWidget(currentQuestion['questionText'] as String),
          ...answers.map((answer) {
            return AnswerButtonWidget(
              answer['text'] as String,
              () => answerQuestion(answer['score'] as int),
            );
          }).toList(),
        ],
      ),
    );
  }
}
