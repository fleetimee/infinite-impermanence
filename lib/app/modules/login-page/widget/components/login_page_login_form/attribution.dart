// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:

class Attribution extends StatelessWidget {
  const Attribution({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/home/ojk.png',
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/home/lps.png',
              height: 40,
            ),
          ],
        ),
        Image.asset(
          'assets/images/home/call-center.png',
          height: 40,
        ),
      ],
    );
  }
}
