import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(PersonalExpanses());
}

class PersonalExpanses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Personal Expanses",
          style: TextStyle(shadows: [
            Shadow(blurRadius: 30, color: Colors.white, offset: Offset(10, 10))
          ], fontSize: 25.7),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,

            children: [
              Container(
                // alignment: Alignment.topCenter,
                height: 200,
                width: 300,
                child: Card(
                  surfaceTintColor: Colors.red,
                  borderOnForeground: true,
                  child: Text("This is the Chart"),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
              Container(
                width: 300,
                height: 200,
                child: Card(
                  child: Text("This is the list of the TX "),
                  color: Colors.blue,
                  shadowColor: Colors.red,
                  surfaceTintColor: Colors.red,
                  elevation: 50,
                ),
              )
            ]),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to our new application!")),
    );
  }
}
