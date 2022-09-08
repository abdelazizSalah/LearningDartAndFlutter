import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/Transaction.dart';

class Txs extends StatelessWidget {
  final List<Transaction> transactions;

  Txs({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 440,
      // color: Colors.amber,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "No Transactions Added yet :(",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // SizedBox(
                //   // we can use it a separator
                //   height: 20,
                // ),
                Container(
                    height: 360,
                    width: 400,
                    child: Image.asset('assets/imgs/image/waiting.png',
                        fit: BoxFit.contain))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Container(
                  height: 75,
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.blueAccent,
                    // color: Color.fromARGB(135, 167, 6, 6),
                    color: Theme.of(context).primaryColorDark,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 3),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,

                                    /// This is how we can access the color of the main
                                    /// theme we have, and we can access diffrent
                                    /// sahdes of it
                                    // color: Theme.of(context).accentColor
                                    color: Colors.white,
                                    width: 1.2)),
                            child: Row(children: [
                              Text(
                                transactions[index].currancy +
                                    "${transactions[index].amount}",
                                style: TextStyle(
                                    // decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.5,
                                    shadows: [
                                      Shadow(
                                          blurRadius: 100, color: Colors.black)
                                    ]),
                              )
                            ]),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  transactions[index].title,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                      // backgroundColor: Colors.white,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 40, color: Colors.white)
                                      ]),
                                ),
                              ),
                              Container(
                                child: Text(
                                  // textAlign: TextAlign.center,
                                  //this is the normal way or the manual one
                                  // "${transactions[index].date.day.toString() + "/" + transactions[index].date.month.toString() + "/" + transactions[index].date.year.toString()} ",
                                  //while this is the automatic version using the intl package :)
                                  // there is a difference between small letters and capitals
                                  // see the documentations at https://pub.dev/documentation/intl/latest/
                                  // DateFormat('dd/MM/yyyy')
                                  //     .format(transactions[index].date),
                                  DateFormat.yMMMd()
                                      .format(transactions[index].date),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ));
              },
            ),
    );
  }
}
