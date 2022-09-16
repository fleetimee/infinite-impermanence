// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

class ViewAnalisaRatio extends StatelessWidget {
  ViewAnalisaRatio({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  enabled: false,
                  name: 'ratio_profit_kini',
                  decoration: const InputDecoration(
                    labelText: 'Ratio Profit Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                          .toStringAsFixed(1)),
                  name: 'ratio_profit_yad',
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Ratio Profit YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Obx(
          //   () => colorButton(
          //     context,
          //     controller.isRatioProfitLoading.value
          //         ? 'Loading..'
          //         : 'Hitung Ratio Profit',
          //     () => controller.hitungRatioProfit(),
          //   ),
          // ),

          const SizedBox(
            height: 30,
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
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                      text: data.analisaKeuangan.persenRoeKini.toString()),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'ROE Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.roeYAD = TextEditingController(
                      text: data.analisaKeuangan.persenRoeYad.toString()),
                  name: 'roe_yad',
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'ROE YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROE',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(FontAwesomeIcons.percent),
                    ),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Obx(
          //   () => colorButton(
          //     context,
          //     controller.isRoeLoading.value ? 'Loading...' : 'Hitung ROE',
          //     () => controller.hitungRoe(),
          //   ),
          // ),

          const SizedBox(
            height: 30,
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
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                  enabled: false,
                  controller: controller.roaKini = TextEditingController(
                      text: double.parse(data.analisaKeuangan.persenRoaKini)
                          .toStringAsFixed(1)),
                  decoration: const InputDecoration(
                    labelText: 'ROA Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                          .toStringAsFixed(1)),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'ROA YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROA',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(FontAwesomeIcons.percent),
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Obx((() => colorButton(
          //       context,
          //       controller.isRoaLoading.value ? 'Loading...' : 'Hitung ROA',
          //       () => controller.hitungRoa(),
          //     ))),

          const SizedBox(
            height: 30,
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
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                    text:
                        data.analisaKeuangan.persenDerKini.toString() == '0.00'
                            ? '-'
                            : double.parse(data.analisaKeuangan.persenDerKini)
                                .toStringAsFixed(1),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'DER Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Obx(
          //   () => Text(
          //     controller.isDerDescLoading.value
          //         ? 'Sedang memproses hasil..'
          //         : controller.derStatus.value,
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //       fontWeight: FontWeight.w600,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Obx(
            () => controller.isDerDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_der',
                    controller: controller.keteranganDer =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganDer),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan DER',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(FontAwesomeIcons.percent),
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Obx(
          //   (() => colorButton(
          //         context,
          //         controller.isDerLoading.value ? 'Loading...' : 'Hitung DER',
          //         () => controller.hitungDer(),
          //       )),
          // ),

          const SizedBox(
            height: 30,
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
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
                  enabled: false,
                  controller: controller.dscKini = TextEditingController(
                      text: double.parse(data.analisaKeuangan.persenDscKini)
                          .toString()),
                  decoration: const InputDecoration(
                    labelText: 'DSC Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'dsc_yad',
                  enabled: false,
                  controller: controller.dscYAD = TextEditingController(
                      text: double.parse(data.analisaKeuangan.persenDscYad)
                          .toString()),
                  decoration: const InputDecoration(
                    labelText: 'DSC YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Obx(
          //   () => Text(
          //     controller.isDscDescLoading.value
          //         ? 'Sedang memproses hasil..'
          //         : controller.dscStatus.value,
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //       fontWeight: FontWeight.w600,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Obx(
            () => controller.isDscDescLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FormBuilderTextField(
                    name: 'keterangan_dsc',
                    controller: controller.keteranganDsc =
                        TextEditingController(
                            text: data.analisaKeuangan.keteranganDsc),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan DSC',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(FontAwesomeIcons.percent),
                    ),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

// Change string to double
