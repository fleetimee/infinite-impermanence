// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../../controllers/keuangan_analisis_controller.dart';

class ViewAnalisaRatio extends StatelessWidget {
  ViewAnalisaRatio({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              'a. Ratio profit',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.ratioProfitKini =
                      TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRatioKini)
                        .toStringAsFixed(1),
                  ),
                  readOnly: true,
                  name: 'ratio_profit_kini',
                  decoration: const InputDecoration(
                    labelText: 'Ratio Profit Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.ratioProfitYAD = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRatioYad)
                        .toStringAsFixed(1),
                  ),
                  name: 'ratio_profit_yad',
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Ratio Profit YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'b. ROE',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.roeFixed,
                  name: 'roe_fixed',
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'roe_kini',
                  controller: controller.roeKini = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRoeKini)
                        .toStringAsFixed(1),
                  ),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'ROE Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.roeYAD = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRoeYad)
                        .toStringAsFixed(1),
                  ),
                  name: 'roe_yad',
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'ROE YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isRoeDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_roe',
                    controller: controller.keteranganRoe =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganRoe),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROE',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'c. ROA',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'roa_fixed',
                  controller: controller.roaFixed,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'roa_kini',
                  readOnly: true,
                  controller: controller.roaKini = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRoaKini)
                        .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'ROA Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'roa_yad',
                  controller: controller.roaYAD = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenRoaYad)
                        .toStringAsFixed(1),
                  ),
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'ROA YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isRoaDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_roa',
                    controller: controller.keteranganRoa =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganRoa),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROA',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'd. DER',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'der_fixed',
                  controller: controller.derFixed,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'der_kini',
                  controller: controller.derKini = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenDerKini)
                        .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'DER Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'der_yad',
                  controller: controller.derYAD = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenDerYad)
                        .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'DER YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isDerDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_der',
                    controller: controller.keteranganDer =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganDer),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan DER',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'e. DSC',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'dsc_fixed',
                  controller: controller.dscFixed,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'dsc_kini',
                  controller: controller.dscKini = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenDscKini)
                        .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'DSC Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'dsc_yad',
                  controller: controller.dscYAD = TextEditingController(
                    text: double.parse(data.analisaKeuangan.persenDscYad)
                        .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'DSC YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => controller.isDscDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_dsc',
                    controller: controller.keteranganDsc =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganDsc),
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan DSC',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// Change string to double
