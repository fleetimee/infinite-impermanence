// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';

class ReviewerAgunanSectionButton extends StatelessWidget {
  const ReviewerAgunanSectionButton({
    super.key,
    required this.controller,
    required this.iconNotyet,
    required this.iconDone,
    required this.buttonStyle,
  });

  final ReviewerSubmitController controller;
  final Icon iconNotyet;
  final Icon iconDone;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    TextStyle promptText(Color backgroundColor, BuildContext context) {
      return Theme.of(context).textTheme.bodySmall!.merge(
            TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              backgroundColor: backgroundColor,
            ),
          );
    }

    TextStyle promptTextSubtitle(Color backgroundColor, BuildContext context) {
      return Theme.of(context).textTheme.bodySmall!.merge(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              backgroundColor: backgroundColor,
            ),
          );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => controller.isAnalisaAgunanRead.value == false
                  ? iconNotyet
                  : iconDone,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.AGUNAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isAnalisaAgunanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Analisa Agunan',
                textStyle: buttonStyle,
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Obx(
              () => controller.isDetailAgunanRead.value == false
                  ? iconNotyet
                  : iconDone,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.DETAIL_AGUNAN,
                      arguments: controller.insightDebitur.value);

                  controller.isDetailAgunanRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Detail Agunan',
                textStyle: buttonStyle,
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => GestureDetector(
            onTap: () {
              if (!controller.isDetailAgunanRead.value &&
                  !controller.isAnalisaAgunanRead.value) {
                ErrorDialog(
                  title: 'Perhatian',
                  desc:
                      'Silahkan cek detail agunan dan analisa agunan terlebih dahulu',
                  context: context,
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: FormBuilderRadioGroup(
              name: 'agunan',
              enabled: controller.isDetailAgunanRead.value &&
                  controller.isAnalisaAgunanRead.value,
              wrapAlignment: WrapAlignment.center,
              onChanged: (value) {
                // if clicked then change isPressed to true
                controller.isAgunanPressed.value = true;

                if (value == true) {
                  CustomSnackBar.show(
                      context, 'Agunan debitur ini dinyatakan LAYAK');
                } else {
                  CustomSnackBar.show(
                      context, 'Agunan debitur ini dinyatakan TIDAK LAYAK');
                }
              },
              decoration: InputDecoration(
                labelText: 'Apakah agunan debitur ini layak?',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: promptText(Colors.transparent, context),
                border: InputBorder.none,
                alignLabelWithHint: true,
              ),
              options: [
                FormBuilderFieldOption(
                  value: true,
                  child: Text('YA',
                      style: promptTextSubtitle(Colors.transparent, context)),
                ),
                FormBuilderFieldOption(
                  value: false,
                  child: Text('TIDAK',
                      style: promptTextSubtitle(Colors.transparent, context)),
                ),
              ],
              validator: FormBuilderValidators.required(),
            ),
          ),
        ),
      ],
    );
  }
}
