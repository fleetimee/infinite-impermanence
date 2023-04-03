// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/insight_debitur_controller.dart';

class InsightDebiturProgressBar extends StatelessWidget {
  final InsightDebiturController controller;

  const InsightDebiturProgressBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Obx(
        () => controller.isDataLoading.value
            ? const GFLoader(
                type: GFLoaderType.custom,
                loaderIconOne: Text(
                  'Tunggu',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                loaderIconTwo: Text(
                  'Sebentar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            : GFProgressBar(
                percentage: double.parse(
                  controller.insightDebitur.value.progress.toString(),
                ),
                animation: true,
                animateFromLastPercentage: true,
                lineHeight: 20,
                backgroundColor: Colors.black26,
                progressBarColor: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    '${(double.parse(controller.insightDebitur.value.progress.toString()) * 100).toStringAsFixed(0)} %',
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
      ),
    );
  }
}
