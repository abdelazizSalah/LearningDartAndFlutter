import 'package:flutter/material.dart';

void main() {
  runApp(PersonalityJudge());
}

class PersonalityJudge extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      home: QuizClass(),
    );
  }
}

/*
  creating a stateful widget 
*/
class QuizClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    //this is how we also connnect the two widgets together :D
    return HomePage();
    // this function must return state widget
  }
}

// this is how we connect the state class to the widget i want
// as State is a generic class so we can send to it my customized data type
class HomePage extends State<QuizClass> {
  String _appName = "";
  int questionsCntr = 0;

  List<String> Questions = [
    "What's your favorite color?",
    "What's your favorite animal?"
  ];
  void TheQuestionSolutions() {
    // this will print it in the console not in the UI but we can the properties of the class
    // in order to be able to use dynamic values
    setState(() {
      questionsCntr = (questionsCntr + 1) % 2;
    });
  }

  void answerQuestion1() => _appName += '1';
  void answerQuestion2() => _appName += '2';
  void answerQuestion3() => _appName += '3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            // "Personality Quiz!",
            _appName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 20, // this makes the text shines :D
                  )
                ]),
          ),
        ),
        drawer: Drawer(),
        body: Column(
          children: [
            Text(
              Questions[questionsCntr],
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed:
                  answerQuestion1, // ehna bnb3t esm el function bs msh bn3mlha call, 34an fe ay w2t ndos el onpress hya el btro7 te3ml excute
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: (() => {answerQuestion2()}),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: ((() => answerQuestion3())),
            ),
            RaisedButton(
              child: Text('The Solution'),
              onPressed: ((() => TheQuestionSolutions())),
            ),
          ],
        ));
  }
}

/*
  each widget takes only one paramter

  to solve this we use some invisibe widgets which are rows and columns to be able to stack elements together

 */

/*
  some of the materials here are old versions so they may be deprecated or not availabe at all
  such as Raised Button -> any deprecated item will have a strikeThrough line
            decoration: TextDecoration.lineThrough, // this is how we insert a lineThrough the elements
to solve this we use instead ElevatedButton
 */

/**
 * OnPress explaination: 
 * 
 * 1- it takes a function which returns void and takes no arguments
 * 2- when it takes the function we don't call it with the brackets 
 *    we just write the name of the function -> because we dont want to excute the 
 *    function we just want it to be excuted when the user press on the button, so the onpress internally takes this name and excutes it so 
 *    you just send the name without the brackets
 * 3- when you add () you are telling dart that the value of the onpress is the return of the functions answer Question which is not our case 
 * 4- 
 */

/**
 * The Anonymous functions: lambda
 * (the parameters) => { the body }
 * 
 * we use it if we want to use certain function only once in the code as a lambda 
 * for the onpress as example
 * 
 * it only represents the function definition
 * if we want to excute it we use () after it
 */

/**
 * notice that we can't make any change in a Stateless widget so even if you made the same operations but you 
 * have choosen the Stateless widgets nothing is gonna happens :D 
 * 
 * so we must use the statfull widgets :D 
 */
