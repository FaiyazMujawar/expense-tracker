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
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
