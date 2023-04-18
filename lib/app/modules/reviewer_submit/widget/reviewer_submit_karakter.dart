// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_karakter/reviewer_submit_karakter_button.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ReviewerKarakterSection extends StatelessWidget {
  const ReviewerKarakterSection({
    Key? key,
    required this.controller,
    required this.subtitleStyle,
  }) : super(key: key);

  final ReviewerSubmitController controller;
  final TextStyle subtitleStyle;

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
                      text: 'Karakter Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isKarakterPressed.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isKarakterPressed.value == true
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
                'Ini merupakan rekapan karakter debitur, pilih ya atau tidak untuk mengirim response ini ke pemutus',
                style: subtitleStyle,
              ),
              const SizedBox(height: 20),
              ReviewerSubmitKarakterButton(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
