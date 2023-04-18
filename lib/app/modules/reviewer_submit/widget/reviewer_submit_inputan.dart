// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_inputan/reviewer_submit_inputan_button_result.dart';
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_inputan/reviewer_submit_inputan_carousel.dart';
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_inputan/reviewer_submit_inputan_indicator_and_title.dart';
import 'package:akm/app/modules/reviewer_submit/widget/components/reviewer_submit_inputan/reviewer_submit_inputan_scoring.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import '../controllers/reviewer_submit_controller.dart';

class ResultInputSection extends StatelessWidget {
  final ReviewerSubmitController controller;
  final Icon iconNotYet;
  final Icon iconDone;
  final TextStyle buttonStyle;

  const ResultInputSection({
    super.key,
    required this.controller,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = TextStyle(
      fontSize: 18,
      color: Colors.grey[600],
    );

    return Container(
      color: Colors.grey[200],
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndIndicatorResult(
                controller: controller,
              ),
              const SizedBox(height: 10),
              Text(
                  'Ini merupakan hasil inputan debitur yang telah diinputkan oleh analis, dan akan di review oleh anda sebagai reviewer.',
                  style: subtitleStyle),
              const SizedBox(height: 10),
              Scoring(
                controller: controller,
              ),
              const SizedBox(height: 5),
              ReviewerSubmitCarousel(
                controller: controller,
              ),
              const SizedBox(height: 20),
              ReviewerSubmitButtonResult(
                iconDone: iconDone,
                iconNotYet: iconNotYet,
                buttonStyle: buttonStyle,
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
