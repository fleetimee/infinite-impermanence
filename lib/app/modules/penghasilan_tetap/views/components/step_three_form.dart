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
      key: controller.formKeys[2],
      child: Column(
        children: <Widget>[
          const Text(
            'Riwayat Peminjaman',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Jika debitur pernah meminjam, maka aktifkan switch.',
            style: TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.fade,
              letterSpacing: 1,
            ),
          ),
          // Obx(
          //   () => FormBuilderSwitch(
          //     onChanged: (value) {
          //       controller.isPernahPinjam.value = value!;
          //       // if (!value) {
          //       //   controller.formKeys[2].currentState?.reset();
          //       // }
          //       // Reset form if not checked
          //       if (value) {
          //         controller.formKeys[2].currentState!.reset();
          //       }
          //     },
          //     name: 'Pernah Pinjam',
          //     title: const Text(
          //       'Pernah Pinjam ?',
          //       style: TextStyle(
          //         fontSize: 15,
          //       ),
          //     ),
          //   ),
          // ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pernah Pinjam ?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  controller.isPernahPinjam.value ? 'Ya' : 'Tidak',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Switch(
                  onChanged: (value) {
                    controller.isPernahPinjam.value = value;
                    // if (!value) {
                    //   controller.formKeys[2].currentState?.reset();
                    // }
                    // Reset form if not checked
                    if (!value) {
                      controller.formKeys[2].currentState?.reset();
                    }
                  },
                  value: controller.isPernahPinjam.value,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => FormBuilderTextField(
              controller: controller.noRekeningController,
              enabled: controller.isPernahPinjam.value ? true : false,
              name: 'No Rekening',
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                border: OutlineInputBorder(),
                labelText: 'No Rekening',
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => FormBuilderTextField(
              enabled: controller.isPernahPinjam.value ? true : false,
              name: 'Plafon Kredit',
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixText: 'Rp',
                prefixIcon: Icon(Icons.monetization_on_sharp),
                border: OutlineInputBorder(),
                labelText: 'Plafon Kredit',
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => FormBuilderDateTimePicker(
              controller: controller.tanggalMulaiKreditController,
              enabled: controller.isPernahPinjam.value ? true : false,
              keyboardType: TextInputType.datetime,
              name: 'Tgl Kredit',
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_outlined),
                border: OutlineInputBorder(),
                labelText: 'Tgl Mulai Kredit',
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => FormBuilderDateRangePicker(
              enabled: controller.isPernahPinjam.value ? true : false,
              name: 'Jangka Waktu Kredit',
              controller: controller.namaPejabatPenanggungJawabController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_view_month),
                border: OutlineInputBorder(),
                labelText: 'Jangka Waktu Kredit',
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
              firstDate: DateTime(2000),
              lastDate: DateTime(2050),
            ),
          ),
        ],
      ),
    );
  }
}
