import 'package:first_project/Result.dart';
import 'package:flutter/material.dart';
import 'Quiz.dart';

//now this file is the common denominator of the other utility widgets which are the
//Questions and the Answer widget
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
  void TheQuestionSolutions(int score) {
    // this will print it in the console not in the UI but we can the properties of the class
    // in order to be able to use dynamic values
    _totalScore += score;
    setState(() {
      _questionsCntr += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionsCntr = 0;
      _totalScore = 0;
    });
  }

  int _totalScore = 0;
  int _questionsCntr = 0;

  /**
   * I will judge the person by how strange he is -> more dark person gets higher score
   */
  static const List<Map> _questionList = [
    {
      "QuestionText": "What's your favorite color?",
      "Answers": [
        {"text": "Red", "Score": 7},
        {"text": "White", "Score": 1},
        {"text": "Black", "Score": 10},
        {"text": "Green", "Score": 5},
      ]
    },
    {
      "QuestionText": "What's your favorite animal?",
      "Answers": [
        {"text": "Lion", "Score": 7},
        {"text": "Bear", "Score": 10},
        {"text": "Cat", "Score": 1},
        {"text": "Dog", "Score": 5},
      ]
    },
    {
      "QuestionText": "Who's your favorite type of movies?",
      "Answers": [
        {"text": "Tragedy", "Score": 5},
        {"text": "Horro", "Score": 7},
        {"text": "Science-Fiction", "Score": 3},
        {"text": "Comedy", "Score": 1},
        {"text": "Action", "Score": 10},
      ]
    },
    {
      "QuestionText": "Which of these words describes you the best?",
      "Answers": [
        {"text": "Arogant", "Score": 10},
        {"text": "extrovert", "Score": 1},
        {"text": "Crazy", "Score": 5},
        {"text": "introvert", "Score": 3},
        {"text": "Lazy", "Score": 7},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // this is to center the title ;)
          centerTitle: true,
          title: const Text(
            // "Personality Quiz!",
            "Personality Quiz!",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 20, // this makes the text shines :D
                  )
                ]),
            textAlign: TextAlign.center,
          ),
        ),
        // drawer: Drawer(),
        //this is how we can display widgets conditionally :)
        body: _questionsCntr < _questionList.length
            ? Quiz(_questionList, _questionsCntr, TheQuestionSolutions)
            // ignore: prefer_const_constructors
            : Result(_totalScore, _resetQuiz));
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
