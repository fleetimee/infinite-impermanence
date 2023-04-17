// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class Scoring extends StatelessWidget {
  final ReviewerSubmitController controller;

  /// This is for scoring UI in [ReviewerSubmitInputan]
  /// the score taken from the controller
  /// [ReviewerSubmitController]
  const Scoring({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.isProcessing.value
                  ? 'Loading'
                  : controller.insightDebitur.value.peminjam1!,
              style: Theme.of(context).textTheme.bodySmall?.merge(
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Rating',
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: GFColors.SUCCESS,
                        ),
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  controller.isProcessing.value
                      ? 'Loading'
                      : ': ${controller.rating.value} - ${controller.keterangan.value}',
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Score ',
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: GFColors.SUCCESS,
                        ),
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  controller.isProcessing.value
                      ? 'Loading'
                      : ': ${controller.totalCrr.value}',
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 5),
                Obx(
                  () => controller.isProcessing.value
                      ? const Chip(
                          label: Text(
                            'Loading...',
                          ),
                        )
                      : Chip(
                          label: Text(controller.insightDebitur.value.jenisUsaha
                              .toString())),
                ),
                const SizedBox(width: 5),
                Obx(
                  () => controller.isProcessing.value
                      ? const Chip(label: Text('Loading...'))
                      : controller.insightDebitur.value.inputRugiLaba == null
                          ? const SizedBox.shrink()
                          : double.parse(controller
                                      .insightDebitur.value.inputRugiLaba!.omzet
                                      .toString()) <=
                                  100000000
                              ? const Chip(
                                  label: Text(
                                    'Mikro',
                                  ),
                                )
                              : const Chip(
                                  label: Text(
                                    'Kecil',
                                  ),
                                ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Chip(
                  label: Text(
                    'Tetap',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Obx(
                  () => controller.isProcessing.value
                      ? const Chip(label: Text('Loading...'))
                      : controller.insightDebitur.value.inputKeuangan == null
                          ? const SizedBox.shrink()
                          : double.parse(controller.insightDebitur.value.inputKeuangan!.kreditDiusulkan.toString()) >
                                      0 &&
                                  double.parse(controller.insightDebitur.value
                                          .inputKeuangan!.kreditDiusulkan
                                          .toString()) <=
                                      10000000
                              ? const Chip(label: Text('KUR Super Mikro'))
                              : double.parse(controller.insightDebitur.value
                                              .inputKeuangan!.kreditDiusulkan
                                              .toString()) >
                                          10000000 &&
                                      double.parse(controller
                                              .insightDebitur
                                              .value
                                              .inputKeuangan!
                                              .kreditDiusulkan
                                              .toString()) <=
                                          100000000
                                  ? const Chip(label: Text('KUR Mikro'))
                                  : const Chip(label: Text('KUR Kecil')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
