// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';

class ReviewerSubmitUsahaButton extends StatelessWidget {
  const ReviewerSubmitUsahaButton({
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
            Obx(() => controller.isAnalisisUsahaRead.value == true
                ? iconDone
                : iconNotYet),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USAHA_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isAnalisisUsahaRead(true);
                },
                text: 'Cek Analisa Usaha',
                textStyle: buttonStyle,
                color: primaryColor,
                shape: GFButtonShape.pills,
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() => FormBuilderRadioGroup(
              name: 'usaha',
              enabled: controller.isAnalisisUsahaRead.value,
              wrapAlignment: WrapAlignment.center,
              onChanged: (value) {
                // if clicked then change isPressed to true
                controller.isUsahaPressed.value = true;
              },
              decoration: InputDecoration(
                labelText: 'Apakah jenis usaha debitur ini layak?',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: promptText(
                    controller.isAnalisisUsahaRead.value
                        ? Colors.transparent
                        : Colors.grey[400]!,
                    context),
                border: InputBorder.none,
                alignLabelWithHint: true,
              ),
              options: [
                FormBuilderFieldOption(
                  value: true,
                  child: Text(
                    'YA',
                    style: promptTextSubtitle(
                        controller.isAnalisisUsahaRead.value
                            ? Colors.transparent
                            : Colors.grey[400]!,
                        context),
                  ),
                ),
                FormBuilderFieldOption(
                  value: false,
                  child: Text(
                    'TIDAK',
                    style: promptTextSubtitle(
                        controller.isAnalisisUsahaRead.value
                            ? Colors.transparent
                            : Colors.grey[400]!,
                        context),
                  ),
                ),
              ],
              validator: FormBuilderValidators.required(),
            )),
      ],
    );
  }
}
