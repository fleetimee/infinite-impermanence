// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturSubmissionButton extends StatelessWidget {
  const InsightDebiturSubmissionButton({
    super.key,
    required this.controller,
  });

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isDataLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : controller.insightDebitur.value.analisaKeuangan != null &&
                  controller.insightDebitur.value.analisaAgunan != null &&
                  controller.insightDebitur.value.analisaBisnis != null &&
                  controller.insightDebitur.value.analisaJenisUsaha != null &&
                  controller.insightDebitur.value.analisaKarakter != null &&
                  controller.insightDebitur.value.syaratLain!.isNotEmpty &&
                  controller.insightDebitur.value.asuransi != null &&
                  controller.insightDebitur.value.ijinLegitimasi != null &&
                  controller.insightDebitur.value.upload!.isNotEmpty &&
                  controller.insightDebitur.value.progress == '1.0'
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: GFButton(
                      onPressed:
                          controller.insightDebitur.value.pengajuan!.isNotEmpty
                              ? () {
                                  Get.toNamed(
                                    Routes.PENGAJUAN_DETAIL,
                                    arguments: controller.insightDebitur.value
                                        .pengajuan?.first.id,
                                  );
                                }
                              : () {
                                  Get.toNamed(
                                    Routes.PENGAJUAN_SUBMIT_ANALIS,
                                    arguments: controller.insightDebitur.value,
                                  );
                                },
                      text:
                          controller.insightDebitur.value.pengajuan!.isNotEmpty
                              ? 'Sudah Kirim Pengajuan'
                              : 'Kirim Pengajuan',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      fullWidthButton: true,
                      color: primaryColor,
                      shape: GFButtonShape.pills,
                      size: 50),
                )
              : const SizedBox.shrink(),
    );
  }
}
