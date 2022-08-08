import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HitungCrr extends StatelessWidget {
  HitungCrr({Key? key}) : super(key: key);

  final controller = Get.put(KarakterAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: FormBuilder(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/karakter/calculate.png',
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
                    controller: controller.resultPendidikan,
                    name: 'Pendidikan CRR',
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
                    controller: controller.resultPengalaman,
                    name: 'Pengalaman CRR',
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
                    controller: controller.resultUlet,
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
                    controller: controller.resultKaku,
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
                    controller: controller.resultInovatif,
                    name: 'Inovatif CRR',
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
                    controller: controller.resultJujur,
                    name: 'Jujur CRR',
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
              controller.resultCrr.toString(),
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: // Make text green if value exceed 65 and red if below 65
                    controller.resultCrr.value >= 65.0
                        ? Colors.green
                        : Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (controller.resultCrr.value >= 65.0)
              Text(
                'Debitur melewati Passing Grade',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            if (controller.resultCrr.value < 65.0)
              Text(
                'Debitur belum melewati Passing Grade',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
