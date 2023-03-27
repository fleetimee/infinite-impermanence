import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class BottomNavBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  const BottomNavBarButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GFButton(
        onPressed: onPressed,
        text: text,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        size: GFSize.LARGE,
        color: primaryColor,
      ),
    );
  }
}
