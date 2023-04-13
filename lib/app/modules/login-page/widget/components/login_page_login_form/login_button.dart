// 🐦 Flutter imports:
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.controller,
  });

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButton(
          onPressed: () {
            if (controller.formKey.currentState?.saveAndValidate() ?? false) {
              controller.login(context);
            } else {
              debugPrint('validation failed');
            }
          },
          text: controller.isLoginProcessing.value ? '' : 'LOGIN',
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,

            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            // add custom google font
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          fullWidthButton: true,
          color: secondaryColor,
          size: 60,
          type: GFButtonType.outline2x,
          shape: GFButtonShape.pills,
          icon: controller.isLoginProcessing.value
              ? const GFLoader(
                  type: GFLoaderType.circle,
                  loaderColorOne: Colors.white,
                  loaderColorTwo: Colors.white,
                  loaderColorThree: Colors.white,
                )
              : const Icon(
                  FontAwesomeIcons.rightToBracket,
                  color: Colors.white,
                  size: 20,
                ),
        ));
  }
}
