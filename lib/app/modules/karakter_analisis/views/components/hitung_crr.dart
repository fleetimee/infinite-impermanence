// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../../../common/style.dart';
import '../../controllers/karakter_analisis_controller.dart';

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
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              enabled: false,
              initialValue: controller.crrUmur.value.toString(),
              name: 'umur_crr',
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
                    initialValue: controller.crrPendidikan.value.toString(),
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
                    initialValue: controller.crrPengalaman.value.toString(),
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
                    initialValue: controller.crrUlet.value.toString(),
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
                    initialValue: controller.crrKaku.value.toString(),
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
                    initialValue: controller.crrInovatif.value.toString(),
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
                    initialValue: controller.crrJujur.value.toString(),
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
                if (controller.formKey.currentState?.saveAndValidate() ??
                    false) {
                  controller.saveAnalisaKarakter();
                  debugPrint(controller.formKey.currentState?.value.toString());
                } else {
                  debugPrint(controller.formKey.currentState?.value.toString());
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
