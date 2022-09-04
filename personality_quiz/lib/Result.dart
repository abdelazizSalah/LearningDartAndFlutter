import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  /**
   * Getter function :D
   */
  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'Your Score: $resultScore\n You are awesome and innocent!';
    } else if (resultScore <= 24) {
      resultText = 'Your Score: $resultScore\n You\'re pretty likeable!';
    } else if (resultScore <= 39) {
      resultText = 'Your Score: $resultScore\nYou are ... strange?!';
    } else {
      resultText = 'Your Score: $resultScore\nYou are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.maxFinite,
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Center(
                child: Column(children: [
              Text(
                resultPhrase,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    shadows: [Shadow(blurRadius: 50, color: Colors.amber)]),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: TextButton(
                  child: Text(
                    'Restart Quiz!',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 23,
                      decoration: TextDecoration.underline,
                      shadows: [
                        Shadow(
                            blurRadius: 10,
                            color: Colors.amber,
                            offset: Offset(30, 20)),
                      ],
                    ),
                  ),
                  onPressed: resetHandler,
                ),
              ),
              Container(
                  // margin: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(top: 210),
                  child: Center(
                      child: Text(
                    "The more you score the stranger you are !",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        shadows: [Shadow(blurRadius: 50, color: Colors.amber)]),
                  ))),
            ])),
          ),
        ],
      ),
    ));
  }
}
