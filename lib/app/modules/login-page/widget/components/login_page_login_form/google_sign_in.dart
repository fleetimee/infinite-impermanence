// 🐦 Flutter imports:
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:

class NotPlannedGoogleSignIn extends StatelessWidget {
  const NotPlannedGoogleSignIn({
    super.key,
    required this.controller,
  });

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Obx(
        () => controller.pernahLogin.value == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          "     OR     ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            // add custom google font
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GFButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                    text: 'SIGN IN WITH GOOGLE',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      // add custom google font
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                    fullWidthButton: true,
                    color: GFColors.DANGER,
                    size: 45,
                    shape: GFButtonShape.pills,
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
