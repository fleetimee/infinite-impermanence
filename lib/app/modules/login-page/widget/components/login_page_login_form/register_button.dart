// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Text('Hubungi Admin'),
              content: const Text(
                'Silahkan hubungi admin untuk meminta mendaftar akun',
              ),
              actions: [
                GFButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('OK'))
              ],
            ),
          );
        },
        child: Text(
          'Daftar ?',
          style: TextStyle(
            color: GFColors.LIGHT,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // add custom google font
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
      ),
    );
  }
}
