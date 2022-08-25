import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            FormBuilderTextField(
              name: 'bunga_per_tahun',
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
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'trade_cycle',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Trade Cycle',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'jangka_waktu',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jangka Waktu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
