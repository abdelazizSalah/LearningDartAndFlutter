import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  // here we write the backend code

  @override
  /* This method is responsible for building the UI */
  Widget build(BuildContext context) {
    return MaterialApp(
      // the material app is the root widget which must be found
      // in the class on which we run the function runApp ()
      home: WelcomePage(),
    );
  }
}

// each class we create represents a new page
// each page can be either
// 1- StatelessWidget -> no interactions occurs
// 2- StatefullWidget -> has interactions
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text("Hello Zizo!"),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text("Login"),
    );
  }
}
