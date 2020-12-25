import 'dart:collection';
import 'package:flutter/material.dart';

import 'Transaction.dart';
import '../data/database.dart';

class TransactionsContext extends ChangeNotifier {
  // Holds the transactions for the current day
  List<TransactionData> _latestTransactions = [];

  TransactionsContext() {
    _initData();
  }

  double _totalIncome = 0;
  double _totalExpense = 0;

  // Get the latest transactions
  UnmodifiableListView<TransactionData> get latestTransactions =>
      UnmodifiableListView(_latestTransactions);

  // Get total income
  double get totalIncome => _totalIncome;

  // Get total expense
  double get totalExpense => _totalExpense;

  ///Initialize the app state from database
  void _initData() async {
    Transactions db = new Transactions();

    var today = new DateTime.now();
    // Set the latest transactions to this day's transactions
    _latestTransactions = await db.getAllTransactionsSince(
      new DateTime(
        today.year,
        today.month,
        today.day,
      ).millisecondsSinceEpoch,
    );
    notifyListeners();

    double totalIncome = 0, totalExpense = 0;

    // Get all transactions for this month
    List<TransactionData> transactions = await db.getAllTransactionsSince(
      new DateTime(
        today.year,
        today.month,
        1,
      ).millisecondsSinceEpoch,
    );

    // Calculate & set total income/expense
    for (var transaction in transactions) {
      if (transaction.amount >= 0)
        totalIncome += transaction.amount;
      else
        totalExpense += transaction.amount.abs();
    }
    _totalIncome = totalIncome;
    _totalExpense = totalExpense;
    notifyListeners();
  }

  void setTotalIncome(double income) {
    _totalIncome = income;
    notifyListeners();
  }

  void setTotalExpense(double expense) {
    _totalExpense = expense;
    notifyListeners();
  }

  void addTransaction(TransactionData transaction) {
    // Remove the last transaction in the list
    if (_latestTransactions.length > 2) _latestTransactions.removeLast();

    // Insert the new Transaction to the start of the list
    _latestTransactions.insert(0, transaction);

    if (transaction.amount >= 0)
      _totalIncome += transaction.amount;
    else
      _totalExpense += transaction.amount.abs();
    notifyListeners();
  }
}
