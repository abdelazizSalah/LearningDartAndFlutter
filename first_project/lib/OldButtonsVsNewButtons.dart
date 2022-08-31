import 'package:flutter/material.dart';

void main() {
  runApp(Buttons());
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ButtonsLesson",
            style: TextStyle(
                shadows: [Shadow(blurRadius: 10, color: Colors.white)])),
      ),
      body: Column(children: [
        Container(
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              print("HelloWorld!");
            },
            child: Text("Elevated Button"),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.red),
            //   foregroundColor: MaterialStateProperty.all(Colors.amber),
            // ),
            // another method for styling
            style: ElevatedButton.styleFrom(
                // primary by3ml el color bta3 el button nfso msh el font color
                primary: Colors.red,
                onPrimary: Colors.black),
            // el onPrimary by3ml el color bta3 el text
          ),
        ),
        Container(
          /**
           * The primary item here is the text not the background
           */
          width: 300,
          child: TextButton(
            onPressed: () {
              print("TextButton!");
            },
            child: Text("Text Button"),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.red),
            //   foregroundColor: MaterialStateProperty.all(Colors.amber),
            // ),
            // another method for styling
            style: TextButton.styleFrom(
                // primary by3ml el color bta3 el button nfso msh el font color
                primary: Colors.red,
                backgroundColor: Colors.yellowAccent),
            // el onPrimary by3ml el color bta3 el text
          ),
        ),
        Container(
          /**
           * The primary item here is the text not the background
           */
          child: OutlinedButton(
            onPressed: () {
              print("OutLinedButton!");
            },
            child: Text("OutLined Button"),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.red),
            //   foregroundColor: MaterialStateProperty.all(Colors.amber),
            // ),
            // another method for styling
            style: OutlinedButton.styleFrom(
                // primary by3ml el color bta3 el button nfso msh el font color
                primary: Colors.blueGrey,
                side: BorderSide(color: Colors.red),
                backgroundColor: Colors.greenAccent),
            // el onPrimary by3ml el color bta3 el text
          ),
        ),
      ]),
    );
  }
}

/**
 * old buttons are -> 
 * 1- RaisedButtons
 * 2- FlateButtons 
 * 3- OutLineButtons 
 */

/**
 * new Buttons are -> 
 * 1- Elevated buttons 
 *  its advantages -> it takes the color of the theme applied in the app automatically
 *  better in styling 
 */
