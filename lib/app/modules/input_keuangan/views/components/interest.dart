// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../../../common/style.dart';
import '../../controllers/input_keuangan_controller.dart';

class Interest extends StatelessWidget {
  Interest({Key? key}) : super(key: key);

  final controller = Get.put((InputKeuanganController()));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Interest',
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
              'assets/images/input_keuangan/pig.svg',
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'bunga_per_tahun_int',
                    enabled: false,
                    keyboardType: TextInputType.number,
                    controller: controller.bungaPerTahun,
                    decoration: InputDecoration(
                      labelText: 'Bunga per tahun',
                      suffixIcon: const Icon(FontAwesomeIcons.percent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    name: 'jangka_waktu',
                    controller: controller.angsuranPerBulan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jangka Waktu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'trade_cycle',
              controller: controller.tradeCycle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Trade Cycle',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                if (controller.formKeyInputKeuangan.currentState
                        ?.saveAndValidate() ??
                    false) {
                  controller.saveKeuangan();
                  Get.back();
                } else {
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
