import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../controllers/simulasi_tetap_controller.dart';

class SimulasiTetapView extends GetView<SimulasiTetapController> {
  const SimulasiTetapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulasi Angsuran Tetap'),
      ),
      body: FormBuilder(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 1250,
                    width: double.infinity,
                    child: WaveWidget(
                      config: CustomConfig(
                        colors: _colors,
                        durations: _durations,
                        heightPercentages: _heightPercentages,
                      ),
                      backgroundColor: _backgroundColor,
                      size: const Size(double.infinity, double.infinity),
                      waveAmplitude: 0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Animate(
                          effects: const [FadeEffect(), ScaleEffect()],
                          child:
                              Text('Berapa plafon kredit yang akan diajukan ?',
                                  style: GoogleFonts.poppins(
                                    color: secondaryColor,
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
                            color: secondaryColor,
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
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Isi disini... (angka dalam %)',
                            hintStyle: TextStyle(
                              color: primaryColor,
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
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
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
                            color: primaryColor,
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
                            color: primaryColor,
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const _backgroundColor = primaryColor;

  static const _colors = [
    Colors.white70,
    Colors.white54,
    Colors.white30,
    Colors.white24,
  ];

  static const _durations = [100000, 200000, 500000, 100000];

  static const _heightPercentages = [0.25, 0.26, 0.28, 0.31];
}
