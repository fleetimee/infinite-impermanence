// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_bisnis/reviewer_submit_bisnis_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerBisnisSection extends StatelessWidget {
  const ReviewerBisnisSection({
    Key? key,
    required this.controller,
    required this.subtitleStyle,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  }) : super(key: key);

  final ReviewerSubmitController controller;
  final TextStyle subtitleStyle;
  final Icon iconNotYet;
  final Icon iconDone;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
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
                  style: subtitleStyle),
              const SizedBox(
                height: 20,
              ),
              ReviewerSubmitBisnisButton(
                controller: controller,
                iconDone: iconDone,
                iconNotYet: iconNotYet,
                buttonStyle: buttonStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
