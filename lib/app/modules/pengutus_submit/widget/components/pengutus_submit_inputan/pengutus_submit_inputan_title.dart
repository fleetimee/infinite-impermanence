// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class TitleAndIIndicatorResultPengutus extends StatelessWidget {
  const TitleAndIIndicatorResultPengutus({
    super.key,
    required this.controller,
  });

  final PengutusSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 6,
          child: GFTypography(
            text: 'Hasil Inputan Debitur',
            type: GFTypographyType.typo3,
            showDivider: false,
          ),
        ),
        Expanded(
          child: Obx(
            () => Icon(
              controller.isInputanRead.value == true
                  ? Icons.check_box
                  : Icons.close,
              color: controller.isInputanRead.value == true
                  ? Colors.green
                  : Colors.transparent,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
