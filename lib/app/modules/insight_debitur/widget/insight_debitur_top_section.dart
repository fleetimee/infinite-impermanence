// 🐦 Flutter imports:
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/insight_debitur/widget/components/insight_debitur_top_section/print_button.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturTopSection extends StatelessWidget {
  final InsightDebiturController controller;

  final InputNeracaController neracaController;
  final RugiLabaController rugiLabaController;
  final KeuanganAnalisisController analisaKeuanganController;
  final BisnisAnalisisController analisaBisnisController;
  final KarakterAnalisisController analisaKarakterController;
  final UsahaAnalisisController analisaJenisUsahaController;
  final AgunanPilihController selectAgunanController;
  final AgunanAnalisisController analisaAgunanController;

  /// Widget ini berisi informasi debitur pada bagian atas
  /// Yang meliputi:
  /// - Nama Debitur
  /// - Chip Widget Tipe Pengajuan
  /// - Button Printing (PDF), Button Edit, Button Upload Dokumen dan Foto
  const InsightDebiturTopSection({
    super.key,
    required this.controller,
    required this.analisaKeuanganController,
    required this.rugiLabaController,
    required this.neracaController,
    required this.analisaBisnisController,
    required this.analisaKarakterController,
    required this.analisaJenisUsahaController,
    required this.selectAgunanController,
    required this.analisaAgunanController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChipDebitur(
            controller: controller,
          ),
          const SizedBox(height: 5),
          Obx(
            () => controller.isDataLoading.value
                ? const Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'Di-input oleh ${auth.currentUser?.displayName ?? 'Admin'} pada ${DateFormat('dd MMMM yyyy').format(
                      DateTime.parse(controller.insightDebitur.value.tglSekarang
                          .toString()),
                    )}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(
                  () => controller.isDataLoading.value
                      ? const Text('Loading...')
                      : Text(
                          controller.insightDebitur.value.peminjam1.toString(),
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
              IconButton(
                color: primaryColor,
                enableFeedback: true,
                onPressed: () {
                  Get.toNamed(Routes.DEBITUR_EDIT,
                      arguments: controller.insightDebitur.value);
                },
                icon: const Icon(FontAwesomeIcons.pencil),
              ),
              UploadImageButton(
                controller: controller,
              ),
              UploadDocButton(
                controller: controller,
              ),
              PrintButton(
                analisaKeuanganController: analisaKeuanganController,
                rugiLabaController: rugiLabaController,
                neracaController: neracaController,
                analisaBisnisController: analisaBisnisController,
                analisaKarakterController: analisaKarakterController,
                analisaAgunanController: analisaAgunanController,
                analisaJenisUsahaController: analisaJenisUsahaController,
                controller: controller,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({
    super.key,
    required this.controller,
  });

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(Routes.GALLERY_IMAGE,
            arguments: controller.insightDebitur.value);
      },
      icon: const Icon(
        FontAwesomeIcons.photoFilm,
      ),
      enableFeedback: true,
      color: primaryColor,
    );
  }
}

class UploadDocButton extends StatelessWidget {
  const UploadDocButton({
    super.key,
    required this.controller,
  });

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(Routes.GALLERY_FILE,
            arguments: controller.insightDebitur.value);
      },
      icon: const Icon(
        FontAwesomeIcons.folderOpen,
      ),
      enableFeedback: true,
      color: primaryColor,
    );
  }
}

class ChipDebitur extends StatelessWidget {
  final InsightDebiturController controller;

  const ChipDebitur({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Chip(
          label: Text('UMKM'),
        ),
        const SizedBox(width: 5),
        Obx(
          () => controller.isDataLoading.value
              ? const Chip(label: Text('Loading...'))
              : Chip(
                  label: Text(
                      controller.insightDebitur.value.jenisUsaha.toString())),
        ),
        const SizedBox(width: 5),
        Obx(
          () => controller.isDataLoading.value
              ? const Chip(label: Text('Loading...'))
              : controller.insightDebitur.value.inputRugiLaba == null
                  ? const SizedBox.shrink()
                  : double.parse(controller
                              .insightDebitur.value.inputRugiLaba!.omzet
                              .toString()) <=
                          100000000
                      ? const Chip(label: Text('Mikro'))
                      : const Chip(label: Text('Kecil')),
        ),
        const SizedBox(width: 5),
        const Chip(label: Text('Tetap')),
        const SizedBox(width: 5),
        Obx(
          () => controller.isDataLoading.value
              ? const Chip(label: Text('Loading...'))
              : controller.insightDebitur.value.inputKeuangan == null
                  ? const SizedBox.shrink()
                  : double.parse(controller.insightDebitur.value.inputKeuangan!
                                  .kreditDiusulkan
                                  .toString()) >
                              0 &&
                          double.parse(controller.insightDebitur.value
                                  .inputKeuangan!.kreditDiusulkan
                                  .toString()) <=
                              10000000
                      ? const Chip(label: Text('KUR Super Mikro'))
                      : double.parse(controller.insightDebitur.value
                                      .inputKeuangan!.kreditDiusulkan
                                      .toString()) >
                                  10000000 &&
                              double.parse(controller.insightDebitur.value
                                      .inputKeuangan!.kreditDiusulkan
                                      .toString()) <=
                                  100000000
                          ? const Chip(label: Text('KUR Mikro'))
                          : const Chip(label: Text('KUR Kecil')),
        ),
      ],
    );
  }
}
