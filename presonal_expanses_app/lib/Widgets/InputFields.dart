import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final ChangeTitle;
  final amountController;
  final ChangeCurrancy;
  final ChangeDate;
  final ChangePrice;
  final addTransaction;
  final clearTransaction;

  const InputFields(
      {required this.amountController,
      required this.ChangeTitle,
      required this.ChangeCurrancy,
      required this.clearTransaction,
      required this.ChangeDate,
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
              onChanged: ChangeTitle,
            ),
            TextField(
              decoration: InputDecoration(labelText: "currancy"),
              onSubmitted: (_) {
                addTransaction();
              },
              onChanged: ChangeCurrancy,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Date"),
              onSubmitted: (_) {
                addTransaction();
              },
              onChanged: ChangeDate,
            ),
            Row(
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
                ElevatedButton(
                    // onPressed: (String id, String title, double amount, String currancy, DateTime date) {
                    //   Transactoin tx = Transactoin(id: id, title: title, amount: amount, currancy: currancy, date: date)
                    //   transactions.add(tx);
                    // },
                    onPressed: () {
                      clearTransaction();
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
