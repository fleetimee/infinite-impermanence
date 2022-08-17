// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';

class ScoreUmur extends StatelessWidget {
  ScoreUmur({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(KarakterAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          if (controller.umur.value == 21)
            Text(
              'Score 61',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 22)
            Text(
              'Score 62',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 23)
            Text(
              'Score 63',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 24)
            Text(
              'Score 64',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 25)
            Text(
              'Score 65',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 26)
            Text(
              'Score 66',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 27)
            Text(
              'Score 67',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 28)
            Text(
              'Score 68',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 29)
            Text(
              'Score 69',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 30)
            Text(
              'Score 70',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 31)
            Text(
              'Score 71',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 32)
            Text(
              'Score 72',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 33)
            Text(
              'Score 73',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 34)
            Text(
              'Score 74',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 35)
            Text(
              'Score 75',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 36)
            Text(
              'Score 76',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 37)
            Text(
              'Score 77',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 38)
            Text(
              'Score 78',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 39)
            Text(
              'Score 79',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 40)
            Text(
              'Score 80',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 41)
            Text(
              'Score 81',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 42)
            Text(
              'Score 82',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 43)
            Text(
              'Score 83',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 44)
            Text(
              'Score 84',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 45)
            Text(
              'Score 85',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 46)
            Text(
              'Score 86',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 47)
            Text(
              'Score 87',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 48)
            Text(
              'Score 88',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 49)
            Text(
              'Score 89',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 50)
            Text(
              'Score 90',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 51)
            Text(
              'Score 80',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 52)
            Text(
              'Score 79',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 53)
            Text(
              'Score 78',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 54)
            Text(
              'Score 77',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 55)
            Text(
              'Score 76',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 56)
            Text(
              'Score 75',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 57)
            Text(
              'Score 74',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 58)
            Text(
              'Score 73',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 59)
            Text(
              'Score 72',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 60)
            Text(
              'Score 71',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 61)
            Text(
              'Score 65',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 62)
            Text(
              'Score 64',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 63)
            Text(
              'Score 63',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 64)
            Text(
              'Score 62',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (controller.umur.value == 65)
            Text(
              'Score 61',
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
