import 'package:akm/app/modules/home_reviewer/controllers/home_reviewer_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReviewerListMenu {
  final String menuName;
  final String menuDescription;
  final String imagePath;
  final Function onTap;

  ReviewerListMenu({
    required this.menuName,
    required this.menuDescription,
    required this.imagePath,
    required this.onTap,
  });
}

final List<ReviewerListMenu> reviewerMenuList = [
  ReviewerListMenu(
    menuName: 'Pengajuan Pending',
    menuDescription: 'Nilai Pengajuan dari Analis yang belum di review',
    imagePath: 'assets/images/home/reviewer_pengajuan_pending.jpg',
    onTap: () {
      final controller = Get.find<HomeReviewerController>();

      Get.toNamed(
        Routes.REVIEWER_PENDING_LIST,
        arguments: controller.uid,
      );
    },
  ),
  ReviewerListMenu(
    menuName: 'Pengajuan Reviewed',
    menuDescription: 'Kumpulan Pengajuan yang sudah di review',
    imagePath: 'assets/images/home/reviewer_pengajuan_reviewed.jpg',
    onTap: () {
      final controller = Get.find<HomeReviewerController>();

      Get.toNamed(
        Routes.REVIEWER_COMPLETED_LIST,
        arguments: controller.uid,
      );
    },
  ),
  ReviewerListMenu(
    menuName: 'Statistik & Data',
    menuDescription: 'Statistik dan Data mengenai pengajuan',
    imagePath: 'assets/images/home/reviewer_stats.jpg',
    onTap: () {
      final controller = Get.find<HomeReviewerController>();

      Get.toNamed(
        Routes.REVIEWER_STATS,
        arguments: controller.uid,
      );
    },
  ),
  ReviewerListMenu(
    menuName: 'Keluar',
    menuDescription: 'Keluar dari Aplikasi',
    imagePath: 'assets/images/home/reviewer_keluar.jpg',
    onTap: () {
      PrompDialog(
        title: 'Keluar',
        context: Get.context!,
        desc: 'Apakah anda yakin ingin keluar dari aplikasi?',
        btnOkText: 'YA',
        btnCancelText: 'TIDAK',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          SystemNavigator.pop();
        },
      ).show();
    },
  ),
];
