// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_keuangan/pengutus_submit_keuangan_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusKeuanganSection extends StatelessWidget {
  const PengutusKeuanganSection({
    Key? key,
    required this.controller,
    required this.subtitleStyle,
    required this.iconDone,
    required this.iconNotYet,
    required this.buttonStyle,
  }) : super(key: key);

  final PengutusSubmitController controller;
  final TextStyle subtitleStyle;
  final Icon iconDone;
  final Icon iconNotYet;
  final TextStyle buttonStyle;

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
                    text: 'Keuangan Debitur',
                    type: GFTypographyType.typo3,
                    showDivider: false,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Icon(
                      controller.isKeuanganPressed.value == true
                          ? Icons.check_box
                          : Icons.close,
                      color: controller.isKeuanganPressed.value == true
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
              'Ini merupakan rekapan keuangan debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
              style: subtitleStyle,
            ),
            const SizedBox(height: 20),
            PengutusSubmitKeuanganButton(
              controller: controller,
              buttonStyle: buttonStyle,
              iconDone: iconDone,
              iconNotYet: iconNotYet,
            ),
          ],
        ),
      ),
    );
  }
}
