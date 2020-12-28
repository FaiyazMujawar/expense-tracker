import 'package:flutter/material.dart';

import 'circular_background_icon.dart';
import 'colored_amount.dart';
import '../constants.dart';
import '../theme.dart';
import '../models/Transaction.dart';
import 'transaction_details.dart';

class TransactionTile extends StatelessWidget {
  final TransactionData data;
  final TextOverflow overflow;

  const TransactionTile({
    Key key,
    @required this.data,
    this.overflow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<dynamic> _category = getCategory(data.category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.all(5),
      decoration: kBoxDecoration,
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          )),
          builder: (context) => TransactionDetails(
            data: data,
          ),
        ),
        child: ListTile(
          dense: true,
          leading: CircularBackGroundIcon(
            size: 7,
            icon: _category?.elementAt(1) ?? Icons.add,
            color: _category?.elementAt(2) ?? Colors.green,
          ),
          title: Text(
            data.title,
            overflow: overflow ?? TextOverflow.clip,
            style: kTransactionAmountStyle,
          ),
          subtitle: Text(
            getDate(data.timeStamp, true),
            style: kInfoTextStyle,
          ),
          trailing: ColoredAmount(
            amount: data.amount,
          ),
        ),
      ),
    );
  }
}
