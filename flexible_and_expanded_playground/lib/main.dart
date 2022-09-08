import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FlexibleClass());
}

class FlexibleClass extends StatelessWidget {
  const FlexibleClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpandedClass(),
    );
  }
}

class ExpandedClass extends StatelessWidget {
  const ExpandedClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible & Expanded playground"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text("Item1 , pretty big"),
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text("Item2 ,"),
              color: Colors.blue,
            ),
          ),
          Expanded(
            /// simply flexible with tight as fit
            flex: 3,
            child: Container(
              height: 100,
              child: Text("Item3 ,"),
              color: Colors.amber,
            ),
          ),
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              child: Text("Item4 , pretty big"),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
