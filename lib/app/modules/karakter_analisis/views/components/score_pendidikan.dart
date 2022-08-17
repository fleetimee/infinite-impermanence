// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';

class ScorePendidikan extends StatelessWidget {
  ScorePendidikan({Key? key}) : super(key: key);

  final controller = Get.put(KarakterAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.scorePendidikan.value == 0)
            Text(
              'Pilih Pendidikan Debitur',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 60)
            Text(
              'Score 60',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 70)
            Text(
              'Score 70',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 75)
            Text(
              'Score 75',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 80)
            Text(
              'Score 80',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 85)
            Text(
              'Score 85',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 90)
            Text(
              'Score 90',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 95)
            Text(
              'Score 95',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePendidikan.value == 96)
            Text(
              'Score 95',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
