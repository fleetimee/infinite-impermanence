// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_bisnis/pengutus_submit_bisnis_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitBisnis extends StatelessWidget {
  const PengutusSubmitBisnis({
    Key? key,
    required this.controller,
    required this.iconDone,
    required this.iconNotYet,
    required this.buttonStyle,
    required this.subtitleStyle,
  }) : super(key: key);

  final PengutusSubmitController controller;
  final Icon iconDone;
  final Icon iconNotYet;
  final TextStyle buttonStyle;

  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 6,
                  child: GFTypography(
                    text: 'Bisnis Debitur',
                    type: GFTypographyType.typo3,
                    showDivider: false,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Icon(
                      controller.isBisnisPressed.value == true
                          ? Icons.check_box
                          : Icons.close,
                      color: controller.isBisnisPressed.value == true
                          ? Colors.green
                          : Colors.transparent,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Ini merupakan rekapan bisnis debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
              style: subtitleStyle,
            ),
            const SizedBox(height: 20),
            PengutusSubmitBisnisButton(
              controller: controller,
              iconDone: iconDone,
              iconNotYet: iconNotYet,
              buttonStyle: buttonStyle,
            )
          ],
        ),
      ),
    );
  }
}
