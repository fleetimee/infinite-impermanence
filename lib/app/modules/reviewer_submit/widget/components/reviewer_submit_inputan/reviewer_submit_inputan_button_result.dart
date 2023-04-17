// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';

class ReviewerSubmitButtonResult extends StatelessWidget {
  const ReviewerSubmitButtonResult({
    super.key,
    required this.controller,
  });

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    Icon iconNotYet() {
      return const Icon(
        Icons.info_outline,
        color: Colors.red,
        size: 40,
      );
    }

    Icon iconDone() {
      return const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 40,
      );
    }

    TextStyle buttonStyle() {
      return const TextStyle(
        fontSize: 20,
        color: secondaryColor,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => controller.isHasilInputanRead.value
                  ? iconDone()
                  : iconNotYet(),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.INPUT_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isHasilInputanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Inputan',
                textStyle: buttonStyle(),
                size: GFSize.LARGE,
                fullWidthButton: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Obx(
              () => controller.isDraftUsulanRead.value
                  ? iconDone()
                  : iconNotYet(),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USULAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isDraftUsulanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Draft Usulan',
                textStyle: buttonStyle(),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Obx(
              () => controller.isUsulanRead.value ? iconDone() : iconNotYet(),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USULAN_BARU_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isUsulanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Draft Usulan Baru',
                textStyle: buttonStyle(),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Obx(() => controller.isDraftPutusanRead.value
                ? iconDone()
                : iconNotYet()),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.PUTUSAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isDraftPutusanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Draft Putusan',
                textStyle: buttonStyle(),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() => FormBuilderCheckbox(
              name: 'inputan',
              enabled: controller.isUsulanRead.value &&
                  controller.isDraftPutusanRead.value &&
                  controller.isDraftUsulanRead.value &&
                  controller.isHasilInputanRead.value,
              onChanged: (value) {
                controller.isInputanRead.value = value!;
              },
              initialValue: controller.isInputanRead.value,
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Saya sudah melihat inputan debitur',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              validator: FormBuilderValidators.equal(
                true,
                errorText: 'Saya sudah melihat inputan debitur',
              ),
            )),
      ],
    );
  }
}
