import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/Transaction.dart';

class Txs extends StatelessWidget {
  final List<Transaction> transactions;

  Txs({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
              child: Container(
            height: 60,
            child: Card(
              elevation: 20,
              shadowColor: Colors.amberAccent,
              color: Color.fromARGB(135, 167, 6, 6),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.amber,
                              width: 3)),
                      child: Row(children: [
                        Text(
                          transactions[index].currancy +
                              "${transactions[index].amount}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.white,
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
                            transactions[index].title,
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
                            // "${transactions[index].date.day.toString() + "/" + transactions[index].date.month.toString() + "/" + transactions[index].date.year.toString()} ",
                            //while this is the automatic version using the intl package :)
                            // there is a difference between small letters and capitals
                            // see the documentations at https://pub.dev/documentation/intl/latest/
                            // DateFormat('dd/MM/yyyy')
                            //     .format(transactions[index].date),
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
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
