import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColoredAmount extends StatelessWidget {
  final double amount;

  const ColoredAmount({Key key, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Text(
          "${amount >= 0 ? '+ ' : '- '} ₹${amount.abs()}",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: amount >= 0 ? Colors.green : Colors.red.shade500,
          ),
        ),
      ),
    );
  }
}
