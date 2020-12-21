import 'dart:collection';
import 'package:flutter/material.dart';

import '../models/Transaction.dart';

class TransactionsOverview extends ChangeNotifier {
  // Holds the transactions for the current day
  final List<TransactionData> _latestTransactions = [];

  double _totalIncome = 0;
  double _totalExpense = 0;

  // Get the latest transactions
  UnmodifiableListView<TransactionData> get latestTransactions =>
      UnmodifiableListView(_latestTransactions);

  // Get total income
  double get totalIncome => _totalIncome;

  // Get total expense
  double get totalExpense => _totalExpense;

  void addTransaction(TransactionData transaction) {
    // Remove the last transaction in the list
    _latestTransactions.removeLast();

    // Insert the new Transaction to the start of the list
    _latestTransactions.insert(0, transaction);

    if (transaction.amount >= 0)
      _totalIncome += transaction.amount;
    else
      _totalExpense += transaction.amount.abs();
    notifyListeners();
  }

  void setTotalIcome(double income) {
    _totalIncome = income;
    notifyListeners();
  }

  void setTotalExpense(double expense) {
    _totalExpense = expense;
    notifyListeners();
  }
}
