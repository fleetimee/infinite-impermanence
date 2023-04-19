// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
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
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  });

  final ReviewerSubmitController controller;
  final Icon iconNotYet;
  final Icon iconDone;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => controller.isHasilInputanRead.value ? iconDone : iconNotYet,
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
                textStyle: buttonStyle,
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
              () => controller.isDraftUsulanRead.value ? iconDone : iconNotYet,
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
                textStyle: buttonStyle,
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
              () => controller.isUsulanRead.value ? iconDone : iconNotYet,
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
                textStyle: buttonStyle,
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
              () => controller.isDraftPutusanRead.value ? iconDone : iconNotYet,
            ),
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
                textStyle: buttonStyle,
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() => GestureDetector(
              onTap: () {
                if (!controller.isUsulanRead.value &&
                    !controller.isDraftPutusanRead.value &&
                    !controller.isDraftUsulanRead.value &&
                    !controller.isHasilInputanRead.value) {
                  ErrorDialog(
                    title: 'Inputan Belum Dilihat',
                    desc:
                        'Beberapa inputan belum dilihat, silahkan cek kembali',
                    context: context,
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: FormBuilderCheckbox(
                name: 'inputan',
                enabled: controller.isUsulanRead.value &&
                    controller.isDraftPutusanRead.value &&
                    controller.isDraftUsulanRead.value &&
                    controller.isHasilInputanRead.value,
                onChanged: (value) {
                  controller.isInputanRead.value = value!;

                  // Make snackbar
                  if (controller.isInputanRead.value == true) {
                    CustomSnackBar.show(context, 'Inputan sudah dilihat');
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                activeColor: primaryColor,
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
              ),
            )),
      ],
    );
  }
}
