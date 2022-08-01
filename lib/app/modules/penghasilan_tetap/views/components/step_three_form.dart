import 'package:akm/app/modules/penghasilan_tetap/controllers/penghasilan_tetap_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class StepThreeForm extends StatelessWidget {
  StepThreeForm({Key? key}) : super(key: key);

  final controller = Get.put(PenghasilanTetapController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(),
    );
  }
}
