import 'package:expense_tracker/components/option_tile.dart';
import 'package:flutter/material.dart';

import 'key_value_pair.dart';
import '../constants.dart';
import '../models/Transaction.dart';
import 'colored_amount.dart';

class TransactionDetails extends StatelessWidget {
  final TransactionData data;

  const TransactionDetails({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<dynamic> _category = getCategory(data.category);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 10),
                child: Text(
                  'Transaction Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            KeyValuePair(
              title: 'Title',
              value: data.title,
              trailing: ColoredAmount(
                amount: data.amount,
              ),
            ),
            KeyValuePair(
              title: 'Date',
              value: getDate(data.timeStamp, true),
            ),
            KeyValuePair(
              title: 'Description',
              value: data.description,
            ),
            if (_category != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Category:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: OptionTile(
                      title: _category.elementAt(0),
                      icon: _category.elementAt(1),
                      color: _category.elementAt(2),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
