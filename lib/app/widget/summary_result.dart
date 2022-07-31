import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

Widget summaryResult(
  String leftSide,
  TextEditingController controller,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(leftSide,
          style: GoogleFonts.courierPrime(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          )),
      Text(
        controller.text,
        style: GoogleFonts.courierPrime(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget summaryResultString(String leftSide, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(leftSide,
          style: GoogleFonts.courierPrime(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          )),
      Text(
        value,
        style: GoogleFonts.courierPrime(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
      ),
    ],
  );
}
