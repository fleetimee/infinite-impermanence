// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/input_form.dart';

class StepThreeForm extends StatelessWidget {
  StepThreeForm({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeys[2],
      child: Column(children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        inputForm(
          context,
          'Total Penghasilan',
          'Masukkan Total Penghasilan',
          const Icon(Icons.work),
          TextInputType.number,
          controller.moneyController,
        ),
        const SizedBox(
          height: 30,
        ),
        inputForm(
          context,
          'Bidang Usaha',
          'Masukkan Bidang Usaha',
          const Icon(Icons.assured_workload_sharp),
          TextInputType.text,
          controller.bidangUsahaController,
        ),
        const SizedBox(
          height: 30,
        ),
        inputForm(
          context,
          'Jumlah Tanggungan',
          'Masukkan Jumlah Tanggungan',
          const Icon(Icons.child_care),
          TextInputType.number,
          controller.jumlahTanggunganController,
        ),
      ]),
    );
  }
}
