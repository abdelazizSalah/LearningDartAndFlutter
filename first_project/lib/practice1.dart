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
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text(
        "Hello Bro!",
        style: TextStyle(backgroundColor: Colors.purple, color: Colors.pink),
      ),
    );
  }
}
