// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/common/waves.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/home_reviewer_controller.dart';

class ReviewerMainMenu extends StatelessWidget {
  const ReviewerMainMenu({
    super.key,
    required this.homeCtrl,
    required this.account,
    required this.controller,
  });

  final HomeController homeCtrl;
  final String account;
  final HomeReviewerController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const GFTypography(
                text: 'Reviewer Dashboard',
                fontWeight: FontWeight.bold,
                type: GFTypographyType.typo1,
                textColor: primaryColor,
                dividerColor: primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: WaveWidget(
                      config: CustomConfig(
                        colors: WavesSettings.waveColors,
                        heightPercentages: WavesSettings.waveHeightPercentages,
                        durations: WavesSettings.waveDurations,
                      ),
                      waveAmplitude: 10,
                      size: const Size(double.infinity, double.infinity),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Obx(() => CircleAvatar(
                              radius: 30,
                              child: CachedNetworkImage(
                                imageUrl: homeCtrl.profileImage.value == ''
                                    ? 'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
                                    : '${homeCtrl.profileImage}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat ${homeCtrl.greeting()}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              account,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: secondaryColor,
                              ),
                            ),
                            // Date text now
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 65,
                    right: 10,
                    child: Text(
                      homeCtrl.dateNow(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.check,
                          color: GFColors.SUCCESS,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(() => SizedBox(
                              width: 400,
                              child: Text(
                                'Running on ${homeCtrl.brandName} ${homeCtrl.productName} ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Obx(() => homeCtrl.address.value == 'Getting address'
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : const Icon(
                                FontAwesomeIcons.locationDot,
                                color: GFColors.DANGER,
                              )),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(() => homeCtrl.address.value == 'Getting address'
                            ? SizedBox(
                                child: Row(
                                  children: const [
                                    Text(
                                      'Getting address',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 400,
                                child: Text(
                                  'You are at ${homeCtrl.address}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Obx(() => homeCtrl.mainBranch.value == '...' &&
                                homeCtrl.helperBranch.value == '...'
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                FontAwesomeIcons.building,
                                color: GFColors.INFO,
                              )),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(() => homeCtrl.mainBranch.value == '...' &&
                                homeCtrl.helperBranch.value == '...'
                            ? SizedBox(
                                child: Row(
                                  children: const [
                                    Text(
                                      '...',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 400,
                                child: Text(
                                  '${homeCtrl.mainBranch} / ${homeCtrl.helperBranch}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REVIEWER_PENDING_LIST,
                          arguments: controller.uid);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://user-images.githubusercontent.com/45744788/216493054-ff62cc81-a6f5-4360-a468-f70f6b81272d.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.blue[400],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Pengajuan Pending",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Difficulty",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 4.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[400],
                                        size: 16.0,
                                      ),
                                      const Text(
                                        "Easy",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Text(
                                    "Nilai pengajuan yang dikirimkan oleh Analis",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REVIEWER_COMPLETED_LIST,
                          arguments: controller.uid);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://user-images.githubusercontent.com/45744788/216493335-b2e6e08d-fd1e-4426-88e3-775d642bcef4.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.blue[400],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sudah Direview",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Difficulty",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 4.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[400],
                                        size: 16.0,
                                      ),
                                      const Text(
                                        "Easy",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Text(
                                    "Pengajuan yang sudah di review",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REVIEWER_STATS,
                          arguments: controller.uid);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://user-images.githubusercontent.com/45744788/216333023-cf90e721-d1f7-42dd-b084-cfb2b3e96fdf.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.blue[400],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Statistik & Data",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Difficulty",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 4.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[400],
                                        size: 16.0,
                                      ),
                                      const Text(
                                        "Easy",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Text(
                                    "Statistik dan data mengenai akunmu",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.infoReverse,
                      animType: AnimType.bottomSlide,
                      title: 'Keluar ?',
                      desc: 'Apakah anda yakin ingin keluar ?',
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      btnOkOnPress: () {
                        SystemNavigator.pop();
                      },
                      btnCancelText: 'Tidak',
                      btnOkText: 'Ya',
                      btnCancelOnPress: () => Get.back(),
                    ).show(),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://user-images.githubusercontent.com/45744788/216748185-fc00e958-0840-46c0-aad6-da330e202f17.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.blue[400],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Keluar",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Difficulty",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.circle,
                                        size: 4.0,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange[400],
                                        size: 16.0,
                                      ),
                                      const Text(
                                        "Easy",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Text(
                                    "Keluar dari aplikasi",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
