// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class LinkWithGoogle extends StatelessWidget {
  const LinkWithGoogle({
    super.key,
    required this.controller,
    required this.auth,
  });

  final HomeController controller;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.isLinked.value == true
              ? Center(
                  child: Column(
                    children: [
                      const Text(
                        'You are linked to a google account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        auth.currentUser!.providerData[0].email!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Check if the user is linked to a google account
                controller.isLinked.value == false
                    ? GFButton(
                        onPressed: () {
                          controller.linkGoogleAccount();
                        },
                        text: 'Link',
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        color: GFColors.DANGER,
                        size: GFSize.LARGE,
                        shape: GFButtonShape.pills,
                      )
                    : GFButton(
                        onPressed: () async {
                          controller.unlinkGoogleAccount();
                          await GoogleSignIn().signOut();
                        },
                        text: 'Unlink',
                        icon: const Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        color: GFColors.DANGER,
                        size: GFSize.LARGE,
                        shape: GFButtonShape.pills,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
