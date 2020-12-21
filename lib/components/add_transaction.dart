import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../models/Transaction.dart';
import '../data/database.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String _title;
  String _description;
  String _amount;
  Transactions _transactions;
  @override
  void initState() {
    _transactions = new Transactions();
    super.initState();
  }

  final TextEditingController _titleController = TextEditingController(),
      _descController = TextEditingController(),
      _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, transactions, child) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                decoration: kInputDecorationStyle('Title'),
                onChanged: (value) {
                  _title = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _descController,
                keyboardType: TextInputType.text,
                decoration: kInputDecorationStyle('Description'),
                onChanged: (value) {
                  _description = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: kInputDecorationStyle('Amount'),
                onChanged: (value) {
                  _amount = value;
                },
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                color: Colors.blue,
                shape: kRoundedButton,
                child: Text(
                  'ADD TRANSACTION',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  _titleController.clear();
                  _descController.clear();
                  _amountController.clear();

                  TransactionData transaction = new TransactionData(
                    title: _title,
                    description: _description,
                    amount: double.parse(_amount),
                    timeStamp: new DateTime.now().millisecondsSinceEpoch,
                  );
                  transactions.addTransaction(transaction);
                  await _transactions.insertTransaction(transaction);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
