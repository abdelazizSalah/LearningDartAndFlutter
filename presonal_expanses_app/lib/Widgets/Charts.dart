import 'package:intl/intl.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Models/Transaction.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransactions;
  final List<String> Days = [
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    "Vacation"
  ];
  Charts(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        (Duration(days: index)),
      );

      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          totalSum += recentTransactions[i].amount;
      }
      return {'Day': DateFormat.E(weekDay), 'Amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Row(children: []),
    ));
  }
}
