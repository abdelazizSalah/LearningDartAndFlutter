import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presonal_expanses_app/Widgets/InputFields.dart';
import 'package:intl/intl.dart';
import './Widgets/Charts.dart';
import './Widgets/Txs.dart';
import './Models/Transaction.dart';

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
        home: MainPage(),

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

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String titleInput = "";
  double priceInput = 0.0;
  String currancyInput = "\$";
  DateTime DateInput = DateTime(2022);

  //we use these in order to use the listners
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final currancyController = TextEditingController();

  /// manual functions to be able to change the value of the parameters through
  /// clicking the buttons
  void ChangeTitle(String title) {
    titleInput = title;
  }

  void ChangePrice(String price) => priceInput = double.parse(price);

  void ChangeCurrancy(String curr) => currancyInput = curr;

  void printAllData() => print(
      "title = $titleInput\nprice = ${currancyInput + priceInput.toString()}\nDate = ${DateFormat.yMMMd().format(DateInput)}");

  List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
  ];

  void removeTransaction(int index) {
    setState(() {
      transactions.remove(transactions[index]);
    });
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        DateInput = pickedDate;
      });
      print("titleController.text is ${titleController.text}");
      Navigator.of(context).pop();
      print(titleController.text);
      ShowTheInputArea(context);
    });
  }

  void clearAllEntries() {
    Navigator.of(context).pop();

    setState(() {
      amountController.text = "";
      titleController.text = "";
      DateInput = DateTime(2022);
    });
    ShowTheInputArea(context);
  }

  void addTransaction() {
    /// input validation
    if (DateInput == DateTime(2022) ||
        amountController.text.isEmpty ||
        titleController.text.isEmpty) return;

    Transaction trans = Transaction(
        id: "T${transactions.length + 1}",
        amount: double.parse(amountController.text),
        currancy: "\$",
        date: DateInput,
        title: titleController.text);
    setState(() {
      transactions.add(trans);
    });

    /// to clear the value inside it after adding it
    clearAllEntries();

    /// this is how we can close the showmodalbottomsheet
    /// after submiting certain object
    /// context is special property like widget in the state class
    /// it gives you access to the whole context of the widget you are in.
    Navigator.of(context).pop();

    /// need to know more about the navigator
  }

  void clearTransactions() {
    setState(() {
      transactions.clear();
    });
  }

  void ShowTheInputArea(BuildContext ctx) {
    /// need to know more about the showModalBottomSheet
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            /// still need to know more about this widget /// still need to know more about this widget
            child: InputFields(
                selectedDate: DateInput,
                titleController: titleController,
                amountController: amountController,
                datePicker: _presentDatePicker,
                clearTransaction: clearTransactions,
                clearAllEntries: clearAllEntries,
                ChangeTitle: ChangeTitle,
                ChangeCurrancy: ChangeCurrancy,
                ChangePrice: ChangePrice,
                addTransaction: addTransaction),
          );
        });
  }

  List<Transaction> get _recentTxs {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool _ShowTxs = false;
  //main build function

  List<Widget> _builderPortrait() {
    return [
      Charts(_recentTxs),
      Txs(
        transactions: transactions,
        removeTransaction: removeTransaction,
      )
    ];
  }

  List<Widget> _builderLandScape() {
    return [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Show Txs",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Switch(
            value: _ShowTxs,
            onChanged: (val) {
              setState(() {
                _ShowTxs = val;
              });
            })
      ]),
      _ShowTxs == true
          ? Charts(_recentTxs)

          /**
               * 34an t5ly subwidget hya el scrollable lazm t3ml specific height 
               * and width, w da 34an t2ol le el Scrollable function wlahy lw el 
               * height zad 3n kaza w el width zad 3n kaza khlas ebd2 scroll. 
               * but here we can get the problem of poping up the keyboard it 
               * will cause an overflow 
               */

          : Txs(
              transactions: transactions,
              removeTransaction: removeTransaction,
            )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var portrait = mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        /// in order to set the floating button in the appbar we add the action
        ///  parameter to the IconButton and set the constructor with our values
        actions: [
          IconButton(
              icon: Icon(Icons.layers_clear_sharp),
              onPressed: clearTransactions)
        ],
        centerTitle: true,
        title: Text(
          "Personal Expanses",

          /// in order to set the style to the theme style we need to use the
          /// Theme widget and choose the of constructor and send to it our
          /// context of the main widget to be able to choose which
          /// style from the theme we need to apply on the style
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 222, 230, 233),

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        /// I made it here to be able to scroll the whole page
        // child: SingleChildScrollView(

        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!portrait) ..._builderLandScape(),
                if (portrait) ..._builderPortrait(),
              ],
            );
          },
          itemCount: 1,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ShowTheInputArea(context);
        },
      ),
    );
  }
}
