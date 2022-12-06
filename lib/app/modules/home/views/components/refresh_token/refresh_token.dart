import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class RefreshToken extends StatelessWidget {
  RefreshToken({super.key});

  final controller = Get.put(HomeController());
  final loginPageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Refresh Token',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'refresh-email',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      controller: controller.refreshEmail =
                          TextEditingController(
                        text: FirebaseAuth.instance.currentUser?.email,
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        focusColor: Colors.red,
                        fillColor: Colors.grey.shade300,
                        hoverColor: Colors.red,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // add custom google font
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FormBuilderTextField(
                      name: 'refresh-password',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      controller: controller.refreshPassword,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // add custom google font
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                          size: 25,
                        ),
                        hintText: 'Password',
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 25),
                        focusColor: Colors.red,
                        fillColor: Colors.grey.shade300,
                        hoverColor: Colors.red,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Use your google credential not from given by an admin',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          // add custom google font
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                    )
                  ],
                ),
                Obx(() => GFButton(
                      onPressed: () {
                        if (controller.formKey.currentState
                                ?.saveAndValidate() ??
                            false) {
                          controller.reauthenticate();
                          // clear form
                          controller.formKey.currentState?.reset();
                        } else {
                          debugPrint('validation failed');
                        }
                      },
                      // text: controller.isLoginProcessing.value ? '' : 'LOGIN',
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      text:
                          controller.isReauthProcessing.value ? '' : 'Refresh',
                      fullWidthButton: true,
                      color: primaryColor,
                      size: 45,
                      shape: GFButtonShape.pills,
                      icon: controller.isReauthProcessing.value
                          ? const GFLoader(
                              type: GFLoaderType.circle,
                              loaderColorOne: Colors.white,
                              loaderColorTwo: Colors.white,
                              loaderColorThree: Colors.white,
                            )
                          : const Icon(
                              FontAwesomeIcons.arrowsRotate,
                              color: Colors.white,
                              size: 20,
                            ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
