import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'circular_background_icon.dart';
import '../models/Transaction.dart';

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
    return Container(
      child: ListTile(
        dense: true,
        leading: CircularBackGroundIcon(
          size: 5,
          icon: data.amount > 0 ? Icons.call_received : Icons.call_made,
          color: data.amount > 0 ? Colors.green : Colors.red,
        ),
        title: Text(
          data.title,
          overflow: overflow ?? TextOverflow.clip,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          getDate(data.timeStamp, true),
        ),
        trailing: FittedBox(
          child: Text(
            "${data.amount >= 0 ? '+ ' : '- '} ₹${data.amount.abs()}",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: data.amount >= 0 ? Colors.green : Colors.red.shade500,
            ),
          ),
        ),
      ),
    );
  }
}
