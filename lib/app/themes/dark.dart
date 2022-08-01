import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/style.dart';

final textStyle = TextStyle(
    color: secondaryColor,
    //fontFamily: GoogleFonts.plusJakartaSansTextTheme().headline6.fontFamily,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily);
final textTheme = TextTheme(
  headline1: textStyle,
  headline2: textStyle,
  headline3: textStyle,
  headline4: textStyle,
  headline5: textStyle,
  headline6: textStyle,
  subtitle1: textStyle,
  subtitle2: textStyle,
  bodyText1: textStyle,
  bodyText2: textStyle,
  caption: textStyle,
  button: textStyle,
  overline: textStyle,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Colors.grey,
        onPrimary: Colors.white,
        secondary: secondaryColor,
        onSecondary: secondaryColor,
        onSurface: secondaryColor,
        surface: secondaryColor,
        background: secondaryColor,
        error: Colors.red,
        onError: Colors.red,
      ),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
  ),
  dividerColor: Colors.white,
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryColor,
  ),
  primaryTextTheme: textTheme,
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
