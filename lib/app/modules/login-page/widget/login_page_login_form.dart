// 🐦 Flutter imports:

import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/login_page_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/splash_screen/splash_icon.png',
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            FormBuilder(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      enableSuggestions: true,
                      autocorrect: true,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      controller: controller.email,
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      textInputAction: TextInputAction.next,
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
                      height: 40,
                    ),
                    Obx(() => FormBuilderTextField(
                          name: 'password',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            // add custom google font
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                          cursorColor: Colors.black,
                          cursorHeight: 20,
                          controller: controller.password,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              // add custom google font
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                size: 25,
                                controller.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.isPasswordVisible.value
                                  ? controller.isPasswordVisible.toggle
                                  : controller.isPasswordVisible.toggle,
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
                              borderSide:
                                  const BorderSide(color: Colors.black45),
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
                          obscureText:
                              controller.isPasswordVisible.value == true
                                  ? false
                                  : true,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(
                  () => GFButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
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
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
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
                ),
                // Text(
                //   'Crafted with ❤️ in Yogyakarta',
                //   style: TextStyle(
                //     color: GFColors.LIGHT,
                //     fontSize: 14,
                //     fontWeight: FontWeight.w800,
                //     // add custom google font
                //     fontFamily:
                //         GoogleFonts.montserrat().fontFamily,
                //   ),
                // ),
                Visibility(
                  visible: false,
                  child: Obx(
                    () => controller.pernahLogin.value == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
                                        fontFamily:
                                            GoogleFonts.montserrat().fontFamily,
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
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
