// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';

class LihatHitungCrr extends StatelessWidget {
  LihatHitungCrr({Key? key}) : super(key: key);

  final controller = Get.put(KarakterAnalisisController());

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: FormBuilder(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              enabled: false,
              initialValue: data.analisaKarakter.crrUmur.toString(),
              name: 'umur_crr',
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Umur CRR',
                labelStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue: data.analisaKarakter.crrPendidikan.toString(),
                    name: 'pendidikan_crr',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Pendidikan CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue:
                        data.analisaKarakter.crrLamanyaBerusaha.toString(),
                    name: 'pengalaman_crr',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Pengalaman CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue: data.analisaKarakter.crrUlet.toString(),
                    name: 'Keuletan CRR',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Keuletan CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue: data.analisaKarakter.crrKaku.toString(),
                    name: 'Flexible CRR',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Flexible CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue: data.analisaKarakter.crrKreatif.toString(),
                    name: 'inovatif_crr',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Inovatif CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    initialValue: data.analisaKarakter.crrKejujuran.toString(),
                    name: 'jujur_crr',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Jujur CRR',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              data.analisaKarakter.totalCrrKarakter.toString(),
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: // Make text green if value exceed 65 and red if below 65
                    double.parse(data.analisaKarakter.totalCrrKarakter) >= 65.0
                        ? Colors.green
                        : Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
