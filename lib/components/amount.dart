import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'circular_background_icon.dart';

class Amount extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;
  final IconData icon;
  final double height;
  final double width;

  const Amount({
    Key key,
    this.title,
    this.amount,
    this.color,
    this.icon,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.25,
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (icon != null)
            CircularBackGroundIcon(
              icon: icon,
              color: color,
            ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w900,
            ),
          ),
          FittedBox(
            child: Text(
              '₹$amount',
              style: GoogleFonts.sourceSansPro(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
