// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class UserInput extends StatelessWidget {
  final HomeController controller;
  final FirebaseAuth auth;

  const UserInput({super.key, required this.controller, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  controller: controller.email = TextEditingController(
                      text: auth.currentUser?.uid ?? 'Unregistered'),
                  cursorColor: Colors.white,
                  name: 'uid',
                  readOnly: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.numbers_outlined,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  controller: controller.displayName = TextEditingController(
                      text: auth.currentUser?.displayName ?? 'Unregistered'),
                  readOnly: controller.isDisplayNameReadOnly.value,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.isDisplayNameReadOnly.value == true
                            ? const SizedBox()
                            : IconButton(
                                onPressed: () async {
                                  try {
                                    await auth.currentUser!
                                        .updateDisplayName(
                                            controller.displayName.text)
                                        .then((value) {
                                      AwesomeDialog(
                                        context: Get.context!,
                                        dialogType: DialogType.success,
                                        animType: AnimType.scale,
                                        title: 'Success',
                                        desc:
                                            'Display name changed successfully',
                                        btnOkOnPress: () {},
                                      ).show();
                                    }, onError: (error) {
                                      AwesomeDialog(
                                        context: Get.context!,
                                        dialogType: DialogType.error,
                                        animType: AnimType.scale,
                                        title: 'Error',
                                        desc: error.toString(),
                                        btnOkOnPress: () {},
                                      ).show();
                                    });
                                  } catch (e) {
                                    FirebaseAuthException exception =
                                        e as FirebaseAuthException;

                                    AwesomeDialog(
                                      context: Get.context!,
                                      dialogType: DialogType.error,
                                      animType: AnimType.scale,
                                      title: e.toString(),
                                      desc: exception.message.toString(),
                                      btnOkOnPress: () {},
                                    ).show();
                                  }
                                  controller.isDisplayNameReadOnly.toggle();
                                },
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                        IconButton(
                          onPressed: () async {
                            controller.isDisplayNameReadOnly.toggle();
                          },
                          icon: controller.isDisplayNameReadOnly.value
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
                  controller: controller.email = TextEditingController(
                      text: auth.currentUser?.email ?? 'Unregistered'),
                  readOnly: controller.isEmailReadOnly.value,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.isEmailReadOnly.value == true
                            ? const SizedBox()
                            : IconButton(
                                onPressed: () async {
                                  try {
                                    await auth.currentUser!
                                        .updateEmail(controller.email.text)
                                        .then((value) {
                                      AwesomeDialog(
                                        context: Get.context!,
                                        dialogType: DialogType.success,
                                        animType: AnimType.scale,
                                        title: 'Success',
                                        desc: 'Email changed successfully',
                                        btnOkOnPress: () {},
                                      ).show();
                                    }, onError: (error) {
                                      FirebaseAuthException exception =
                                          error as FirebaseAuthException;

                                      AwesomeDialog(
                                        context: Get.context!,
                                        dialogType: DialogType.error,
                                        animType: AnimType.scale,
                                        title: 'Error',
                                        desc: exception.message.toString(),
                                        btnOkOnPress: () async {
                                          // Logout
                                          await auth.signOut();
                                          await GoogleSignIn().disconnect();
                                        },
                                        btnOkText: 'Logout',
                                      ).show();
                                    });
                                  } catch (e) {
                                    return Future.error(e);
                                  }
                                  controller.isEmailReadOnly.toggle();
                                },
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                        IconButton(
                          onPressed: () async {
                            controller.isEmailReadOnly.toggle();
                          },
                          icon: controller.isEmailReadOnly.value
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
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  name: 'emailProfile',
                ),
                const SizedBox(height: 10),
                // Check is email verified
                Align(
                  alignment: Alignment.centerRight,
                  child: auth.currentUser!.emailVerified
                      ? const Text(
                          'Email verified',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Email not verified',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () async {
                                await auth.currentUser!.sendEmailVerification();
                                AwesomeDialog(
                                  context: Get.context!,
                                  dialogType: DialogType.success,
                                  animType: AnimType.scale,
                                  title: 'Email sent',
                                  desc:
                                      'Please check your email to verify your account',
                                  btnOkOnPress: () {},
                                ).show();
                              },
                              child: const Text(
                                'Resend',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                )
              ],
            ),
            // Link a google account
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
