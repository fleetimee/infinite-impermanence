// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapView extends GetView<SimulasiTetapController> {
  const SimulasiTetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      appBar: AppBar(
        title: const Text('Simulasi Angsuran Tetap'),
      ),
      body: FormBuilder(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            color: Colors.white.withOpacity(0.9),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Animate(
                        effects: const [FadeEffect(), ScaleEffect()],
                        child: Text('Berapa plafon kredit yang akan diajukan ?',
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Animate(
                        effects: const [],
                        child: FormBuilderTextField(
                          name: 'plafon',
                          controller: controller.plafon,
                          style: GoogleFonts.poppins(
                            color: secondaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Isi disini... (angka dalam rp)',
                            hintStyle: TextStyle(
                              color: secondaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w200,
                            ),
                            // disable underline
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        'Berapa lama tenor yang akan diajukan ?',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderTextField(
                        name: 'tenor',
                        controller: controller.tenor,
                        style: GoogleFonts.poppins(
                          color: secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Isi disini... (angka dlm bulan)',
                          hintStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          // disable underline
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Berapa bunga per tahun nya ?',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderTextField(
                        name: 'bunga',
                        controller: controller.bunga,
                        style: GoogleFonts.poppins(
                          color: secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Isi disini... (angka dalam %)',
                          hintStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          // disable underline
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                controller.hitung();
                              },
                              child: const Text(
                                "Cek Angsuran",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Hasilnya :',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderTextField(
                        name: 'hasil',
                        enabled: false,
                        controller: controller.hasil,
                        style: GoogleFonts.poppins(
                          color: secondaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Hasilnya disini...',
                          hintStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          // disable underline
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Jadi :',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FormBuilderTextField(
                        name: 'hasil2',
                        enabled: false,
                        controller: controller.hasil2,
                        style: GoogleFonts.poppins(
                          color: secondaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: 'Hasilnya disini...',
                          hintStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          // disable underline
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
