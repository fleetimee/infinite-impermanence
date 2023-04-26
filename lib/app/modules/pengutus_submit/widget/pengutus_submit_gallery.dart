import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_gallery/pengutus_submit_galllery_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';

class PengutusSubmitGallery extends StatelessWidget {
  const PengutusSubmitGallery({
    Key? key,
    required this.controller,
    required this.iconDone,
    required this.iconNotYet,
    required this.subtitleStyle,
    required this.buttonStyle,
  }) : super(key: key);

  final PengutusSubmitController controller;
  final Icon iconDone;
  final Icon iconNotYet;
  final TextStyle subtitleStyle;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 6,
                  child: GFTypography(
                    text: 'Gallery Debitur',
                    type: GFTypographyType.typo3,
                    showDivider: false,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Icon(
                      controller.isGalleryRead.value == true
                          ? Icons.check_box
                          : Icons.close,
                      color: controller.isGalleryRead.value == true
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
              'Ini merupakan sekumpulan dokumen penunjang seperti foto dan dokumen lainnya yang sudah diunggah oleh tim analis',
              style: subtitleStyle,
            ),
            const SizedBox(height: 20),
            PengutusSubmitGalleryButton(
              controller: controller,
              iconDone: iconDone,
              iconNotYet: iconNotYet,
              buttonStyle: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
