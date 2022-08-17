// 🐦 Flutter imports:
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
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              FormBuilderTextField(
                name: 'Pinjaman Maksimal',
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
                name: 'Modal Kerja',
                textAlign: TextAlign.center,
                controller: controller.perhitunganModalKerja,
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                enabled: false,
                decoration: const InputDecoration(
                    labelText: 'Perhitungan Modal Kerja',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
              ),
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                name: 'Kebutuhan Investasi',
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
                name: 'Kebutuhan Kredit',
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
            ],
          ),
        ),
      ),
    );
  }
}
