// 🐦 Flutter imports:
import 'package:akm/app/modules/home_reviewer/widget/components/home_reviewer_main_menu/reviewer_buttons.dart';
import 'package:akm/app/modules/home_reviewer/widget/components/home_reviewer_main_menu/reviewer_greetings.dart';
import 'package:akm/app/modules/home_reviewer/widget/components/home_reviewer_main_menu/reviewer_information.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import '../controllers/home_reviewer_controller.dart';

class ReviewerMainMenu extends StatelessWidget {
  const ReviewerMainMenu({
    super.key,
    required this.homeCtrl,
    required this.account,
    required this.controller,
  });

  final HomeController homeCtrl;
  final String account;
  final HomeReviewerController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const GFTypography(
                text: 'Reviewer Dashboard',
                fontWeight: FontWeight.bold,
                type: GFTypographyType.typo1,
                textColor: primaryColor,
                dividerColor: primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              ReviewerGreeting(
                homeCtrl: homeCtrl,
                account: account,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewerDeviceInformation(
                    homeCtrl: homeCtrl,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const ReviewerButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
