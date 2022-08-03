import 'package:flutter/material.dart';

class AnswerButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String answer;
  const AnswerButtonWidget(this.answer, this.onPress, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPress,
        child: Text(answer),
      ),
    );
  }
}
