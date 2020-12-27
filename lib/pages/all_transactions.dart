import 'package:flutter/material.dart';

import '../components/transaction_tile.dart';
import '../constants.dart';
import '../data/database.dart';
import '../models/Transaction.dart';
import '../theme.dart';

class AllTransactionsPage extends StatefulWidget {
  @override
  _AllTransactionsPageState createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  List<Widget> _transactions;
  Transactions db;
  @override
  void initState() {
    _transactions = null;
    db = new Transactions();
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tranactions'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: _transactions == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _transactions.length,
                itemBuilder: (context, index) => _transactions.elementAt(index),
              ),
      ),
    );
  }

  void initData() async {
    // Get all transactions
    final List<TransactionData> transactions = await db.getAllTransactions();

    if (transactions.length == 0) {
      setState(
        () {
          _transactions = [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  'No transactions',
                  style: kInfoTextStyle,
                ),
              ),
            ),
          ];
        },
      );
      return;
    }

    // Set current month
    String month = '';
    _transactions = [];

    // Add widgets to List
    for (var transaction in transactions) {
      if (getMonth(transaction.timeStamp) != month) {
        month = getMonth(transaction.timeStamp);
        _transactions.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              month.toUpperCase(),
              style: kTitleTextStyle,
            ),
          ),
        );
      }
      _transactions.add(
        TransactionTile(data: transaction),
      );
    }
    setState(() {});
  }
}
