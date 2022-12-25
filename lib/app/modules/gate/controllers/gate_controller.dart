import 'package:akm/app/common/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GateController extends GetxController {
  @override
  void onInit() {
    getCustomClaims();

    super.onInit();
  }

  var customClaims = [].obs;

  void logout() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'Logout',
      desc: 'Are you sure want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setBool('pernahLogin', true);

        // clear shared preferences id
        await prefs.remove('id');
        await prefs.remove('photo');
        await prefs.remove('role');

        await FirebaseAuth.instance.signOut();

        // check if user is currently signed in with google
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().disconnect();
        }
      },
    ).show();
  }

  void getCustomClaims() async {
    final claims = await auth.currentUser!.getIdTokenResult();

    if (claims.claims!['analis'] == true) {
      customClaims.add('analis');
    }

    if (claims.claims!['admin'] == true) {
      customClaims.add('admin');
    }

    if (claims.claims!['reviewer'] == true) {
      customClaims.add('reviewer');
    }

    if (claims.claims!['pengutus'] == true) {
      customClaims.add('pengutus');
    }

    debugPrint(customClaims.toString());
  }
}
