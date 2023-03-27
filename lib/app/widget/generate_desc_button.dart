import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ButtonGenDesc extends StatelessWidget {
  final String text;
  final IconData icon;

  final void Function()? onPressed;

  /// Button Widget that function to generate description
  const ButtonGenDesc({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 250,
        child: GFButton(
          onPressed: onPressed,
          text: text,
          textStyle: const TextStyle(
            color: secondaryColor,
            fontSize: 18,
          ),
          shape: GFButtonShape.pills,
          icon: Icon(
            icon,
            color: secondaryColor,
          ),
          size: GFSize.LARGE,
          color: primaryColor,
        ),
      ),
    );
  }
}
