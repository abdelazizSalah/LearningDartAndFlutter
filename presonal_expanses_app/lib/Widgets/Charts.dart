import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'chart_bar.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransactions;

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
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 2),
        'Amount': totalSum
      };
    });
  }

  double get maxSpending {
    double spending = 0.0;
    for (var amnt in groupedTransactionValues) {
      spending += amnt['Amount'] as double;
    }
    print("MaxSpending = $spending");
    return spending;
  }

  double get maxSpendingUsingFold {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['Amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return recentTransactions.isEmpty
        ? Container(
            height: 0,
          )
        : Container(
            height: 150,
            width: 400,
            // padding: EdgeInsets.all(),
            child: Card(
              child: Card(
                  margin: EdgeInsets.all(5),
                  elevation: 10,
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.blueGrey[200],
                      width: 370,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: groupedTransactionValues.map((data) {
                          /// flexible is used to avoid incresing if size of each
                          /// column alone so it make the whole row symmetric
                          /// each child takes same width and heigth
                          return Flexible(
                            child: ChartBar(
                                label: data['Day'] as String,
                                spendingAmount: data['Amount'] as double,
                                prcntgOfTotal: maxSpending == 0
                                    ? 0.0
                                    : (data['Amount'] as double) / maxSpending),
                          );
                        }).toList(),
                      ),
                    )
                  ])),
            ));
  }
}
