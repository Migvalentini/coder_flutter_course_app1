// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;

  Result(this.score, this.restartQuiz);

  String get getResult {
    if (score < 8) {
      return 'You are awesome and innocent!';
    } else if (score < 12) {
      return 'Pretty likeable!';
    } else if (score < 16) {
      return 'You are ... strange?!';
    } else {
      return 'You are so bad!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            getResult,
            style: 
              TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          child: Text('Restart Quiz?', style: TextStyle(fontSize: 20),),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: restartQuiz,
        )
      ],
    );
  }
}
