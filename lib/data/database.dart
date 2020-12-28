import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Transaction.dart';

class Transactions {
  Database _db;
  // int _touchIndex = 0;

  // Get the database connection
  Future<Database> getDatabaseConnection() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'transactions.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE IF NOT EXISTS Transactions(title TEXT,description TEXT, category TEXT,amount REAL, timeStamp INTEGER)',
        );
      },
      version: 1,
    );
  }

  /// Inserts a new `transaction` into the database.
  Future<int> insertTransaction(TransactionData transaction) async {
    // Get the database connection
    if (_db == null) _db = await getDatabaseConnection();

    // Insert the transaction record into database.
    return await _db.insert(
      'Transactions',
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get all transactions from the database.
  Future<List<TransactionData>> getAllTransactions() async {
    // Get database connection
    if (_db == null) _db = await getDatabaseConnection();

    // Get all records from the database
    List<Map<String, dynamic>> result = await _db.query(
      'Transactions',
      orderBy: 'timeStamp DESC',
    );

    return List.generate(
      result.length,
      (index) => TransactionData(
        title: result[index]['title'],
        description: result[index]['description'],
        category: result[index]['category'],
        amount: result[index]['amount'],
        timeStamp: result[index]['timeStamp'],
      ),
    );
  }

  /// Get all transactions since a given date
  Future<List<TransactionData>> getAllTransactionsSince(int timeStamp) async {
    if (_db == null) _db = await getDatabaseConnection();

    final List<Map<String, dynamic>> result = await _db.query(
      'Transactions',
      where: 'timeStamp >= ?',
      whereArgs: [
        timeStamp,
      ],
      orderBy: 'timeStamp DESC',
    );

    // Return the result as List<TransactionData>
    return List.generate(
      result.length,
      (index) => TransactionData(
        title: result[index]['title'],
        description: result[index]['description'],
        category: result[index]['category'],
        amount: result[index]['amount'],
        timeStamp: result[index]['timeStamp'],
      ),
    );
  }
}
