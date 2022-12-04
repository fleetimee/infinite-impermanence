import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
                      controller: controller.email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          // add custom google font
                          // fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      controller: controller.password,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          // add custom google font
                          // fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                              ? 'Loading..'
                              : 'Login',
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
