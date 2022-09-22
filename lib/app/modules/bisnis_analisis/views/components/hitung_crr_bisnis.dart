// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_tex_js/flutter_tex_js.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
 import '../../../../common/style.dart';
 import '../../controllers/bisnis_analisis_controller.dart';

class HitungCrrBisnis extends StatelessWidget {
  HitungCrrBisnis({Key? key}) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Image.asset(
              //   'assets/images/karakter/calculate.png',
              // ),
              // const TexImage(
              //   r'''a + b + c + d + e + f''',
              //   fontSize: 30,
              //   displayMode: true,
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      enabled: false,
                      controller: controller.resultOmzet,
                      name: 'Omzet CRR',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Omzet CRR',
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
                      controller: controller.resultHarga,
                      name: 'Harga Bersaing CRR',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Harga Bersaing CRR',
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
                      controller: controller.resultPersaingan,
                      name: 'Persaingan Pasar CRR',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Persaingan Pasar CRR',
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
                      controller: controller.resultLokasi,
                      name: 'Lokasi CRR',
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Lokasi CRR',
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
                      controller: controller.resultKapasitas,
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
                      controller: controller.resultRating,
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
                height: 20,
              ),
              FormBuilderTextField(
                textAlign: TextAlign.center,
                enabled: false,
                controller: controller.sumCrrBisnis,
                name: 'Sum hasil diatas',
                style: const TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Sum hasil diatas',
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const TexImage(
                r'''sumBisnis / 6 ''',
                fontSize: 30,
                displayMode: true,
              ),
              Text(
                controller.resultCrrBisnis.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: // Make text green if value exceed 65 and red if below 65
                      controller.resultCrrBisnis.value >= 65.0
                          ? Colors.green
                          : Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // if (controller.resultCrrBisnis.value >= 65.0)
              //   Text(
              //     'Debitur melewati Passing Grade',
              //     style: GoogleFonts.poppins(
              //       fontSize: 15,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // if (controller.resultCrrBisnis.value < 65.0)
              //   Text(
              //     'Debitur belum melewati Passing Grade',
              //     style: GoogleFonts.poppins(
              //       fontSize: 15,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
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
                  controller.saveAnalisisBisnis();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
