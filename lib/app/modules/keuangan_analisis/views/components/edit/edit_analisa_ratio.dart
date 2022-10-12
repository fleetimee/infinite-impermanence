// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

// 🌎 Project imports:

class EditAnalisaRatio extends StatelessWidget {
  EditAnalisaRatio({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

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
                  controller: controller.ratioProfitKini,
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
                  controller: controller.ratioProfitYAD,
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
          Obx(
            () => OutlinedButton.icon(
              icon: const Icon(Icons.percent),
              label: Text(
                controller.isRatioProfitLoading.value
                    ? 'Loading..'
                    : 'Hitung Ratio Profit',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungRatioProfit();
              },
            ),
          ),
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
                  controller: controller.roeKini,
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
                  controller: controller.roeYAD,
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
                    controller: controller.keteranganRoe,
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
          Obx(
            () => OutlinedButton.icon(
              icon: const Icon(Icons.percent),
              label: Text(
                controller.isRoeLoading.value ? 'Loading..' : 'Hitung Roe',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungRoe();
              },
            ),
          ),
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
                  controller: controller.roaKini,
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
                  controller: controller.roaYAD,
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
                    controller: controller.keteranganRoa,
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
          Obx(
            () => OutlinedButton.icon(
              icon: const Icon(Icons.percent),
              label: Text(
                controller.isRoaLoading.value ? 'Loading..' : 'Hitung Roa',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungRoa();
              },
            ),
          ),
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
                  controller: controller.derKini,
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
                  controller: controller.derYAD,
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
                    controller: controller.keteranganDer,
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
          Obx(
            () => OutlinedButton.icon(
              icon: const Icon(Icons.percent),
              label: Text(
                controller.isDerLoading.value ? 'Loading..' : 'Hitung Der',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungDer();
              },
            ),
          ),
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
                  controller: controller.dscKini,
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
                  controller: controller.dscYAD,
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
                    controller: controller.keteranganDsc,
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
          Obx(
            () => OutlinedButton.icon(
              icon: const Icon(Icons.percent),
              label: Text(
                controller.isDscLoading.value ? 'Loading..' : 'Hitung Dsc',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungDsc();
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
