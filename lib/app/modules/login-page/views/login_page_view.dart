import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      child: Image.asset(
                        'assets/images/home/stackable.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 35,
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sign in to your account',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // add custom google font
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: FormBuilder(
                  key: controller.formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
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
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
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
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
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
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: GFColors.FOCUS,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
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
              ),
            ],
          ),
          Obx(() => Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Obx(() => GFButton(
                          onPressed: () {
                            if (controller.formKey.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              controller.login();
                            } else {
                              debugPrint('validation failed');
                            }
                          },
                          text:
                              controller.isLoginProcessing.value ? '' : 'LOGIN',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            // add custom google font
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                          ),
                          fullWidthButton: true,
                          color: primaryColor,
                          size: 45,
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
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    // divider with text in between
                    // Get shared preferences instance

                    controller.pernahLogin.value == false
                        ? Container()
                        : Container(
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
                    controller.pernahLogin.value == false
                        ? Container()
                        : const SizedBox(
                            height: 10,
                          ),

                    controller.pernahLogin.value == false
                        ? Container()
                        : GFButton(
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
                ),
              )),
        ],
      ),
    );
  }
}
