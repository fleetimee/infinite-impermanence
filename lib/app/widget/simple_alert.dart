import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

class NativePromptAlert extends StatelessWidget {
  final int index;

  const NativePromptAlert({
    super.key,
    required this.controller,
    required this.index,
    required this.title,
    required this.content,
    this.onPressedDanger,
    this.onPressedSuccess,
    required this.textDanger,
    required this.textSuccess,
  });

  final dynamic controller;
  final String title;
  final String content;
  final String textDanger;
  final String textSuccess;
  final void Function()? onPressedDanger;
  final void Function()? onPressedSuccess;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      actions: [
        GFButton(
          color: GFColors.DANGER,
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: onPressedDanger,
          text: textDanger,
        ),
        GFButton(
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: onPressedSuccess,
          text: textSuccess,
        )
      ],
    );
  }
}

class NativePromptAlertPink extends StatelessWidget {
  final int index;

  const NativePromptAlertPink({
    super.key,
    required this.controller,
    required this.index,
    required this.title,
    required this.content,
    this.onPressedDanger,
    this.onPressedSuccess,
    required this.textDanger,
    required this.textSuccess,
  });

  final dynamic controller;
  final String title;
  final String content;
  final String textDanger;
  final String textSuccess;
  final void Function()? onPressedDanger;
  final void Function()? onPressedSuccess;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.pinkAccent,
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      actions: [
        GFButton(
          color: GFColors.DANGER,
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: onPressedDanger,
          text: textDanger,
        ),
        GFButton(
          color: Colors.pink,
          size: GFSize.LARGE,
          shape: GFButtonShape.pills,
          onPressed: onPressedSuccess,
          text: textSuccess,
        )
      ],
    );
  }
}
