// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../common/style.dart';

Widget colorButton(BuildContext context, String name, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [blue100, blue200]),
          borderRadius: BorderRadius.circular(8),
          color: Colors.green),
      child: Center(
        child: Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    ),
  );
}
