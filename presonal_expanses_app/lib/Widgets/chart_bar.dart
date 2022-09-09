import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double prcntgOfTotal;

  const ChartBar({
    required this.label,
    required this.spendingAmount,
    required this.prcntgOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// fitted box widget force the child into the available space
        /// so if the space is not enough it decrements its size
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              "\$${spendingAmount.toStringAsFixed(0)}",
              style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 80,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: prcntgOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark, width: 3),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '$label',
          style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
