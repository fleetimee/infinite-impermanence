// 🎯 Dart imports:
import 'dart:developer';

// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:

class EditHasilAnalisa extends StatelessWidget {
  EditHasilAnalisa({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              // 'Total CRR : ${data.analisaKeuangan.totalCrrKeuangan.toString()}',
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
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
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
                  controller.saveAnalisisKeuangan();
                  Get.back();
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
