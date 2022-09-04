import 'package:flutter/material.dart';
import 'package:presonal_expanses_app/Widgets/InputFields.dart';
import 'package:intl/intl.dart';
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

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String titleInput = "";
  double priceInput = 0.0;
  String currancyInput = "";
  DateTime DateInput = DateTime.now();

  //we use these in order to use the listners
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final currancyController = TextEditingController();

  /// manual functions to be able to change the value of the parameters through
  /// clicking the buttons
  void ChangeTitle(String title) {
    titleInput = title;
  }

  void ChangePrice(String price) => priceInput = double.parse(price);

  void ChangeCurrancy(String curr) => currancyInput = curr;

  void ChangeDate(String date) => DateInput = DateTime.now();

  void printAllData() => print(
      "title = $titleInput\nprice = ${currancyInput + priceInput.toString()}\nDate = ${DateFormat.yMMMd().format(DateInput)}");

  List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
  ];

  void addTransaction() {
    Transaction trans = Transaction(
        id: "T${transactions.length + 1}",
        amount: priceInput,
        currancy: currancyInput,
        date: DateInput,
        title: titleInput);

    setState(() {
      transactions.add(trans);
    });
  }

  void ShowTheInputArea(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            child: InputFields(
                ChangeTitle: ChangeTitle,
                ChangeCurrancy: ChangeCurrancy,
                ChangeDate: ChangeDate,
                amountController: amountController,
                ChangePrice: ChangePrice,
                addTransaction: addTransaction),
          );
        });
  }

  //main build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              ShowTheInputArea(context);
            },
          )
        ],
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
                // Container(
                //     height: 600,
                //     child: NewTransactions(
                //       transactions: Txs,
                //     ))
                Txs(transactions: transactions)
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
        hoverColor: Colors.amber[900],
        focusColor: Colors.amber[900],
        backgroundColor: Color.fromARGB(255, 255, 102, 0),
        onPressed: () {
          ShowTheInputArea(context);
        },
      ),
    );
  }
}
