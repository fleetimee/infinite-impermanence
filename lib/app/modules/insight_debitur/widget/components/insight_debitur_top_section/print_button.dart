// 🐦 Flutter imports:
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/modules/karakter_analisis/controllers/karakter_analisis_controller.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:akm/app/modules/usaha_analisis/controllers/usaha_analisis_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/views/components/list_tile_printing.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({
    super.key,
    required this.analisaKeuanganController,
    required this.rugiLabaController,
    required this.neracaController,
    required this.analisaBisnisController,
    required this.analisaKarakterController,
    required this.analisaAgunanController,
    required this.analisaJenisUsahaController,
    required this.controller,
  });

  final KeuanganAnalisisController analisaKeuanganController;
  final RugiLabaController rugiLabaController;
  final InputNeracaController neracaController;
  final BisnisAnalisisController analisaBisnisController;
  final KarakterAnalisisController analisaKarakterController;
  final AgunanAnalisisController analisaAgunanController;
  final UsahaAnalisisController analisaJenisUsahaController;
  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: primaryColor,
      enableFeedback: true,
      onPressed: () {
        showBarModalBottomSheet(
          bounce: true,
          backgroundColor: secondaryColor,
          context: context,
          builder: (context) => SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GFCard(
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  showOverlayImage: true,
                  imageOverlay: AssetImage(
                    'assets/images/home/printing.jpg',
                  ),
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(221, 8, 8, 8),
                    BlendMode.darken,
                  ),
                  title: GFListTile(
                    title: Text(
                      'Printing Centre',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 47,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  content: Text(
                    "Print berkas berkas mu disini, tetapi jangan lupa diinput dulu",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Obx(
                        () {
                          if (analisaKeuanganController
                              .isAnalisaKeuanganProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintInput();
                          }
                        },
                      ),
                      SlikPrint(),
                      SpkkPrint(),
                      PkPrint(),
                      Obx(
                        () {
                          if (rugiLabaController.isRugiLabaProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintRugiLaba();
                          }
                        },
                      ),
                      Obx(
                        () {
                          if (neracaController.isNeracaProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintNeraca();
                          }
                        },
                      ),
                      Obx(
                        () {
                          if (analisaKeuanganController
                              .isAnalisaKeuanganProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintKeuangan();
                          }
                        },
                      ),
                      Obx(
                        () {
                          if (analisaBisnisController
                              .isAnalisaBisnisProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return BisnisPrint();
                          }
                        },
                      ),
                      Obx(() {
                        if (analisaKarakterController
                            .isAnalisaKarakterProcessing.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return KarakterPrint();
                        }
                      }),
                      Obx(() {
                        if (analisaAgunanController
                            .isAnalisaAgunanProcessing.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return PrintAgunan();
                        }
                      }),
                      Obx(
                        () {
                          if (analisaJenisUsahaController
                              .isAnalisaUsahaProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return JenisUsahaPrint();
                          }
                        },
                      ),
                      ModelPrint(controller: controller),
                      Obx(
                        () {
                          if (analisaKeuanganController
                              .isAnalisaKeuanganProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintUsulanBaru();
                          }
                        },
                      ),
                      Obx(
                        () {
                          if (analisaKeuanganController
                              .isAnalisaKeuanganProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintUsulan();
                          }
                        },
                      ),
                      Obx(
                        () {
                          if (analisaKeuanganController
                              .isAnalisaKeuanganProcessing.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return PrintPutusan();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(FontAwesomeIcons.print),
    );
  }
}
