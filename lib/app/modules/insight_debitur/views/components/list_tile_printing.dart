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
        child: Icon(
          FontAwesomeIcons.vaadin,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print inputan',
      icon: controller.insightDebitur.value.analisaKeuangan != null
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

class PrintNeraca extends StatelessWidget {
  PrintNeraca({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Neraca',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.squareReddit,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print Neraca',
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

class PrintPutusan extends StatelessWidget {
  PrintPutusan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Putusan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.rebel,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print surat putusan',
      icon: controller.insightDebitur.value.analisaKeuangan != null
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

class PrintUsulan extends StatelessWidget {
  PrintUsulan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Usulan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.uikit,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print surat usulan',
      icon: controller.insightDebitur.value.analisaKeuangan != null
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

class PrintKeuangan extends StatelessWidget {
  PrintKeuangan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Keuangan',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.gitlab,
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
        'Bisnis',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.docker,
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
        'Karakter',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.teamspeak,
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
        'Jenis Usaha',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.unity,
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
