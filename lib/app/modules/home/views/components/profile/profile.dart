// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    return SafeArea(
      child: FormBuilder(
        child: SingleChildScrollView(
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
                              child: CircleAvatar(
                                radius: 85,
                                child: CachedNetworkImage(
                                  imageUrl: controller.profileImage.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Obx(() => Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FormBuilderTextField(
                                          controller: controller.email =
                                              TextEditingController(
                                                  text: auth.currentUser?.uid ??
                                                      'Unregistered'),
                                          cursorColor: Colors.white,
                                          name: 'uid',
                                          readOnly: true,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.numbers_outlined,
                                              color: Colors.white,
                                            ),
                                            filled: true,
                                            fillColor:
                                                Colors.grey.withOpacity(0.2),
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
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
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            suffixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                controller.isDisplayNameReadOnly
                                                            .value ==
                                                        true
                                                    ? const SizedBox()
                                                    : IconButton(
                                                        onPressed: () async {
                                                          try {
                                                            await auth
                                                                .currentUser!
                                                                .updateDisplayName(
                                                                    controller
                                                                        .displayName
                                                                        .text)
                                                                .then((value) {
                                                              AwesomeDialog(
                                                                context: Get
                                                                    .context!,
                                                                dialogType:
                                                                    DialogType
                                                                        .success,
                                                                animType:
                                                                    AnimType
                                                                        .scale,
                                                                title:
                                                                    'Success',
                                                                desc:
                                                                    'Display name changed successfully',
                                                                btnOkOnPress:
                                                                    () {},
                                                              ).show();
                                                            }, onError:
                                                                    (error) {
                                                              AwesomeDialog(
                                                                context: Get
                                                                    .context!,
                                                                dialogType:
                                                                    DialogType
                                                                        .error,
                                                                animType:
                                                                    AnimType
                                                                        .scale,
                                                                title: 'Error',
                                                                desc: error
                                                                    .toString(),
                                                                btnOkOnPress:
                                                                    () {},
                                                              ).show();
                                                            });
                                                          } catch (e) {
                                                            FirebaseAuthException
                                                                exception =
                                                                e as FirebaseAuthException;

                                                            AwesomeDialog(
                                                              context:
                                                                  Get.context!,
                                                              dialogType:
                                                                  DialogType
                                                                      .error,
                                                              animType: AnimType
                                                                  .scale,
                                                              title:
                                                                  e.toString(),
                                                              desc: exception
                                                                  .message
                                                                  .toString(),
                                                              btnOkOnPress:
                                                                  () {},
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
                                                    controller
                                                        .isDisplayNameReadOnly
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
                                            fillColor:
                                                Colors.grey.withOpacity(0.2),
                                            border: const OutlineInputBorder(),
                                          ),
                                          name: 'displayNameProfile',
                                        ),
                                        const SizedBox(height: 10),
                                        FormBuilderTextField(
                                          controller: controller.email =
                                              TextEditingController(
                                                  text:
                                                      auth.currentUser?.email ??
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                controller.isEmailReadOnly
                                                            .value ==
                                                        true
                                                    ? const SizedBox()
                                                    : IconButton(
                                                        onPressed: () async {
                                                          try {
                                                            await auth
                                                                .currentUser!
                                                                .updateEmail(
                                                                    controller
                                                                        .email
                                                                        .text)
                                                                .then((value) {
                                                              AwesomeDialog(
                                                                context: Get
                                                                    .context!,
                                                                dialogType:
                                                                    DialogType
                                                                        .success,
                                                                animType:
                                                                    AnimType
                                                                        .scale,
                                                                title:
                                                                    'Success',
                                                                desc:
                                                                    'Email changed successfully',
                                                                btnOkOnPress:
                                                                    () {},
                                                              ).show();
                                                            }, onError:
                                                                    (error) {
                                                              FirebaseAuthException
                                                                  exception =
                                                                  error
                                                                      as FirebaseAuthException;

                                                              AwesomeDialog(
                                                                context: Get
                                                                    .context!,
                                                                dialogType:
                                                                    DialogType
                                                                        .error,
                                                                animType:
                                                                    AnimType
                                                                        .scale,
                                                                title: 'Error',
                                                                desc: exception
                                                                    .message
                                                                    .toString(),
                                                                btnOkOnPress:
                                                                    () async {
                                                                  // Logout
                                                                  await auth
                                                                      .signOut();
                                                                  await GoogleSignIn()
                                                                      .disconnect();
                                                                },
                                                                btnOkText:
                                                                    'Logout',
                                                              ).show();
                                                            });
                                                          } catch (e) {
                                                            return Future.error(
                                                                e);
                                                          }
                                                          controller
                                                              .isEmailReadOnly
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
                                            fillColor:
                                                Colors.grey.withOpacity(0.2),
                                            focusedBorder:
                                                const OutlineInputBorder(
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      'Email not verified',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    TextButton(
                                                      onPressed: () async {
                                                        await auth.currentUser!
                                                            .sendEmailVerification();
                                                        AwesomeDialog(
                                                          context: Get.context!,
                                                          dialogType: DialogType
                                                              .success,
                                                          animType:
                                                              AnimType.scale,
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
                                                          fontWeight:
                                                              FontWeight.w600,
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
                          )),
                    ],
                  ),
                ),
              ),
              // GFButton(
              //   onPressed: () async {
              //     final prefs = await SharedPreferences.getInstance();

              //     await prefs.clear();
              //     controller.logout();
              //   },
              //   text: 'Logout',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
