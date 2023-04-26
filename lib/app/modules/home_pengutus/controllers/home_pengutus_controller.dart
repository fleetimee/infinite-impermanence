// 🐦 Flutter imports:
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:

class HomePengutusController extends GetxController {
  @override
  void onInit() {
    getUid();
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration.zero, () {
      // getMyPendingPemutusan();
      // getMyCompletedPutusan();
    });
    super.onReady();
  }

  final PageController controller = PageController();

  late var uid = ''.obs;

  Future<void> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    uid.value = prefs.getString('id') ?? '';
  }

  // var isMyCompletedPemutusanProcessing = false.obs;
  // List listMyCompletedPemutusan = <Pengajuan>[].obs;

  // void getMyCompletedPutusan() async {
  //   try {
  //     isMyCompletedPemutusanProcessing(true);
  //     MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
  //       isMyCompletedPemutusanProcessing(false);
  //       final finalList = resp.pengajuan
  //           ?.where((element) =>
  //               element.status == 'DONE' || element.status == 'REJECTED')
  //           .toList();

  //       listMyCompletedPemutusan.clear();
  //       listMyCompletedPemutusan = finalList ?? [];
  //     }, onError: (err) {
  //       isMyCompletedPemutusanProcessing(false);
  //       Get.snackbar('Error', err.toString());
  //     });
  //   } catch (e) {
  //     isMyCompletedPemutusanProcessing(false);
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  void verifyEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
          (value) {
        SuccessDialogPink(
                context: Get.context!,
                title: 'Success',
                desc: 'Verifikasi email sudah dikirim',
                btnOkOnPress: () {})
            .show();
      }, onError: (error) {
        FirebaseAuthException exception = error as FirebaseAuthException;

        ErrorDialogPink(
          context: Get.context!,
          title: 'Error',
          desc: exception.message.toString(),
          btnOkOnPress: () {},
        ).show();
      });
    } catch (e) {
      FirebaseAuthException exception = e as FirebaseAuthException;
      ErrorDialogPink(
        context: Get.context!,
        title: 'Error',
        desc: exception.message.toString(),
        btnOkOnPress: () {},
      ).show();
    }
  }

  void logout() {
    PrompDialogPink(
      context: Get.context!,
      title: 'Logout',
      desc: 'Are you sure want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await FirebaseAuth.instance.signOut();
        final prefs = await SharedPreferences.getInstance();

        await prefs.setBool('pernahLogin', true);

        // clear shared preferences id
        await prefs.remove('id');
        await prefs.remove('photo');
        await prefs.remove('role');

        // check if user is currently signed in with google
        if (await GoogleSignIn().isSignedIn()) {
          await GoogleSignIn().disconnect();
        }
      },
    ).show();
  }
}
