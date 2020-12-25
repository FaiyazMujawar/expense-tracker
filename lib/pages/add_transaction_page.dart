import 'package:expense_tracker/components/labelled_textbox.dart';
import 'package:expense_tracker/models/Transaction.dart';
import 'package:flutter/material.dart';

import '../data/database.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String _title;
  String _description;
  String _amount;
  Transactions db = new Transactions();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Transaction'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              LabelledTextBox(
                label: 'Transaction title',
                hintText: 'Title...',
                action: (value) {
                  _title = value;
                },
              ),
              LabelledTextBox(
                label: 'Transaction description',
                maxLines: 3,
                hintText: 'Description...',
                action: (value) {
                  _description = value;
                },
              ),
              LabelledTextBox(
                label: 'Transaction amount',
                hintText: 'Amount...',
                action: (value) {
                  _amount = value;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.blue,
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await db.insertTransaction(
                      new TransactionData(
                        title: _title,
                        description: _description,
                        timeStamp: new DateTime.now().millisecondsSinceEpoch,
                        amount: double.parse(_amount),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
