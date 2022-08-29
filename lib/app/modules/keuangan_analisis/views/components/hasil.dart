// 🐦 Flutter imports:
import 'dart:developer';

import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

class HasilAnalisa extends StatelessWidget {
  HasilAnalisa({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            FormBuilderTextField(
              name: 'pinjaman_maksimal',
              textAlign: TextAlign.center,
              controller: controller.pinjamanMaksimal,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              enabled: false,
              decoration: const InputDecoration(
                labelText: 'Pinjaman Maksimal',
                border: OutlineInputBorder(),
                prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FormBuilderTextField(
              name: 'perhitungan_investasi',
              textAlign: TextAlign.center,
              controller: controller.perhitunganModalKerja,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              enabled: false,
              decoration: const InputDecoration(
                  labelText: 'Perhitungan Investasi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
            ),
            const SizedBox(
              height: 30,
            ),
            FormBuilderTextField(
              name: 'trade_cycle',
              textAlign: TextAlign.center,
              controller: controller.tradeCycle,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              enabled: false,
              decoration: const InputDecoration(
                  labelText: 'Trade Cycle',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
            ),
            const SizedBox(
              height: 30.0,
            ),
            FormBuilderTextField(
              name: 'kebutuhan_investasi',
              textAlign: TextAlign.center,
              controller: controller.kebutuhanInvestasi,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              enabled: false,
              decoration: const InputDecoration(
                  labelText: 'Kebutuhan Investasi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
            ),
            const SizedBox(
              height: 30,
            ),
            FormBuilderTextField(
              name: 'kebutuhan_kredit',
              textAlign: TextAlign.center,
              controller: controller.kebutuhanKredit,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              enabled: false,
              decoration: const InputDecoration(
                  labelText: 'Kebutuhan Kredit',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Total CRR : ${controller.crr.text}',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.paypal_rounded),
              label: const Text(
                'Submit',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: primaryColor,
                  primary: secondaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                if (controller.formKeyAnalisaKeuangan.currentState
                        ?.saveAndValidate() ??
                    false) {
                  debugPrint(controller
                      .formKeyAnalisaKeuangan.currentState?.value
                      .toString());
                  log(controller.formKeyAnalisaKeuangan.currentState!.value
                      .toString());
                } else {
                  debugPrint(controller
                      .formKeyAnalisaKeuangan.currentState?.value
                      .toString());
                  debugPrint('validation failed');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
