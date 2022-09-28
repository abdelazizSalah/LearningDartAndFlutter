import 'package:flutter/material.dart';
import './Widgets/NewTransactions.dart';

void main() {
  // /// This is how we can prevent the landScape mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(PersonalExpanses());
}

class PersonalExpanses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        /// this title is what you see when the program is
        /// running in the background mode or the name in the
        /// task manager window
        title: "Personal Expanses",
        debugShowCheckedModeBanner: false,
        home: NewTransaction(),

        /// this is how we can set a theme for the whole program
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
            fontFamily: 'OpenSans',
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.indigo, fontSize: 18)),
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 30,
              shadows: [Shadow(blurRadius: 40, color: Colors.white)],
            ))));
  }
}
