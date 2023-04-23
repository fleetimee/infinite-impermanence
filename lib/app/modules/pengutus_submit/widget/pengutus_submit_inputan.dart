// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_inputan/pengutus_submit_inputan_button.dart';
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_inputan/pengutus_submit_inputan_carousel.dart';
import 'package:akm/app/modules/pengutus_submit/widget/components/pengutus_submit_inputan/pengutus_submit_inputan_title.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import '../controllers/pengutus_submit_controller.dart';
import 'components/pengutus_submit_inputan/pengutus_submit_inputan_scoring.dart';

class PengutusResultInputSection extends StatelessWidget {
  const PengutusResultInputSection({
    super.key,
    required this.controller,
    required this.subtitleStyle,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  });

  final PengutusSubmitController controller;
  final TextStyle subtitleStyle;
  final Icon iconNotYet;
  final Icon iconDone;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndIIndicatorResultPengutus(
              controller: controller,
            ),
            const SizedBox(height: 10),
            Text(
              'Ini merupakan hasil inputan debitur yang telah diinputkan oleh analis, dan akan di review oleh anda sebagai reviewer.',
              style: subtitleStyle,
            ),
            const SizedBox(height: 10),
            PengutusInputanScoring(
              controller: controller,
            ),
            const SizedBox(height: 5),
            PengutusSubmitCarousel(
              controller: controller,
            ),
            const SizedBox(height: 20),
            PengutusSubmitButtonResult(
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
