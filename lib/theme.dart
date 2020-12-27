import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Page: Amount.dart

var kAmountBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: Border.all(
    width: 1.25,
    color: Colors.grey.shade300,
  ),
);

var kAmountTextStyle = GoogleFonts.lato(
  fontSize: 26,
  fontWeight: FontWeight.w400,
);

// Page: colored_amount.dart

var kColoredAmountTextStyle = (double amount) => GoogleFonts.lato(
      fontWeight: FontWeight.bold,
      color: amount >= 0 ? Colors.green : Colors.red.shade500,
    );

// Page: colored_title.dart

var kAmountTitleTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.w500,
  color: Colors.grey.shade700,
);

// Page: labelled_textbox.dart

var kInputLabelTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

var kInputDecorationStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade200,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
      width: 2.0,
    ),
  ),
);

// Page: TransactionTile.dart
var kTransactionAmountStyle = GoogleFonts.lato(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

// Page: HomePage.dart

var kTitleTextStyle = GoogleFonts.robotoCondensed(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
);

var kInfoTextStyle = TextStyle(
  color: Colors.grey.shade400,
);
