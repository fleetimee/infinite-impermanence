// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/widget/components/home_profile/avatar.dart';
import 'package:akm/app/modules/home/widget/components/home_profile/user_input.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class FormFirebase extends StatelessWidget {
  const FormFirebase({
    Key? key,
    required this.auth,
    required this.controller,
  }) : super(key: key);

  final FirebaseAuth auth;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: blue400,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Avatar(
                        controller: controller,
                      ),
                    ),
                  ),
                  UserInput(
                    controller: controller,
                    auth: auth,
                  ),
                ],
              ),
              Obx(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
