import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalisaRatio extends StatelessWidget {
  AnalisaRatio({Key? key}) : super(key: key);

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
                  name: 'Ratio Profit Kini',
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
                  name: 'Ratio Profit YAD',
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
          Obx(
            () => colorButton(
              context,
              controller.isRatioProfitLoading.value
                  ? 'Loading..'
                  : 'Hitung Ratio Profit',
              () => controller.hitungRatioProfit(),
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
                  name: 'ROE',
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
                  name: 'ROE Kini',
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
                  name: 'ROE YAD',
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
          // if (int.parse(controller.roeYAD.text) >
          //     int.parse(controller.roeFixed.text))
          //   Text(
          //     'Baik 🥰',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //       fontWeight: FontWeight.w600,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // if (int.parse(controller.roeYAD.text) <
          //     int.parse(controller.roeFixed.text))
          //   Text(
          //     'Buruk 🤬',
          //     style: GoogleFonts.poppins(
          //       fontSize: 18,
          //       fontWeight: FontWeight.w600,
          //     ),
          //     textAlign: TextAlign.center,
          //   ),

          // Show Text from controller roeStatus
          Obx(
            () => Text(
              controller.isRoeDescLoading.value
                  ? 'Sedang memproses hasil..'
                  : controller.roeStatus.value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => colorButton(
              context,
              controller.isRoeLoading.value ? 'Loading...' : 'Hitung ROE',
              () => controller.hitungRoe(),
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
                  name: 'ROA',
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
                  name: 'ROA Kini',
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
                  name: 'ROA YAD',
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
            () => Text(
              controller.isRoaDescLoading.value
                  ? 'Sedang memproses hasil..'
                  : controller.roaStatus.value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx((() => colorButton(
                context,
                controller.isRoaLoading.value ? 'Loading...' : 'Hitung ROA',
                () => controller.hitungRoa(),
              ))),
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
                  name: 'DER',
                  controller: controller.derFixed,
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
                  name: 'DER Kini',
                  decoration: const InputDecoration(
                    labelText: 'DER Kini',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'DER YAD',
                  decoration: const InputDecoration(
                    labelText: 'DER YAD',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Diterima 🤝',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
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
                  name: 'DSC',
                  controller: controller.dscFixed,
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
                  name: 'DSC Kini',
                  decoration: const InputDecoration(
                    labelText: 'DSC Kini',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'DSC YAD',
                  decoration: const InputDecoration(
                    labelText: 'DSC YAD',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Diterima 🤝',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
