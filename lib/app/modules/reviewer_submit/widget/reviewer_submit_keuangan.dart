// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_keuangan.dart/reviewer_submit_keuangan_buttons.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerKeuanganSection extends StatelessWidget {
  const ReviewerKeuanganSection({
    Key? key,
    required this.controller,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  }) : super(key: key);

  final ReviewerSubmitController controller;
  final Icon iconNotYet;
  final Icon iconDone;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle() {
      return TextStyle(
        fontSize: 18,
        color: Colors.grey[600],
      );
    }

    return Container(
      color: Colors.grey[200],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
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
                style: subtitleStyle(),
              ),
              const SizedBox(height: 20),
              ReviewerSubmitKeuanganButton(
                controller: controller,
                iconDone: iconDone,
                iconNotYet: iconNotYet,
                buttonStyle: buttonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
