import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme kTextTheme = TextTheme(
  headline1: GoogleFonts.raleway(
    fontSize: 98,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.raleway(
    fontSize: 61,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.raleway(
    fontSize: 49,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.raleway(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.raleway(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.raleway(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.raleway(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.notoSans(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

var kRoundedButton = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),
);

Function kInputDecorationStyle = (String hintText) => InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(
          color: Colors.grey.shade100,
          width: 1.25,
        ),
      ),
    );
