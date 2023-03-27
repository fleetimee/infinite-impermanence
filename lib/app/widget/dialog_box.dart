// ignore_for_file: overridden_fields, annotate_overrides

import 'package:akm/app/common/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDialog extends AwesomeDialog {
  final BuildContext context;
  final AnimType animType;
  final DialogType dialogType;
  final String title;
  final String desc;
  final String btnOkText;
  final IconData? btnOkIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  ErrorDialog({
    required this.context,
    required this.animType,
    required this.dialogType,
    required this.title,
    required this.desc,
    required this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
  }) : super(
          context: context,
          animType: animType,
          dialogType: dialogType,
          title: title,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          desc: desc,
          btnOkText: btnOkText,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
        );
}
