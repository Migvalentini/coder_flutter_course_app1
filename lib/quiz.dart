// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int score) respond;

  Quiz({
    required this.selectedQuestion,
    required this.questions,
    required this.respond,
  });
  
  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
  List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['answers'] as List<Map<String, Object>>
        : [];

    return Column(children: <Widget>[
      Question(questions[selectedQuestion]['question'].toString()),
      ...answers.map((res) {
        return Answer(res['text'].toString(), () => respond(res['score'] as int));
      }).toList(),
    ]);
  }
}
