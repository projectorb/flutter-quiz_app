import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var t = 'You did it';

    if (resultScore <= 4) {
      t = 'Awesome';
    } else if (resultScore <= 8) {
      t = 'Noicee...';
    } else if (resultScore <= 12) {
      t = 'Strangeeeeee';
    } else {
      t = 'Dangerous';
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          RaisedButton(child: Text('restart'), onPressed: resetQuiz)
        ],
      ),
    );
  }
}
