import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/style.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.white,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.plusJakartaSansTextTheme(),
  scaffoldBackgroundColor: secondaryColor,
);
