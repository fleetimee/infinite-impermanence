import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KeteranganPersainganPasar extends StatelessWidget {
  KeteranganPersainganPasar({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        return Column(
          children: [
            ScoreView(controller: controller),
            DeskripsiView(controller: controller)
          ],
        );
      }),
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
          controller.persainganPasar.value == 90
              ? FormBuilderTextField(
                  name: 'keteranganPersaingan',
                  controller: controller.persainganPasarKeterangan =
                      TextEditingController(text: 'Tidak Ketat'),
                )
              : controller.persainganPasar.value == 80
                  ? FormBuilderTextField(
                      name: 'keteranganPersaingan',
                      controller: controller.persainganPasarKeterangan =
                          TextEditingController(text: 'Kurang Ketat'),
                    )
                  : controller.persainganPasar.value == 70
                      ? FormBuilderTextField(
                          name: 'keteranganPersaingan',
                          controller: controller.persainganPasarKeterangan =
                              TextEditingController(text: 'Cukup Ketat'),
                        )
                      : controller.persainganPasar.value == 60
                          ? FormBuilderTextField(
                              name: 'keteranganPersaingan',
                              controller: controller.persainganPasarKeterangan =
                                  TextEditingController(text: 'Ketat'),
                            )
                          : controller.persainganPasar.value == 50
                              ? FormBuilderTextField(
                                  name: 'keteranganPersaingan',
                                  controller:
                                      controller.persainganPasarKeterangan =
                                          TextEditingController(
                                              text: 'Sangat Ketat'),
                                )
                              : FormBuilderTextField(
                                  name: 'keteranganPersaingan')
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
      controller.persainganPasar.value == 90
          ? 'Score 90'
          : controller.persainganPasar.value == 80
              ? 'Score 80'
              : controller.persainganPasar.value == 70
                  ? 'Score 70'
                  : controller.persainganPasar.value == 60
                      ? 'Score 60'
                      : controller.persainganPasar.value == 50
                          ? 'Score 50'
                          : '',
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
