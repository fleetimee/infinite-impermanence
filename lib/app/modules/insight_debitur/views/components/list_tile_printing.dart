// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class PrintInput extends StatelessWidget {
  PrintInput({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Input',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.keyboard,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print inputan',
      icon: controller.insightDebitur.value.analisaKeuangan != null &&
              controller.insightDebitur.value.analisaAgunan != null &&
              controller.insightDebitur.value.analisaBisnis != null &&
              controller.insightDebitur.value.analisaJenisUsaha != null &&
              controller.insightDebitur.value.analisaKarakter != null &&
              controller.insightDebitur.value.syaratLain!.isNotEmpty &&
              controller.insightDebitur.value.ijinLegitimasi != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.INPUT_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Harap Lengkapi Semua Untuk Melanjutkan',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintNeraca extends StatelessWidget {
  PrintNeraca({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Keterangan Neraca',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.scaleUnbalanced,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Keterangan Neraca',
      icon: controller.insightDebitur.value.inputNeraca != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.NERACA_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Neraca belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintUsulanBaru extends StatelessWidget {
  PrintUsulanBaru({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Memorandum Pengusulan Kredit',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.comments,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Memorandum Pengusulan Kredit',
      icon: controller.insightDebitur.value.analisaKeuangan != null &&
              controller.insightDebitur.value.analisaAgunan != null &&
              controller.insightDebitur.value.analisaBisnis != null &&
              controller.insightDebitur.value.analisaJenisUsaha != null &&
              controller.insightDebitur.value.analisaKarakter != null &&
              controller.insightDebitur.value.syaratLain!.isNotEmpty
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.USULAN_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Hara Lengkapi Semua Untuk Melanjutkan',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintRugiLaba extends StatelessWidget {
  PrintRugiLaba({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Laporan Keuangan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.fileContract,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Laporan Keuangan',
      icon: controller.insightDebitur.value.inputRugiLaba != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.RUGILABA_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Laporan Keuangan belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintAgunan extends StatelessWidget {
  PrintAgunan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Analisa Agunan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.fileInvoice,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Agunan',
      icon: controller.insightDebitur.value.analisaAgunan != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.AGUNAN_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Analisa Agunan belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintPutusan extends StatelessWidget {
  PrintPutusan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Putusan Kredit',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.personBreastfeeding,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print putusan kredit',
      icon: controller.insightDebitur.value.analisaKeuangan != null &&
              controller.insightDebitur.value.analisaAgunan != null &&
              controller.insightDebitur.value.analisaBisnis != null &&
              controller.insightDebitur.value.analisaJenisUsaha != null &&
              controller.insightDebitur.value.analisaKarakter != null &&
              controller.insightDebitur.value.syaratLain!.isNotEmpty &&
              controller.insightDebitur.value.asuransi != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.PUTUSAN_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Harap Lengkapi Semua Sebelum Melanjutkan',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintUsulan extends StatelessWidget {
  PrintUsulan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Memorandum Pengusulan Komite Kredit',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.comment,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Memorandum Pengusulan Komite Kredit',
      icon: controller.insightDebitur.value.analisaKeuangan != null &&
              controller.insightDebitur.value.analisaAgunan != null &&
              controller.insightDebitur.value.analisaBisnis != null &&
              controller.insightDebitur.value.analisaJenisUsaha != null &&
              controller.insightDebitur.value.analisaKarakter != null &&
              controller.insightDebitur.value.syaratLain!.isNotEmpty &&
              controller.insightDebitur.value.asuransi != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.USULAN_BARU_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Harap Lengkapi Semua Untuk Melanjutkan',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class PrintKeuangan extends StatelessWidget {
  PrintKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Analisa Keuangan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.fileInvoiceDollar,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print hasil Analisa Keuangan',
      icon: controller.insightDebitur.value.analisaKeuangan != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.KEUANGAN_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Keuangan belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class ModelPrint extends StatelessWidget {
  const ModelPrint({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Model',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.pagelines,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print model bobot yang digunakan',
      icon: GFButton(
        onPressed: () {
          Get.toNamed(Routes.MODEL_PRINT,
              arguments: controller.insightDebitur.value);
        },
        text: "READY",
        buttonBoxShadow: true,
        color: GFColors.SUCCESS,
      ),
    );
  }
}

class BisnisPrint extends StatelessWidget {
  BisnisPrint({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Analisa Bisnis',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.filePrescription,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print hasil Analisa Bisnis',
      icon: controller.insightDebitur.value.analisaBisnis != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.BISNIS_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Bisnis belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class KarakterPrint extends StatelessWidget {
  KarakterPrint({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Analisa Karakter',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.fileCode,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print hasil Analisa Karakter',
      icon: controller.insightDebitur.value.analisaKarakter != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.KARAKTER_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Karakter belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class JenisUsahaPrint extends StatelessWidget {
  JenisUsahaPrint({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Analisa Jenis Usaha',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.fileMedical,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print hasil Analisa Jenis Usaha',
      icon: controller.insightDebitur.value.analisaJenisUsaha != null
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.USAHA_PRINT,
                    arguments: controller.insightDebitur.value);
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Data Jenis Usaha belum lengkap',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}

class SlikPrint extends StatelessWidget {
  SlikPrint({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
        title: const Text(
          'Pernyataan SLIK',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        avatar: const GFAvatar(
          backgroundColor: primaryColor,
          child: Icon(
            FontAwesomeIcons.squarespace,
            color: secondaryColor,
          ),
        ),
        subTitleText: 'Print Pernyaataan SLIK',
        icon: GFButton(
          onPressed: () {
            Get.toNamed(Routes.SLIK_PRINTING,
                arguments: controller.insightDebitur.value);
          },
          text: "READY",
          buttonBoxShadow: true,
          color: GFColors.SUCCESS,
        ));
  }
}

class SpkkPrint extends StatelessWidget {
  SpkkPrint({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
        title: const Text(
          'SPKK',
          style: TextStyle(
            color: primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        avatar: const GFAvatar(
          backgroundColor: primaryColor,
          child: Icon(
            FontAwesomeIcons.medium,
            color: secondaryColor,
          ),
        ),
        subTitleText: 'Print SPKK',
        icon: GFButton(
          onPressed: () {
            Get.toNamed(Routes.SPKK_PRINTING,
                arguments: controller.insightDebitur.value);
          },
          text: "READY",
          buttonBoxShadow: true,
          color: GFColors.SUCCESS,
        ));
  }
}
