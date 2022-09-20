// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';

class LihatHitungCrrBisnis extends StatelessWidget {
  LihatHitungCrrBisnis({Key? key}) : super(key: key);

  final controller = Get.put(BisnisAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Total CRR: ${data.analisaBisnis.hasilCrrBisnis.toString()}',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: // Make text green if value exceed 65 and red if below 65
                      data.analisaBisnis.hasilCrrBisnis >= 50.0
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
            ],
          ),
        ),
      ),
    );
  }
}
