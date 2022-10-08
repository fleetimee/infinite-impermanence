import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class TanahForm extends StatelessWidget {
  const TanahForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text(
        'Model',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.pagelines,
          color: secondaryColor,
        ),
      ),
      subTitleText: 'Print model bobot yang digunakan',
      icon: GFButton(
        onPressed: () {
          Get.toNamed(Routes.MODEL_PRINT,
              arguments: controller.insightDebitur.value);
        },
        text: "READY",
        buttonBoxShadow: true,
        color: GFColors.SUCCESS,
      ),
    );
  }
}
