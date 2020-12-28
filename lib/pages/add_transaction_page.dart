import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/option_tile.dart';
import '../components/labelled_textbox.dart';
import '../constants.dart';
import '../data/database.dart';
import '../models/Transaction.dart';
import '../models/TransactionsContext.dart';
import '../theme.dart';
import '../components/colored_title.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String _title = '';
  String _amount = '';
  String _description = '';
  String _category = 'LifeStyle';
  bool _isIncome;

  final _formKey = new GlobalKey<FormState>();

  Transactions db;
  @override
  void initState() {
    _isIncome = true;
    db = new Transactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transaction'),
      ),
      body: Form(
        key: _formKey,
        child: Consumer<TransactionsContext>(
          builder: (context, transactions, child) => Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isIncome = true;
                          });
                        },
                        child: _isIncome
                            ? ColoredTitle(
                                title: 'Income',
                                color: Colors.green,
                                icon: Icons.add,
                              )
                            : Text('Income'),
                      ),
                      // For Expense
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isIncome = false;
                          });
                        },
                        child: !_isIncome
                            ? ColoredTitle(
                                title: 'Expense',
                                color: Colors.red,
                                icon: Icons.remove,
                              )
                            : Text('Expense'),
                      ),
                    ],
                  ),
                ),
                LabelledTextBox(
                  label: 'Transaction title',
                  hintText: 'Title...',
                  validator: (String value) =>
                      value.isEmpty || value.trim().length == 0
                          ? 'Please enter a transaction title!'
                          : null,
                  action: (value) {
                    _title = value;
                  },
                ),
                LabelledTextBox(
                  validator: (String value) =>
                      value.isEmpty || value.trim().length == 0
                          ? 'Please enter a desciption for the transaction!'
                          : null,
                  label: 'Transaction description',
                  maxLines: 3,
                  hintText: 'Description...',
                  action: (value) {
                    _description = value;
                  },
                ),
                LabelledTextBox(
                  validator: (String value) =>
                      !RegExp('^\\d+\$').hasMatch(value)
                          ? 'Please enter a valid amount!'
                          : null,
                  label: 'Transaction amount',
                  hintText: 'Amount...',
                  action: (value) {
                    _amount = value;
                  },
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      isDense: true,
                      decoration: kInputDecorationStyle.copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      value: _category,
                      onChanged: _isIncome
                          ? null
                          : (String value) {
                              setState(() {
                                _category = value;
                              });
                            },
                      items: kCategories
                          .map<DropdownMenuItem<String>>(
                            (category) => DropdownMenuItem(
                              value: category.elementAt(0),
                              child: OptionTile(
                                title: category.elementAt(0),
                                icon: category.elementAt(1),
                                color: category.elementAt(2),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                      if (_formKey.currentState.validate()) {
                        double amount = double.parse(_amount);
                        TransactionData transaction = new TransactionData(
                          title: _title,
                          description: _description,
                          timeStamp: new DateTime.now().millisecondsSinceEpoch,
                          amount: _isIncome ? amount : -amount,
                          category: _isIncome ? '' : _category,
                        );
                        transactions.addTransaction(transaction);
                        await db.insertTransaction(transaction);
                        Navigator.pop(context, true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
