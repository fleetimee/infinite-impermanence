import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ScorePengalaman extends StatelessWidget {
  ScorePengalaman({Key? key}) : super(key: key);

  final controller = Get.put(KarakterAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.scorePengalaman.value == 0)
            Text(
              'Pilih Lamanya Pengalaman Debitur',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 60)
            Text(
              'Score 60',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 65)
            Text(
              'Score 65',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 70)
            Text(
              'Score 70',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 75)
            Text(
              'Score 75',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 80)
            Text(
              'Score 80',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 85)
            Text(
              'Score 85',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 90)
            Text(
              'Score 90',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.scorePengalaman.value == 95)
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
