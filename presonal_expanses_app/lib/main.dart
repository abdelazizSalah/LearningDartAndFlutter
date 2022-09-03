import 'package:flutter/material.dart';
import 'package:presonal_expanses_app/Widgets/InputFields.dart';
import 'package:intl/intl.dart';
import 'package:presonal_expanses_app/Widgets/newTransactions.dart';
import './Widgets/Charts.dart';
import './Widgets/Txs.dart';
import './Models/Transaction.dart';

void main() {
  runApp(PersonalExpanses());
}

class PersonalExpanses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  //main build function
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
        // height: double.infinity,
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 13, 127, 172),

        /// I made it here to be able to scroll the whole page
        // child: SingleChildScrollView(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Charts(),
                /**
                   * 34an t5ly subwidget hya el scrollable lazm t3ml specific height 
                   * and width, w da 34an t2ol le el Scrollable function wlahy lw el 
                   * height zad 3n kaza w el width zad 3n kaza khlas ebd2 scroll. 
                   * but here we can get the problem of poping up the keyboard it 
                   * will cause an overflow 
                   */
                Container(height: 600, child: NewTransactions())
              ],
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
