// ignore_for_file: must_be_immutable

import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/pengajuan_printing_controller.dart';

class PengajuanPrintingView extends GetView<PengajuanPrintingController> {
  PengajuanPrintingView({Key? key}) : super(key: key);

  String photoUrl =
      'https://images.unsplash.com/photo-1494587351196-bbf5f29cff42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: const Text('Pengajuan Printing'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isProcessing.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Inputan Print',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.INPUT_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Hasil Inputan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.USULAN_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Usulan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.USULAN_BARU_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Usulan Baru',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.PUTUSAN_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Draft Putusan',
                              icon: const Icon(
                                Icons.summarize_outlined,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Keuangan Print',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.RUGILABA_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Laporan Keuangan',
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.NERACA_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Keterangan Neraca',
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.KEUANGAN_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Analisa Keuangan',
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Karakter Print',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.KARAKTER_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              text: 'Lihat Summary Karakter',
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Bisnis Print',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.BISNIS_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Summary Bisnis',
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Jenis Usaha Print',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.USAHA_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              text: 'Lihat Summary Jenis Usaha',
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              icon: const Icon(
                                Icons.summarize,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GFTypography(
                                text: 'Gallery',
                                type: GFTypographyType.typo1,
                                backgroundImage: NetworkImage(
                                  photoUrl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.GALLERY_IMAGE,
                                    arguments: controller.insightDebitur.value);
                              },
                              text: 'Lihat Gallery',
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              icon: const Icon(
                                Icons.image,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                    ),
                                    Text(
                                      "     ATAU     ",
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
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.GALLERY_FILE,
                                    arguments: controller.insightDebitur.value);
                              },
                              color: primaryColor,
                              shape: GFButtonShape.pills,
                              text: 'Lihat Dokumen',
                              icon: const Icon(
                                Icons.picture_as_pdf,
                                size: 18,
                                color: secondaryColor,
                              ),
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
