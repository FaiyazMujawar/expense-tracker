import 'package:flutter/material.dart';

import 'colored_title.dart';
import '../theme.dart';

class Amount extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;
  final IconData icon;

  const Amount({
    Key key,
    @required this.title,
    @required this.amount,
    @required this.color,
    @required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: kBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColoredTitle(
            title: title,
            icon: icon,
            color: color,
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(
              amount >= 0 ? '₹$amount' : '- ₹${amount.abs()}',
              style: kAmountTextStyle.copyWith(
                color: amount >= 0 ? Colors.black : Colors.red.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
