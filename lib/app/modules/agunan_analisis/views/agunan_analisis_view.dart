// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisView extends GetView<AgunanAnalisisController> {
  AgunanAnalisisView({Key? key}) : super(key: key);

  final insightDebiturController = Get.put(InsightDebiturController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Agunan'),
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(16),
      //   child: Center(
      //     child: // pick all list agunan
      //         insightDebiturController.listAgunan.isNotEmpty
      //             ? GFButton(
      //                 onPressed: () {
      //                   Get.toNamed(Routes.AGUNAN_ANALISIS_CALC, arguments: [
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 1))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 1))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 2))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 2))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 3))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 3))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 4))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 4))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 5))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 5))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 6))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 6))
      //                     else
      //                       Agunan(),
      //                     if (insightDebiturController.listAgunan
      //                         .any((element) => element.kodeAgunan == 7))
      //                       insightDebiturController.listAgunan.elementAt(
      //                           insightDebiturController.listAgunan.indexWhere(
      //                               (element) => element.kodeAgunan == 7))
      //                     else
      //                       Agunan(),
      //                     data
      //                   ]);
      //                 },
      //                 text: "READY",
      //                 buttonBoxShadow: true,
      //                 color: GFColors.SUCCESS,
      //               )
      //             : GFButton(
      //                 onPressed: () {
      //                   Get.snackbar(
      //                     "Error",
      //                     "Jenis Agunan ini tidak dipilih",
      //                     snackPosition: SnackPosition.TOP,
      //                     backgroundColor: GFColors.DANGER,
      //                     colorText: GFColors.WHITE,
      //                   );
      //                 },
      //                 text: "N/A",
      //                 buttonBoxShadow: true,
      //                 color: GFColors.DANGER,
      //               ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Animate(
                    child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Image.asset(
                      'assets/images/home/bannerr.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 200,
                    )
                        .animate()
                        .fadeIn() // uses `Animate.defaultDuration`
                        .scale() // inherits duration from fadeIn
                        .move(delay: 300.ms, duration: 600.ms),
                  ),
                ) // runs after the above w/new duration
                    // inherits the delay & duration from move,
                    ),

                const SizedBox(
                  height: 20.0,
                ),
                // FormBuilderTextField(
                //   name: 'crr_jenis_usaha',
                //   enabled: false,
                //   controller: controller.crrJenisUsaha =
                //       TextEditingController(
                //     text: data.analisaJenisUsaha.totalCrrUsaha.toString(),
                //   ),
                //   decoration: const InputDecoration(
                //       labelText: 'CRR Jenis Usaha',
                //       border: OutlineInputBorder()),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            GFButton(
              onPressed: () {
                Get.toNamed(Routes.AGUNAN_ANALISIS_CALC, arguments: [
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 1))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 1))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 2))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 2))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 3))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 3))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 4))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 4))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 5))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 5))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 6))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 6))
                  else
                    Agunan(),
                  if (insightDebiturController.listAgunan
                      .any((element) => element.kodeAgunan == 7))
                    insightDebiturController.listAgunan.elementAt(
                        insightDebiturController.listAgunan
                            .indexWhere((element) => element.kodeAgunan == 7))
                  else
                    Agunan(),
                  data
                ]);
              },
              text: 'Mulai Hitung',
              color: primaryColor,
              size: GFSize.LARGE,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
