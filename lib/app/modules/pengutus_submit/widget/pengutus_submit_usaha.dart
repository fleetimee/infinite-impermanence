// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_usaha/pengutus_submit_usaha_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitUsaha extends StatelessWidget {
  const PengutusSubmitUsaha({
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
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 6,
                  child: GFTypography(
                    text: 'Jenis Usaha Debitur',
                    type: GFTypographyType.typo3,
                    showDivider: false,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Icon(
                      controller.isUsahaPressed.value == true
                          ? Icons.check_box
                          : Icons.close,
                      color: controller.isUsahaPressed.value == true
                          ? Colors.green
                          : Colors.transparent,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ini merupakan rekapan jenis usaha debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
              style: subtitleStyle,
            ),
            const SizedBox(height: 20),
            PengutusSubmitUsahaButton(
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
