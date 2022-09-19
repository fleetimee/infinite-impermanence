import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KeteranganHargaBersaing extends StatelessWidget {
  KeteranganHargaBersaing({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ScoreView(controller: controller),
          DescriptionView(controller: controller)
        ],
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({
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
          controller.hargaBersaing.value == 90
              ? FormBuilderTextField(
                  name: 'keteranganHarga',
                  controller: controller.hargaBersaingKeterangan =
                      TextEditingController(text: 'Lebih murah diatas 10%'),
                )
              : controller.hargaBersaing.value == 80
                  ? FormBuilderTextField(
                      name: 'keteranganHarga',
                      controller: controller.hargaBersaingKeterangan =
                          TextEditingController(text: 'Lebih murah 5 - 10%'),
                    )
                  : controller.hargaBersaing.value == 70
                      ? FormBuilderTextField(
                          name: 'keteranganHarga',
                          controller: controller.hargaBersaingKeterangan =
                              TextEditingController(text: 'Lebih sd %5'),
                        )
                      : controller.hargaBersaing.value == 60
                          ? FormBuilderTextField(
                              name: 'keteranganHarga',
                              controller: controller.hargaBersaingKeterangan =
                                  TextEditingController(
                                      text: 'Sama dengan pesaing'),
                            )
                          : controller.hargaBersaing.value == 50
                              ? FormBuilderTextField(
                                  name: 'keteranganHarga',
                                  controller:
                                      controller.hargaBersaingKeterangan =
                                          TextEditingController(
                                              text: 'Lebih mahal dari pesaing'),
                                )
                              : FormBuilderTextField(
                                  name: 'keteranganHarga',
                                  controller:
                                      controller.hargaBersaingKeterangan =
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
      controller.hargaBersaing.value == 90
          ? 'Score 90'
          : controller.hargaBersaing.value == 80
              ? 'Score 80'
              : controller.hargaBersaing.value == 70
                  ? 'Score 70'
                  : controller.hargaBersaing.value == 60
                      ? 'Score 60'
                      : controller.hargaBersaing.value == 50
                          ? 'Score 50'
                          : '',
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
