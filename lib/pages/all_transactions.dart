import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/transaction_tile.dart';
import '../components/transaction_details.dart';
import '../constants.dart';
import '../data/database.dart';
import '../models/Transaction.dart';

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

    // Set current month
    String month = getMonth(transactions.elementAt(0).timeStamp);
    _transactions = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(
          month.toUpperCase(),
          style: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.25,
          ),
        ),
      ),
    ];

    // Add widgets to List
    for (var transaction in transactions) {
      if (getMonth(transaction.timeStamp) != month) {
        month = getMonth(transaction.timeStamp);
        _transactions.add(Text(month));
      }
      _transactions.add(
        GestureDetector(
          child: TransactionTile(data: transaction),
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => TransactionDetails(
              data: transaction,
            ),
          ),
        ),
      );
    }
    setState(() {});
  }
}
