// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class AnalisaRatio extends StatelessWidget {
  AnalisaRatio({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

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
                  controller: controller.ratioProfitKini,
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
                  controller: controller.ratioProfitYAD,
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
            height: 20,
          ),
          Obx(
            // () => OutlinedButton.icon(
            //   icon: const Icon(Icons.percent),
            //   label: Text(
            //     controller.isRatioProfitLoading.value
            //         ? 'Loading..'
            //         : 'Hitung Ratio Profit',
            //     style:
            //         const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            //   ),
            //   style: OutlinedButton.styleFrom(
            //       foregroundColor: secondaryColor,
            //       backgroundColor: primaryColor,
            //       shape: const StadiumBorder(),
            //       maximumSize: const Size.fromWidth(double.infinity),
            //       fixedSize: const Size(500, 50)),
            //   onPressed: () {
            //     controller.hitungRatioProfit();
            //   },
            // ),
            () => GFButton(
              onPressed: () {
                controller.hitungRatioProfit();
              },
              text: controller.isRatioProfitLoading.value
                  ? 'Loading..'
                  : 'Hitung Ratio Profit',
              size: GFSize.LARGE,
              color: primaryColor,
              fullWidthButton: true,
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
                  controller: controller.roeKini,
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
                  controller: controller.roeYAD,
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
                    controller: controller.keteranganRoe,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROE',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => GFButton(
              onPressed: () {
                controller.hitungRoe();
              },
              text: controller.isRoeLoading.value ? 'Loading..' : 'Hitung Roe',
              size: GFSize.LARGE,
              color: primaryColor,
              fullWidthButton: true,
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
                  controller: controller.roaKini,
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
                  controller: controller.roaYAD,
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
                    controller: controller.keteranganRoa,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan ROA',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),

          Obx(
              // () => OutlinedButton.icon(
              //   icon: const Icon(Icons.percent),
              //   label: Text(
              //     controller.isRoaLoading.value ? 'Loading..' : 'Hitung Roa',
              //     style:
              //         const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              //   ),
              //   style: OutlinedButton.styleFrom(
              //       foregroundColor: secondaryColor,
              //       backgroundColor: primaryColor,
              //       shape: const StadiumBorder(),
              //       maximumSize: const Size.fromWidth(double.infinity),
              //       fixedSize: const Size(500, 50)),
              //   onPressed: () {
              //     controller.hitungRoa();
              //   },
              // ),
              () => GFButton(
                    onPressed: () {
                      controller.hitungRoa();
                    },
                    text: controller.isRoaLoading.value
                        ? 'Loading..'
                        : 'Hitung Roa',
                    size: GFSize.LARGE,
                    color: primaryColor,
                    fullWidthButton: true,
                  )),
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
                  readOnly: true,
                  controller: controller.derKini,
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
                  controller: controller.derYAD,
                  readOnly: true,
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
                    controller: controller.keteranganDer,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Keterangan DER',
                      border: OutlineInputBorder(),
                      suffixText: '%',
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            // () => OutlinedButton.icon(
            //   icon: const Icon(Icons.percent),
            //   label: Text(
            //     controller.isDerLoading.value ? 'Loading..' : 'Hitung Der',
            //     style:
            //         const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            //   ),
            //   style: OutlinedButton.styleFrom(
            //       foregroundColor: secondaryColor,
            //       backgroundColor: primaryColor,
            //       shape: const StadiumBorder(),
            //       maximumSize: const Size.fromWidth(double.infinity),
            //       fixedSize: const Size(500, 50)),
            //   onPressed: () {
            //     controller.hitungDer();
            //   },
            // ),
            () => GFButton(
              onPressed: () {
                controller.hitungDer();
              },
              text: controller.isDerLoading.value ? 'Loading..' : 'Hitung Der',
              size: GFSize.LARGE,
              color: primaryColor,
              fullWidthButton: true,
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
                  controller: controller.dscKini,
                  readOnly: true,
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
                  readOnly: true,
                  controller: controller.dscYAD,
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
          Obx(
            // () => OutlinedButton.icon(
            //   icon: const Icon(Icons.percent),
            //   label: Text(
            //     controller.isDscLoading.value ? 'Loading..' : 'Hitung Dsc',
            //     style:
            //         const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            //   ),
            //   style: OutlinedButton.styleFrom(
            //       foregroundColor: secondaryColor,
            //       backgroundColor: primaryColor,
            //       shape: const StadiumBorder(),
            //       maximumSize: const Size.fromWidth(double.infinity),
            //       fixedSize: const Size(500, 50)),
            //   onPressed: () {
            //     controller.hitungDsc();
            //   },
            // ),
            () => GFButton(
              onPressed: () {
                controller.hitungDsc();
              },
              text: controller.isDscLoading.value ? 'Loading..' : 'Hitung Dsc',
              size: GFSize.LARGE,
              color: primaryColor,
              fullWidthButton: true,
            ),
          ),
        ],
      ),
    );
  }
}
