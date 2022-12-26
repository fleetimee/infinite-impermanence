import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitView extends GetView<ReviewerSubmitController> {
  const ReviewerSubmitView({Key? key}) : super(key: key);

  String formatDatetime(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: FormBuilder(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GFTypography(
                    text: 'Review Pengajuan',
                    type: GFTypographyType.typo1,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Text(
                      controller.isProcessing.value
                          ? 'Loading...'
                          : 'Pengajuan ini berisikan calon debitur dengan nama ${controller.insightDebitur.value.peminjam1}, dengan no pengajuan ${controller.pengajuan.id} yang diajukan pada tanggal ${formatDatetime(controller.pengajuan.tglSubmit!)} oleh analis Novian',
                      style: Theme.of(context).textTheme.caption?.merge(
                            const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Berikut adalah detail pengajuan yang diajukan :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.grey[200],
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const GFTypography(
                              text: 'Hasil Inputan Debitur',
                              type: GFTypographyType.typo3,
                              showDivider: false,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Ini merupakan hasil inputan debitur yang telah diinputkan oleh analis, dan akan di review oleh anda sebagai reviewer.',
                              style: Theme.of(context).textTheme.caption?.merge(
                                    const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 20),
                            GFButton(
                              onPressed: () {
                                Get.toNamed(Routes.INPUT_PRINT,
                                    arguments: controller.insightDebitur.value);
                              },
                              text: 'Lihat Hasil Inputan',
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  KeuanganCard(controller: controller),
                  const SizedBox(height: 20),
                  KarakterCard(controller: controller),
                  const SizedBox(height: 20),
                  BisnisCard(controller: controller),
                  const SizedBox(height: 20),
                  UsahaCard(controller: controller),
                  const SizedBox(height: 20),
                  AgunanCard(controller: controller),
                  const SizedBox(height: 20),
                  Text(
                    'Untuk beberapa parameter dibawah ini hanya untuk tambahan saja dan tidak masuk kedalam penilaian :',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  GalleryCard(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AgunanCard extends StatelessWidget {
  const AgunanCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Agunan Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isAgunanPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isAgunanPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan agunan debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.AGUNAN_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Summary Agunan',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderRadioGroup(
                name: 'agunan',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isAgunanPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah bisnis debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UsahaCard extends StatelessWidget {
  const UsahaCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Jenis Usaha Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isUsahaPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isUsahaPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ini merupakan rekapan jenis usaha debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
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
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderRadioGroup(
                name: 'usaha',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isUsahaPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah jenis usaha debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BisnisCard extends StatelessWidget {
  const BisnisCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Bisnis Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isBisnisPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isBisnisPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan bisnis debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.BISNIS_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Summary Bisnis',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderRadioGroup(
                name: 'bisnis',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isBisnisPressed.value = true;
                },
                decoration: InputDecoration(
                  labelText: 'Apakah bisnis debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KarakterCard extends StatelessWidget {
  const KarakterCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Karakter Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isKarakterPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isKarakterPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan karakter debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
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
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderRadioGroup(
                name: 'karakter',
                wrapAlignment: WrapAlignment.center,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.caption!.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  label: const Text('Apakah karakter debitur ini layak?'),
                ),
                options: const [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text('👍 Ya'),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text('👎 Tidak'),
                  ),
                ],
                onChanged: (value) {
                  controller.isKarakterPressed.value = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeuanganCard extends StatelessWidget {
  const KeuanganCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Keuangan Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isKeuanganPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isKeuanganPressed.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan rekapan keuangan debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.NERACA_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Neraca',
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
                  Get.toNamed(Routes.RUGILABA_PRINT,
                      arguments: controller.insightDebitur.value);
                },
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
                  Get.toNamed(Routes.KEUANGAN_PRINT,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Summary Keuangan',
                icon: const Icon(
                  Icons.summarize,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              Center(
                child: FormBuilderRadioGroup(
                  name: 'keuangan',
                  wrapAlignment: WrapAlignment.center,
                  onChanged: (value) {
                    // if clicked then change isPressed to true
                    controller.isKeuanganPressed.value = true;
                  },
                  decoration: InputDecoration(
                    labelText: 'Apakah keuangan debitur ini layak?',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelStyle: Theme.of(context).textTheme.caption!.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                  ),
                  options: const [
                    FormBuilderFieldOption(
                      value: true,
                      child: Text('👍 Ya'),
                    ),
                    FormBuilderFieldOption(
                      value: false,
                      child: Text('👎 Tidak'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  const GalleryCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const GFTypography(
                text: 'Gallery Debitur',
                type: GFTypographyType.typo3,
                showDivider: false,
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan sekumpulan dokumen penunjang seperti foto dan dokumen lainnya yang sudah diunggah oleh tim analis',
                style: Theme.of(context).textTheme.caption?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_IMAGE,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Gallery',
                icon: const Icon(
                  Icons.image,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              SizedBox(
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
                        fontFamily: GoogleFonts.montserrat().fontFamily,
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
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_FILE,
                      arguments: controller.insightDebitur.value);
                },
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
        ),
      ),
    );
  }
}
