// ignore_for_file: invalid_required_positional_param

import 'package:flutter/material.dart';
import 'Questions.dart';
import 'Answers.dart';

class Quiz extends StatelessWidget {
  final List<Map> questions;
  final int questionsCntr;
  final Function TheQuestionSolutions;

  //@required means that we must send them in the constructor we can't neglect any value of them
  // it is a decorator
  const Quiz(
      {required this.questions,
      required this.questionsCntr,
      required this.TheQuestionSolutions});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(color: Colors.blueGrey, width: 5)),
      child: Column(
        children: [
          // this is how we can call another widget by using its constructor
          Questions(questions[questionsCntr]["QuestionText"]),

          /**
             * to make it dynamically we can use the map method
             * 
             * iterate over all the answers and send them to the Answer constructor and return an Answer objects as list 
             * after that use the spread operator in order to be able to spread them as children for the container :).
             */

          // bema enha b2et map fa ana hlf 3la el list w el element el hyb2a m3aya hyb2a 3bara 3n map
          //fa ana mmkn a3ml 7l mn 2
          // el awl eny a5ly el Answer yesst2bl string w ab3t el ans['text']
          // el tany eny akhly el Answer byst2bl map  -> better :)
          ...(questions[questionsCntr]['Answers'] as List<Map>).map((ans) {
            return Answer(
                // here we should all the function on the choosen item

                // ana hena bndh el function 3la kol item mwgod w bdello el score bta3o b7es lw el user est5dmo aw das 3leha yeb2a el value bt3to hya el ana m7ddha
                ans['text'],
                () => TheQuestionSolutions(ans['Score']));
          }).toList()
        ],
      ),
    );
  }
}

/**
           * HardCoding our answer
           */
// Answer(
//     questions[questionsCntr]["Answers"][0], TheQuestionSolutions),
// Answer(
//     questions[questionsCntr]["Answers"][1], TheQuestionSolutions),
// Answer(
//     questions[questionsCntr]["Answers"][2], TheQuestionSolutions),
// Answer(
//     questions[questionsCntr]["Answers"][3], TheQuestionSolutions),
