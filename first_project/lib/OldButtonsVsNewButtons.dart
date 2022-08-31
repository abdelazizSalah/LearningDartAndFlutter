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
            margin: EdgeInsets.only(bottom: 50, top: 50),
            width: 400,
            child: Center(
                child: Text(
              "Traffic Sign",
              style: TextStyle(
                  fontSize: 20,
                  shadows: [Shadow(blurRadius: 50, color: Colors.black)]),
            ))),
        Container(
          margin: EdgeInsets.only(bottom: 50),
          height: 100,
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              print("Stop!");
            },
            child: Text("Stop!"),
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
          height: 100,
          width: 400,
          margin: EdgeInsets.only(bottom: 50),
          child: TextButton(
            onPressed: () {
              print("Be prepared!");
            },
            child: Text("Be prepared"),
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
          width: 400,
          height: 100,
          child: OutlinedButton(
            onPressed: () {
              print("Go!");
            },
            child: Text("Go!"),
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
