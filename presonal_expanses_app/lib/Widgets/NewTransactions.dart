import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';
import './InputFields.dart';
import './Charts.dart';
import './Txs.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction() {
    print("Constructor of the NewTransactions Widget!");
  }

  @override
  State<NewTransaction> createState() {
    print('CreateState of NewTransaction');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction>
    with WidgetsBindingObserver {
  // /// this is a method called once when the
  // /// class is created for the first time only
  // @override
  // void initState() {
  //   super.initState();

  //   /// here we are telling flutter
  //   /// hey whenever my app lifecycle changes I want you to go to the observer
  //   /// and call the method which is called didChangeAppLifecycleState
  //   WidgetsBinding.instance.addObserver(this);
  // }

  /// this method is called whenever the appLife cycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  /// this method is called when the program is going to be closed
  // @override
  // void dispose() {
  //   super.dispose();

  //   /// here we are removing the observer to avoid memory leakage
  //   WidgetsBinding.instance.removeObserver(this);
  // }

  String titleInput = "";
  double priceInput = 0.0;
  String currancyInput = "\$";
  DateTime DateInput = DateTime(2022);

  _NewTransactionState() {
    print("_NewTransactionState constructor in the State");
  }

  @override

  /// we usually do here our initializations which are:
  /// 1- Used to make HTTP requests.
  /// 2- loading some data from the server.
  /// 3- loding some data from the data base.
  void initState() {
    /// initState should be called first before any logic in the method,
    /// according to the documentations
    /// but the logic in the initState will not matter and will not
    /// affect any thing but it is a good practice.
    /// and this is a general good practice is that you should call super. first.

    /// the parent class is State Class
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    print('initState method');
  }

  /*
  this is a method which is called whenever the build function is recalled 
  or whenever the widget is updated or rerendered .

  @author Abdelaziz Salah 
  */
  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);

    print("DidUpdateWidget method");
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
    print('Dispose');
  }

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
    var mediaQuery = MediaQuery.of(ctx);
    bool portrait = MediaQuery.of(ctx).orientation == Orientation.portrait;
    showModalBottomSheet(
        constraints: BoxConstraints(
            maxHeight: mediaQuery.size.height * (portrait == true ? 0.55 : 0.7),
            maxWidth: mediaQuery.size.width * (portrait == true ? 0.95 : 0.9)),
        isScrollControlled: true,
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            /// still need to know more about this widget /// still need to know more about this widget
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: portrait == true ? 20 : 5,
                  horizontal: portrait == true ? 20 : 30),
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
            ),
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
      _ShowTxs == false
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
