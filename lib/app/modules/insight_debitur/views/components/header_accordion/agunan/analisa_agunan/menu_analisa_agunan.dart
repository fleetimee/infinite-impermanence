// ignore_for_file: prefer_is_empty

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class MenuAnalisaAgunan extends StatelessWidget {
  MenuAnalisaAgunan({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final analisaAgunanController = Get.put(AgunanAnalisisController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: GFAccordion(
          titleChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Analisa Agunan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Obx(
                () {
                  if (analisaAgunanController.isAnalisaAgunanProcessing.value) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    if (controller.insightDebitur.value.analisaAgunan == null) {
                      return Row(
                        children: const [
                          Text(
                            'Belum di-input',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.red,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sudah di-input',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Obx(
                () {
                  if (analisaAgunanController.isAnalisaAgunanProcessing.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Row(
                      children: [
                        controller.insightDebitur.value.inputKeuangan == null
                            ? Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Get.snackbar('Error', 'Dibilangin batu',
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white);
                                  },
                                  child: const Text(
                                    "Input Keuangan terlebih dahulu",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            : controller.insightDebitur.value.agunan?.isEmpty ==
                                    true
                                ? Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                      ),
                                      onPressed: () {
                                        Get.snackbar('Error', 'Dibilangin batu',
                                            backgroundColor: Colors.redAccent,
                                            colorText: Colors.white);
                                      },
                                      child: const Text(
                                        "Pilih Agunan terlebih dahulu",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                : controller.insightDebitur.value
                                            .analisaAgunan ==
                                        null
                                    ? Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey,
                                          ),
                                          onPressed: () {
                                            Get.toNamed(Routes.AGUNAN_ANALISIS,
                                                arguments: controller
                                                    .insightDebitur.value);
                                          },
                                          child: const Text(
                                            "Input",
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.blueGrey,
                                                ),
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes
                                                          .LIHAT_AGUNAN_ANALISIS,
                                                      arguments: controller
                                                          .insightDebitur
                                                          .value);
                                                },
                                                child: const Text(
                                                  "Lihat",
                                                  style: TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
          collapsedIcon: const Icon(Icons.add),
          expandedIcon: const Icon(Icons.minimize)),
    );
  }
}
