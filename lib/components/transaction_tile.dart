import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'circular_background_icon.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final double amount;

  const TransactionTile({Key key, this.title, this.date, this.amount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircularBackGroundIcon(
                size: 5,
                icon: amount > 0 ? Icons.call_received : Icons.call_made,
                color: amount > 0 ? Colors.green : Colors.red,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      title,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              FittedBox(
                child: Text(
                  "₹${amount.abs()}",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
