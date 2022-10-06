import "package:flutter/material.dart";

//this is a short for the functions which has only one line of code
void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext cont) {
    return Scaffold(
        appBar: AppBar(
            title: Text("My First Project",
                style: TextStyle(
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.white, blurRadius: 10)],
                  fontSize: 30,
                ))),
        drawer: Drawer(),
        body: Container(
          child: Text(
            "Hello Bro!",
            style: TextStyle(
              backgroundColor: Colors.purple,
              color: Colors.pink,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ));
  }
}
