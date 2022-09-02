import 'package:flutter/material.dart';
import './Transaction.dart';
import 'package:intl/intl.dart';

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
  List<Transactoin> transactions = [
    Transactoin(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transactoin(
        id: "t2",
        title: "SunGlasses",
        amount: 265.50,
        currancy: 'EGP ',
        date: DateTime.now()),
    Transactoin(
        id: "t3",
        title: "LapTop",
        amount: 142,
        currancy: 'Euro ',
        date: DateTime.now()),
    Transactoin(
        id: "t4",
        title: "Iphone",
        amount: 942.432,
        currancy: '\$',
        date: DateTime.now()),
    Transactoin(
        id: "t5",
        title: "Watch",
        amount: 900,
        currancy: 'Euro ',
        date: DateTime.now()),
    Transactoin(
        id: "t6",
        title: "TV",
        amount: 4354.223,
        currancy: 'EGP ',
        date: DateTime.now()),
    Transactoin(
        id: "t7",
        title: "Table",
        amount: 42121,
        currancy: 'EGP ',
        date: DateTime.now()),
    Transactoin(
        id: "t8",
        title: "Bed",
        amount: 2343,
        currancy: '\$',
        date: DateTime.now()),
    Transactoin(
        id: "t8",
        title: "Chair",
        amount: 322,
        currancy: 'EGP ',
        date: DateTime.now())
  ];

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
        color: Color.fromARGB(255, 4, 155, 120),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,

            children: [
              Container(
                // alignment: Alignment.topCenter,
                height: 100,
                width: 300,
                child: Card(
                  borderOnForeground: true,
                  child: Text("This is the Chart"),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
              Container(
                width: 300,
                height: 550,
                child: Card(
                  child: Column(children: [
                    //now we need to use the map function in order to return a list of cards
                    ...(transactions as List<Transactoin>).map((trans) {
                      return Container(
                        height: 60,
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.amberAccent,
                          color: Colors.black54,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.amber,
                                          width: 3)),
                                  child: Row(children: [
                                    Text(
                                      trans.currancy,
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      "${trans.amount}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ]),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        trans.title,
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            // backgroundColor: Colors.white,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        // textAlign: TextAlign.center,
                                        //this is the normal way or the manual one
                                        // "${trans.date.day.toString() + "/" + trans.date.month.toString() + "/" + trans.date.year.toString()} ",
                                        //while this is the automatic version using the intl package :)
                                        // there is a difference between small letters and capitals
                                        // see the documentations at https://pub.dev/documentation/intl/latest/
                                        // DateFormat('dd/MM/yyyy')
                                        //     .format(trans.date),
                                        DateFormat.yMMMd().format(trans.date),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      );
                    }).toList(),
                  ]),
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
