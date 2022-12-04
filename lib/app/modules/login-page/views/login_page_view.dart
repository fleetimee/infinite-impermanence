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
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const [
        //     // GFButton(
        //     //   // onPressed: () async {
        //     //   //   try {
        //     //   //     final userCredential = await FirebaseAuth.instance
        //     //   //         .signInWithCustomToken(
        //     //   //             'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTY3MDA2NzY3NSwiZXhwIjoxNjcwMDcxMjc1LCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay1wMmN1MEBhbmFsaXNpcy1rcmVkaXQtbWlrcm8uaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay1wMmN1MEBhbmFsaXNpcy1rcmVkaXQtbWlrcm8uaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiJiNmE0MDdjYi00YTJiLTQ5NDEtODRmMi00NTZjMjllMjhjOTAifQ.JGUTXzy1TfqV6WQAgK9xY8CIk9EEi6H252JsQzAMd_jssjIBQ7SbFg4FkfOESwr0RbV-HCtktFyFs1cqpkey4EhSZDrkiq91sCf330UxPIek9OUu-Xu1zTmykdiSNt-uOzlitUd3lubrKGF1pF0SugZGoM964nVSXGxAr5uFdUxHzqm-Qw8Ix64bvmXFWhZcbdoU0Yia6Gbqk4VgpolfUQs_TMSs8CtXj3lMuA-dg4bkSqWOSN4piL7g3sTwlnAuJlcBj_P5-sLJsqUmbTp4-aENda8vicNAuBz6j5DHIOcXoR1QENvRjDEZuxwzGpFJbFrEejXwq8bXuM_1wrt9ZA');
        //     //   //     print("Sign-in successful.");

        //     //   //     print(userCredential.user!.uid);
        //     //   //   } on FirebaseAuthException catch (e) {
        //     //   //     switch (e.code) {
        //     //   //       case "invalid-custom-token":
        //     //   //         print(
        //     //   //             "The supplied token is not a Firebase custom auth token.");
        //     //   //         break;
        //     //   //       case "custom-token-mismatch":
        //     //   //         print(
        //     //   //             "The supplied token is for a different Firebase project.");
        //     //   //         break;
        //     //   //       default:
        //     //   //         print("Unkown error.");
        //     //   //     }
        //     //   //   }
        //     //   // },
        //     //   text: 'Login',
        //     // ),
        //     // const SizedBox(
        //     //   height: 20,
        //     // ),
        //     // GFButton(
        //     //   onPressed: () {
        //     //     FirebaseAuth.instance.signOut();
        //     //     debugPrint('Signed out');
        //     //   },
        //     //   text: 'Logout',
        //     // ),
        //     // const SizedBox(
        //     //   height: 20,
        //     // ),
        //     // GFButton(
        //     //     onPressed: () {
        //     //       FirebaseAuth.instance.currentUser!.getIdToken().then((value) {
        //     //         debugPrint(value);
        //     //       });
        //     //     },
        //     //     text: 'Get IdToken'),
        //   ],
        // ),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // add red line debug border
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.red),
                // ),
                child: Stack(
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
          Container(
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
                      text: controller.isLoginProcessing.value
                          ? 'LOADING..'
                          : 'LOGIN',
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
                  onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
