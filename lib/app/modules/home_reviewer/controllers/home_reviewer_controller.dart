import 'package:akm/app/data/provider/user/pengajuan_debitur.provider.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeReviewerController extends GetxController {
  // Controller for pageview
  final PageController controller = PageController();

  @override
  void onInit() {
    getUid();
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration.zero, () {
      getMyPendingReview();
      getMyCompletedReview();
    });
    super.onReady();
  }

  // var
  late var uid = ''.obs;

  // Get uid from sharedPreferences
  Future<void> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    uid.value = prefs.getString('id') ?? '';
  }

  // Pending review
  var isMyPendingReviewProcessing = false.obs;
  var isMyCompletedReviewProcessing = false.obs;
  List listMyPendingReview = <PengajuanDetail>[].obs;
  List listMyCompletedReview = <Pengajuan>[].obs;

  void getMyPendingReview() async {
    try {
      isMyPendingReviewProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyPendingReviewProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) => element.status == 'PENDING')
            .toList();

        listMyPendingReview.clear();
        listMyPendingReview = finalList ?? [];
      }, onError: (err) {
        isMyPendingReviewProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyPendingReviewProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> refreshReview() async {
    getMyPendingReview();
  }

  void getMyCompletedReview() async {
    try {
      isMyCompletedReviewProcessing(true);
      MySubmissionProvider().fetchMyReview(uid.value).then((resp) {
        isMyCompletedReviewProcessing(false);
        final finalList = resp.pengajuan
            ?.where((element) =>
                element.status == 'REVIEWED' ||
                element.status == 'REJECTED' ||
                element.status == 'DONE')
            .toList();

        listMyCompletedReview.clear();
        listMyCompletedReview = finalList ?? [];
      }, onError: (err) {
        isMyCompletedReviewProcessing(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isMyCompletedReviewProcessing(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void logout() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.question,
      animType: AnimType.scale,
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
