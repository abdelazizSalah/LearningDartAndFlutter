import 'package:flutter/material.dart';
import 'InputFields.dart';
import 'Txs.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  const NewTransactions({Key? key}) : super(key: key);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "New Shoes",
        amount: 99.99,
        currancy: '\$',
        date: DateTime.now()),
    // Transaction(
    //     id: "t2",
    //     title: "SunGlasses",
    //     amount: 265.50,
    //     currancy: 'EGP ',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t3",
    //     title: "LapTop",
    //     amount: 142,
    //     currancy: 'Euro ',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t4",
    //     title: "Iphone",
    //     amount: 942.432,
    //     currancy: '\$',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t5",
    //     title: "Watch",
    //     amount: 900,
    //     currancy: 'Euro ',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t6",
    //     title: "TV",
    //     amount: 4354.223,
    //     currancy: 'EGP ',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t7",
    //     title: "Table",
    //     amount: 42121,
    //     currancy: 'EGP ',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t8",
    //     title: "Bed",
    //     amount: 2343,
    //     currancy: '\$',
    //     date: DateTime.now()),
    // Transaction(
    //     id: "t8",
    //     title: "Chair",
    //     amount: 322,
    //     currancy: 'EGP ',
    //     date: DateTime.now())
  ];

  int get TransLen {
    return transactions.length;
  }

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

  ///utility function will be used in the stateful widget modes
  void addTransaction() {
    Transaction trans = Transaction(
        id: "T${TransLen + 1}",
        amount: priceInput,
        currancy: currancyInput,
        date: DateInput,
        title: titleInput);

    setState(() {
      transactions.add(trans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: ((context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputFields(
              ChangeTitle: ChangeTitle,
              ChangePrice: ChangePrice,
              ChangeCurrancy: ChangeCurrancy,
              ChangeDate: ChangeDate,
              amountController: amountController,
              addTransaction: addTransaction,
            ),
            Txs(transactions: transactions)
          ],
        );
      }),
    );
  }
}
