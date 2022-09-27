import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TxsCard extends StatelessWidget {
  final index;
  final transaction;
  final removeTransaction;
  const TxsCard(
      {required this.index,
      required this.transaction,
      required this.removeTransaction});

  Widget _buildPortrait() {
    return IconButton(
        color: Color.fromARGB(255, 207, 160, 18),
        icon: Icon(Icons.delete),

        /// we should remove this item
        onPressed: () => removeTransaction(index));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var portrait = mediaQuery.orientation == Orientation.portrait;
    Widget _buildLandScape() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Row(
          children: [
            _buildPortrait(),
            Text(
              'Delete',
              style: TextStyle(color: Color.fromARGB(255, 207, 160, 18)),
            )
          ],
        ),
      );
    }

    return Card(
      elevation: 8,
      color: Theme.of(context).primaryColorLight,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: ListTile(
          leading:

              /// Circular Avatar
              Container(
            margin: EdgeInsets.only(left: !portrait ? 50 : 0),
            child: CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              radius: 30,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "${transaction.currancy} ${transaction.amount}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      blurRadius: 90,
                      offset: Offset(10, 10),
                      color: Colors.black87)
                ]),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
            style: TextStyle(fontSize: 14),
          ),
          trailing: portrait ? _buildPortrait() : _buildLandScape()),
    );
  }
}
