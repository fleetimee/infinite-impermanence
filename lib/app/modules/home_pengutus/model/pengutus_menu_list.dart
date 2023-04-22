import 'package:akm/app/modules/home_pengutus/controllers/home_pengutus_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PengutusListMenu {
  final String menuName;
  final String menuDescription;
  final String imagePath;
  final Function onTap;

  PengutusListMenu({
    required this.menuName,
    required this.menuDescription,
    required this.imagePath,
    required this.onTap,
  });
}

final List<PengutusListMenu> pengutusMenuList = [
  PengutusListMenu(
    menuName: 'Pemutusan Pending',
    menuDescription: 'Putus pengajuan yang dikirimkan oleh reviewer',
    imagePath: 'assets/images/home/pemutusan_pending.jpg',
    onTap: () {
      final controller = Get.find<HomePengutusController>();

      Get.toNamed(
        Routes.PENGUTUS_PENDING_LIST,
        arguments: controller.uid,
      );
    },
  ),
  PengutusListMenu(
    menuName: 'Pemutusan Done',
    menuDescription: 'Pengajuan yang sudah di acc / tolak',
    imagePath: 'assets/images/home/pemutusan_reviewed.jpg',
    onTap: () {
      final controller = Get.find<HomePengutusController>();

      Get.toNamed(
        Routes.PENGUTUS_COMPLETED_LIST,
        arguments: controller.uid,
      );
    },
  ),
  PengutusListMenu(
    menuName: 'Statistik & Data',
    menuDescription: 'Statistik dan Data mengenai akunmu',
    imagePath: 'assets/images/home/pemutus_statistik.jpg',
    onTap: () {
      final controller = Get.find<HomePengutusController>();

      Get.toNamed(
        Routes.PENGUTUS_PENDING_STATS,
        arguments: controller.uid,
      );
    },
  ),
  PengutusListMenu(
    menuName: 'Keluar',
    menuDescription: 'Keluar dari aplikasi',
    imagePath: 'assets/images/home/pemutus_keluar.jpg',
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
  )
];
