// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, annotate_overrides

import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

main() {
  runApp(QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'question': "What's your favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'question': "What's your favorite instructor?",
      'answers': [
        {'text': 'Maria', 'score': 10},
        {'text': 'John', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Pedro', 'score': 1}
      ],
    }
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _respond(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Question'),
        ),
        body: hasSelectedQuestion
          ? Quiz(
            selectedQuestion: _selectedQuestion,
            questions: _questions,
            respond: _respond,
          )
          : Result(_totalScore, _restartQuiz)));
  }
}

class QuestionApp extends StatefulWidget {
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
