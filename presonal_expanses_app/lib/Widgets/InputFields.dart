import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputFields extends StatelessWidget {
  final ChangeTitle;
  final amountController;
  final titleController;
  final ChangeCurrancy;
  final ChangePrice;
  final addTransaction;
  final clearTransaction;
  final clearAllEntries;
  final datePicker;
  final selectedDate;

  const InputFields(
      {required this.datePicker,
      required this.amountController,
      required this.titleController,
      required this.ChangeTitle,
      required this.ChangeCurrancy,
      required this.clearTransaction,
      required this.clearAllEntries,
      required this.selectedDate,
      required this.ChangePrice,
      required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "price"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) {
                addTransaction();
              },

              /// here in the price on submit will be better to be able to parse the whole price
              /// at the end once
              // onSubmitted: ChangePrice,

              //it should be on tap better but we will solve it later.
              // onTap: ChangePrice
              // controller: amountController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) {
                addTransaction();
              },
              controller: titleController,
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(selectedDate == DateTime(2022)
                      ? "No Date Choosen"
                      : "Picked date: ${DateFormat.yMMMd().format(selectedDate)}"),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: TextButton(
                        onPressed: datePicker,
                        child: Text(
                          "Pick a date",
                          style: TextStyle(
                              fontSize: 14.7, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    // onPressed: (String id, String title, double amount, String currancy, DateTime date) {
                    //   Transactoin tx = Transactoin(id: id, title: title, amount: amount, currancy: currancy, date: date)
                    //   transactions.add(tx);
                    // },
                    onPressed: () {
                      addTransaction();
                    },
                    child: Text("Add")),
                SizedBox(
                  width: 80,
                  height: 10,
                ),
                ElevatedButton(
                    // onPressed: (String id, String title, double amount, String currancy, DateTime date) {
                    //   Transactoin tx = Transactoin(id: id, title: title, amount: amount, currancy: currancy, date: date)
                    //   transactions.add(tx);
                    // },
                    onPressed: () {
                      clearAllEntries();
                    },
                    child: Text("Clear")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
