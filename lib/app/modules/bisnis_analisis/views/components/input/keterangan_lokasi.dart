import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KeteranganLokasi extends StatelessWidget {
  KeteranganLokasi({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ScoreView(controller: controller),
          DeskripsiView(controller: controller)
        ],
      ),
    );
  }
}

class DeskripsiView extends StatelessWidget {
  const DeskripsiView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BisnisAnalisisController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Column(
        children: [
          controller.lokasiPasar.value == 90
              ? FormBuilderTextField(
                  name: 'lokasiKeterangan',
                  controller: controller.lokasiPasarKeterangan =
                      TextEditingController(text: 'Sangat strategis'),
                )
              : controller.lokasiPasar.value == 80
                  ? FormBuilderTextField(
                      name: 'lokasiKeterangan',
                      controller: controller.lokasiPasarKeterangan =
                          TextEditingController(text: 'Strategis'),
                    )
                  : controller.lokasiPasar.value == 70
                      ? FormBuilderTextField(
                          name: 'lokasiKeterangan',
                          controller: controller.lokasiPasarKeterangan =
                              TextEditingController(text: 'Strategis'),
                        )
                      : controller.lokasiPasar.value == 60
                          ? FormBuilderTextField(
                              name: 'lokasiKeterangan',
                              controller: controller.lokasiPasarKeterangan =
                                  TextEditingController(
                                      text: 'Kurang strategis'),
                            )
                          : controller.lokasiPasar.value == 50
                              ? FormBuilderTextField(
                                  name: 'lokasiKeterangan',
                                  controller: controller.lokasiPasarKeterangan =
                                      TextEditingController(
                                          text: 'Tidak strategis'),
                                )
                              : FormBuilderTextField(
                                  name: 'lokasiKeterangan',
                                  controller: controller.lokasiPasarKeterangan =
                                      TextEditingController(text: ''),
                                )
        ],
      ),
    );
  }
}

class ScoreView extends StatelessWidget {
  const ScoreView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BisnisAnalisisController controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.lokasiPasar.value == 90
          ? 'Score 90'
          : controller.lokasiPasar.value == 80
              ? 'Score 80'
              : controller.lokasiPasar.value == 70
                  ? 'Score 70'
                  : controller.lokasiPasar.value == 60
                      ? 'Score 60'
                      : controller.lokasiPasar.value == 50
                          ? 'Score 50'
                          : '',
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
