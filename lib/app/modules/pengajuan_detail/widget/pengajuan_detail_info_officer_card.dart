// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../insight_debitur/widget/insight_debitur_detail_debitur.dart';
import '../controllers/pengajuan_detail_controller.dart';

class DetailPengajuanOfficerInfo extends StatelessWidget {
  const DetailPengajuanOfficerInfo({
    super.key,
    required this.controller,
  });

  final PengajuanDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Column(
          children: [
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.40),
                    1: FlexColumnWidth(0.60),
                  },
                  children: [
                    TableRow(
                      children: [
                        paddedText('Nama Analis'),
                        paddedText(controller.isPenganjuanDetailLoading.value
                            ? 'Loading...'
                            : controller
                                .pengajuanDetail.value.user![0].displayName!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.40),
                    1: FlexColumnWidth(0.60),
                  },
                  children: [
                    TableRow(
                      children: [
                        paddedText('Nama Reviewer'),
                        paddedText(controller.isPenganjuanDetailLoading.value
                            ? 'Loading...'
                            : controller.pengajuanDetail.value.user!.length < 2
                                ? '-'
                                : controller.pengajuanDetail.value.user![1]
                                    .displayName!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 70, bottom: 10, top: 10),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.40),
                    1: FlexColumnWidth(0.60),
                  },
                  children: [
                    TableRow(
                      children: [
                        paddedText('Nama Pemutus'),
                        paddedText(controller.isPenganjuanDetailLoading.value
                            ? 'Loading...'
                            : controller.pengajuanDetail.value.user!.length < 3
                                ? '-'
                                : controller.pengajuanDetail.value.user![2]
                                    .displayName!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
