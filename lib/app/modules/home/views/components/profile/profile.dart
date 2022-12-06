// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              height: 800,
              width: 400,
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
                          child: GFImageOverlay(
                            height: 200,
                            width: 200,
                            shape: BoxShape.circle,
                            image: Image.network(
                              'https://avatars.githubusercontent.com/u/45744788?v=4',
                            ).image,
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Center(
                      //   child: Text(
                      //     auth.currentUser?.displayName ?? 'Unregistered',
                      //     style: const TextStyle(
                      //       fontSize: 30,
                      //       color: secondaryColor,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      Obx(() => Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormBuilderTextField(
                                      controller: controller.displayName =
                                          TextEditingController(
                                              text: auth.currentUser
                                                      ?.displayName ??
                                                  'Unregistered'),
                                      readOnly: controller
                                          .isDisplayNameReadOnly.value,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            controller.isDisplayNameReadOnly
                                                        .value ==
                                                    true
                                                ? const SizedBox()
                                                : IconButton(
                                                    onPressed: () async {
                                                      try {
                                                        await auth.currentUser!
                                                            .updateDisplayName(
                                                                controller
                                                                    .displayName
                                                                    .text)
                                                            .then((value) {
                                                          AwesomeDialog(
                                                            context:
                                                                Get.context!,
                                                            dialogType:
                                                                DialogType
                                                                    .success,
                                                            animType:
                                                                AnimType.scale,
                                                            title: 'Success',
                                                            desc:
                                                                'Display name changed successfully',
                                                            btnOkOnPress: () {},
                                                          ).show();
                                                        }, onError: (error) {
                                                          AwesomeDialog(
                                                            context:
                                                                Get.context!,
                                                            dialogType:
                                                                DialogType
                                                                    .error,
                                                            animType:
                                                                AnimType.scale,
                                                            title: 'Error',
                                                            desc: error
                                                                .toString(),
                                                            btnOkOnPress: () {},
                                                          ).show();
                                                        });
                                                      } catch (e) {
                                                        FirebaseAuthException
                                                            exception =
                                                            e as FirebaseAuthException;

                                                        AwesomeDialog(
                                                          context: Get.context!,
                                                          dialogType:
                                                              DialogType.error,
                                                          animType:
                                                              AnimType.scale,
                                                          title: e.toString(),
                                                          desc: exception
                                                              .message
                                                              .toString(),
                                                          btnOkOnPress: () {},
                                                        ).show();
                                                      }
                                                      controller
                                                          .isDisplayNameReadOnly
                                                          .toggle();
                                                    },
                                                    icon: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                            IconButton(
                                              onPressed: () async {
                                                controller.isDisplayNameReadOnly
                                                    .toggle();
                                              },
                                              icon: controller
                                                      .isDisplayNameReadOnly
                                                      .value
                                                  ? const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.person_outline,
                                          color: Colors.white,
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        border: const OutlineInputBorder(),
                                      ),
                                      name: 'displayNameProfile',
                                    ),
                                    const SizedBox(height: 10),
                                    FormBuilderTextField(
                                      controller: controller.email =
                                          TextEditingController(
                                              text: auth.currentUser?.email ??
                                                  'Unregistered'),
                                      readOnly:
                                          controller.isEmailReadOnly.value,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            controller.isEmailReadOnly.value ==
                                                    true
                                                ? const SizedBox()
                                                : IconButton(
                                                    onPressed: () async {
                                                      await auth.currentUser!
                                                          .updateEmail(
                                                              controller
                                                                  .email.text);
                                                      controller.isEmailReadOnly
                                                          .toggle();
                                                    },
                                                    icon: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                            IconButton(
                                              onPressed: () async {
                                                controller.isEmailReadOnly
                                                    .toggle();
                                              },
                                              icon: controller
                                                      .isEmailReadOnly.value
                                                  ? const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.email_outlined,
                                          color: Colors.white,
                                        ),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        border: const OutlineInputBorder(),
                                      ),
                                      name: 'emailProfile',
                                    ),
                                  ],
                                ),
                                // Link a google account
                                const SizedBox(height: 10),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Obx(() => Column(
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
                                        auth.currentUser!.providerData[0]
                                            .email!,
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
                                        onPressed: () async {
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
                      )),
                ],
              ),
            ),
          ),
          GFButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();

              await prefs.clear();
              controller.logout();
            },
            text: 'Logout',
          ),
        ],
      ),
    );
  }
}
