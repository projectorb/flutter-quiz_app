import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'Whats\' your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4},
      ]
    },
    {
      'questionText': 'Whats\' your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 1},
        {'text': 'Tiger', 'score': 2},
        {'text': 'Dog', 'score': 3},
        {'text': 'Rabbit', 'score': 4},
      ]
    },
    {
      'questionText': 'Who is your favorite instructor',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 2},
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 4},
      ]
    },
  ];

  var _totalScore = 0;
  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex = _questionIndex + 1;
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz Application'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
