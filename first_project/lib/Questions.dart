import 'package:flutter/material.dart';

///The idea from this class is to split your app into separated widgets which is
/// the good practice.

class Questions extends StatelessWidget {
  //  it is prefered to set its parameters as final becuase we shouldn't change their
  //  values inside the class, so whenever they take their initial values we should
  //  not assign them again

  final String questionText;

  // this is the constructor of the class where we take the input data to the class
  // in order to update the widget
  Questions(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //only is a special constructor for EdgeInsets class
      // also other options are constructors -> all, LTRB, symmetric and so on
      margin: EdgeInsets.only(top: 20),

      // if you have not set the width and height it will be automaticaly set as
      // the size of the items inserted
      width: double.infinity,
      // height: double.infinity,

      child: Text(
        questionText,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        //here this is an enum
        // this align the design where you want either left, right or at center
        textAlign: TextAlign.center,
      ),
    );
  }
}

/**
 * ShortCut -> 
 * press s and flutter will suggest you a list of widgets you can choose from them
 * press ctrl+space to get list of things to help you remember what you can do
 * press ctrl and hover over things you will see its documentations
 * */

/**
 * Despite being stateless widget but we can change its content using the input data 
 * through the constructor or manually, this means that if the data is sent in 
 * the constructor the content of the widget will be changed, However if we have 
 * a property here and tried to change its value here ie(questionText = "AnyString")
 * this will not be reflected in the UI as this widget is stateless so it takes only
 * one initial state and never changed until it is re rendered or rebuilt
 *
 */
