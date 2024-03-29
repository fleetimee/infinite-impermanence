// ignore_for_file: overridden_fields, annotate_overrides

import 'package:akm/app/common/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  ErrorDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.error,
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
          btnOkColor: blue300,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: primaryColor,
        );
}

class ErrorDialogPink extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  ErrorDialogPink({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.error,
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
          btnOkColor: Colors.pinkAccent,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: Colors.pink[800],
        );
}

class SuccessDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  SuccessDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.success,
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
          btnOkColor: blue300,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: primaryColor,
        );
}

class SuccessDialogPink extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  SuccessDialogPink({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.success,
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
          btnOkColor: Colors.pinkAccent,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: Colors.pink[800],
        );
}

class PrompDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  PrompDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.question,
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
          btnOkColor: blue300,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: primaryColor,
        );
}

class PrompDialogPink extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  PrompDialogPink({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.question,
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
          btnOkColor: Colors.pinkAccent,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: Colors.pink[800],
        );
}

class InfoDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  InfoDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.warning,
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
          btnOkColor: blue300,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: primaryColor,
        );
}

class InfoDialogPink extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;
  final IconData? btnOkIcon;
  final IconData? btnCancelIcon;
  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  InfoDialogPink({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnCancelOnPress,
    this.btnCancelText,
    this.btnCancelIcon,
  }) : super(
          context: context,
          animType: AnimType.scale,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dialogType: DialogType.warning,
          title: title,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.pinkAccent,
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
          btnOkColor: blue300,
          btnOkIcon: btnOkIcon,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          btnCancelText: btnCancelText,
          btnCancelIcon: btnCancelIcon,
          dialogBackgroundColor: Colors.pink[800],
        );
}
