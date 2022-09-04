import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;

  //VoidCall back is used as the updated version of function class it should return void
  // it only used to call functions from the main widget which is not implemented here
  // in the class

  // we insert the functions where we should apply the logic then we call them using
  //the VoidCallback in any other widget if needed
  final VoidCallback functionHandler;

  Answer(this.answer, this.functionHandler);

  @override
  Widget build(BuildContext context) {
    Color c1 = Colors.white;
    if (answer == 'Black')
      c1 = Colors.black;
    else if (answer == 'Green')
      c1 = Colors.greenAccent;
    else if (answer == 'Red')
      c1 = Colors.red;
    else if (answer == 'Blue') c1 = Colors.white;
    return Container(
        // we should always set the height and the width :)
        width: 300,
        height: 60,
        margin: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: functionHandler,
          child: Text(answer),
        ));
  }
}
