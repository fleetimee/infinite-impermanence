import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GFButton(
              onPressed: () async {
                try {
                  final userCredential = await FirebaseAuth.instance
                      .signInWithCustomToken(
                          'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImlhdCI6MTY3MDAxNjk2NywiZXhwIjoxNjcwMDIwNTY3LCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay1wMmN1MEBhbmFsaXNpcy1rcmVkaXQtbWlrcm8uaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay1wMmN1MEBhbmFsaXNpcy1rcmVkaXQtbWlrcm8uaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJ1aWQiOiI2Nzg1ZGVhZC05NTc1LTQ2N2UtYWJhNi05NzNiOWU1NGJkY2MifQ.jIy9Ac6IstRB5gVaLFIu2zPyxds92RXnT0JlaJNN4RLVp8VIbZrZML63UV52lV3KuzOtEoxLUbIIvSbfP1vzrRDminDwCFrjPqQ2cmywBI8e0OiK010LQKTQU4JyzDR_JFxKoEqItX5JSuvA15InGSwGpnATkptLygI3GlMdHRNzrSwFxZ9APrJaB1iPtsVpBIpnOSML9_MwrL442iHSBwvlQniyPqy_Qui6v1qYlfzUgZyCrhV3O0z9aD-iSrtDEaUOerjy49RW_1fOP3syI4IwQ6TFFSDlnD5D1ECGTNIVoTd-Bc7C__7k7L6fXyBRd8-ErevjFLGy0HwKZnkJwA');
                  print("Sign-in successful.");

                  print(userCredential.user!.uid);
                } on FirebaseAuthException catch (e) {
                  switch (e.code) {
                    case "invalid-custom-token":
                      print(
                          "The supplied token is not a Firebase custom auth token.");
                      break;
                    case "custom-token-mismatch":
                      print(
                          "The supplied token is for a different Firebase project.");
                      break;
                    default:
                      print("Unkown error.");
                  }
                }
              },
              text: 'Login',
            ),
            const SizedBox(
              height: 20,
            ),
            GFButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                debugPrint('Signed out');
              },
              text: 'Logout',
            ),
            const SizedBox(
              height: 20,
            ),
            GFButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser!.getIdToken().then((value) {
                    debugPrint(value);
                  });
                },
                text: 'Get IdToken'),
          ],
        ),
      ),
    );
  }
}
