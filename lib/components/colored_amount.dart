import 'package:flutter/material.dart';

import '../theme.dart';

class ColoredAmount extends StatelessWidget {
  final double amount;

  const ColoredAmount({Key key, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Text(
          "${amount >= 0 ? '+ ' : '- '} ₹${amount.abs()}",
          style: kColoredAmountTextStyle(amount),
        ),
      ),
    );
  }
}
