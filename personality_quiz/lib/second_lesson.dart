import "package:flutter/material.dart";

void main() {
  runApp(anyNameWillBeValid());
}

class anyNameWillBeValid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // responsible for all UI
    return MaterialApp(
      home: AnotherPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("السلام عليكم اخواني و احبائي",
          style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25.6,
              fontFamily: "Arial",
              fontWeight: FontWeight.w300,
              shadows: [
                Shadow(
                    color: Colors.deepPurple,
                    blurRadius: 15.7,
                    offset: Offset(40, 25))
              ],
              decoration: TextDecoration.underline,
              decorationColor: Colors.purple[100],
              fontStyle: FontStyle.italic,
              wordSpacing: 5,
              letterSpacing: 3,
              backgroundColor: Colors.cyanAccent),
          textDirection:
              TextDirection.rtl // el klam da lma nkoon bnktb 3rby baa  ,
          ),
      appBar: AppBar(),
      drawer: Drawer(),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text(
        "Whats Up bro x",
        style: TextStyle(
          backgroundColor: Colors.blue, // lon el background
          fontSize: 30, // 7agm el font
          color: Colors.redAccent, // lon el 7rof
          fontWeight: FontWeight.bold, // to2l el 7rf
          letterSpacing: 2.1, // el msafa ben el 7roof
          wordSpacing: 3, // el msafa ben el klemat
          decoration: TextDecoration
              .lineThrough, //  de bt7ot 5at fe nos el klam zy lama ykon fe sale keda w 3auz tshtob 3la el adem w t7ot el gded
          // decoration: TextDecoration.overline // 5t mn fo2 el klam
          // decoration: TextDecoration.underline // 5t mn t7t el klam
          // decoration: TextDecoration.none // da el default
          shadows: [
            Shadow(color: Colors.red, blurRadius: 5, offset: Offset(30, 50)),
          ], // de bt5ly el klam leh del keda
          // el constructor bta3 el shadow bya5ud kaza haga
          // 1- el color hwa lon el shadow
          // 2- el blurRadius hwa drgt el blur kol ma t2l kol ma el shadow hyb2a zyo zy el kelma nfsha
          // kol ma tzed kol ma hyb2a el shadow msh wade7
        ),
      ),
    );
  }
}

/*
  1- Text Widget
  * it is an class in the flutter library which accepts String which is the text you
  want to show in the widget

  * it has some properties which we can use them using separator comma Text("String" , the properties)

  *TextStyle has alot of properties which are very important
    1- fontSize: value in pixels
    2- color: Color(HexaDecimal) -> the hexa decimal represents the degree of the color -> get the code from google
    2-  //  : Colors.red[300] -> you choose the color (which is red here) and [you decide the degree inside the square brackets]
    3- color: Colors.color
    4- fontWeight: FontWeight.w400 -> you choose the weight of the font aw mmkn t5tar no3
    5-  fontWeight: FontWeight.bold
    6-  fontWeight: FontWeight.normal

  ay 7aga lw nset hya bt3ml eh eft7 el documentation aw e3ml hover 3la el kelma hytl3lk short doc keda y2olak el function de bta5ud eh w bt3ml a w kda
 */
