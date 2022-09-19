import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KapasitasTerpasan extends StatelessWidget {
  KapasitasTerpasan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
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
          controller.kapasitasTerpasan.value == 90
              ? FormBuilderTextField(
                  name: 'keteranganTerpasan',
                  controller: controller.kapasitasTerpasanKeterangan =
                      TextEditingController(text: 'Lebih dari s/d 80%'),
                )
              : controller.kapasitasTerpasan.value == 80
                  ? FormBuilderTextField(
                      name: 'keteranganTerpasan',
                      controller: controller.kapasitasTerpasanKeterangan =
                          TextEditingController(text: 's/d 80%'),
                    )
                  : controller.kapasitasTerpasan.value == 70
                      ? FormBuilderTextField(
                          name: 'keteranganTerpasan',
                          controller: controller.kapasitasTerpasanKeterangan =
                              TextEditingController(text: 's/d 70%'),
                        )
                      : controller.kapasitasTerpasan.value == 60
                          ? FormBuilderTextField(
                              name: 'keteranganTerpasan',
                              controller:
                                  controller.kapasitasTerpasanKeterangan =
                                      TextEditingController(text: 's/d 60%'),
                            )
                          : controller.kapasitasTerpasan.value == 50
                              ? FormBuilderTextField(
                                  name: 'keteranganTerpasan',
                                  controller: controller
                                          .kapasitasTerpasanKeterangan =
                                      TextEditingController(text: 's/d 50%'),
                                )
                              : FormBuilderTextField(
                                  name: 'keteranganTerpasan',
                                  controller:
                                      controller.kapasitasTerpasanKeterangan =
                                          TextEditingController(text: ''),
                                ),
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
      controller.kapasitasTerpasan.value == 90
          ? 'Score 90'
          : controller.kapasitasTerpasan.value == 80
              ? 'Score 80'
              : controller.kapasitasTerpasan.value == 70
                  ? 'Score 70'
                  : controller.kapasitasTerpasan.value == 60
                      ? 'Score 60'
                      : controller.kapasitasTerpasan.value == 50
                          ? 'Score 50'
                          : '',
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
