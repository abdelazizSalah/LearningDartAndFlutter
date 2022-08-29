import 'package:flutter/material.dart';
import 'Questions.dart';
import 'Answers.dart';

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
  int questionsCntr = 0;

  static const List<Map> questions = [
    {
      "QuestionText": "What's your favorite color?",
      "Answers": ["Red", "Green", "Blue", "Black"]
    },
    {
      "QuestionText": "What's your favorite animal?",
      "Answers": ["Cat", "Dog", "Lion", "Bear"]
    },
    {
      "QuestionText": "Who's your favorite player?",
      "Answers": ["Messi", "Ronaldo", "Benzema", "Salah"]
    },
    {
      "QuestionText": "What's your Hobby?",
      "Answers": [
        "Reading",
        "Writing",
        "Coding",
        "Playing FootBall",
        "Traveling",
        "Music"
      ]
    }
  ];

  void TheQuestionSolutions() {
    // this will print it in the console not in the UI but we can the properties of the class
    // in order to be able to use dynamic values
    setState(() {
      questionsCntr = (questionsCntr + 1) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // this is to center the title ;)
          centerTitle: true,
          title: Text(
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
        body: Container(
          child: Column(
            children: [
              // this is how we can call another widget by using its constructor
              Questions(questions[questionsCntr]["QuestionText"]),

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

              /**
             * to make it dynamically we can use the map method
             * 
             * iterate over all the answers and send them to the Answer constructor and return an Answer objects as list 
             * after that use the spread operator in order to be able to spread them as children for the container :).
             */

              ...(questions[questionsCntr]['Answers'] as List<String>)
                  .map((ans) {
                return Answer(ans, TheQuestionSolutions);
              }).toList()
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(color: Colors.blueGrey, width: 5)),
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
