// this is the file which contains the decoration @required <-
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final String currancy;
  final DateTime date;

  /// required means that this parameter must take a value during the initialization
  /// when we use it with final keyword
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.currancy,
    required this.date,
  });
}
