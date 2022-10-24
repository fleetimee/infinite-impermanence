import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisView extends GetView<AgunanAnalisisController> {
  AgunanAnalisisView({Key? key}) : super(key: key);

  final insightDebiturController = Get.put(InsightDebiturController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanAnalisisView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: // pick all list agunan
              insightDebiturController.listAgunan.isNotEmpty
                  ? GFButton(
                      onPressed: () {
                        Get.toNamed(Routes.AGUNAN_ANALISIS_CALC, arguments: [
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 1))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 1))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 2))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 2))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 3))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 3))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 4))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 4))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 5))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 5))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 6))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 6))
                          else
                            Agunan(),
                          if (insightDebiturController.listAgunan
                              .any((element) => element.kodeAgunan == 7))
                            insightDebiturController.listAgunan.elementAt(
                                insightDebiturController.listAgunan.indexWhere(
                                    (element) => element.kodeAgunan == 7))
                          else
                            Agunan(),
                          data
                        ]);
                      },
                      text: "READY",
                      buttonBoxShadow: true,
                      color: GFColors.SUCCESS,
                    )
                  : GFButton(
                      onPressed: () {
                        Get.snackbar(
                          "Error",
                          "Jenis Agunan ini tidak dipilih",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: GFColors.DANGER,
                          colorText: GFColors.WHITE,
                        );
                      },
                      text: "N/A",
                      buttonBoxShadow: true,
                      color: GFColors.DANGER,
                    ),
        ),
      ),
    );
  }
}
