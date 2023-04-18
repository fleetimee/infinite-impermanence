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

class ReviewerSubmitKarakterButton extends StatelessWidget {
  const ReviewerSubmitKarakterButton({
    super.key,
    required this.controller,
  });

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GFButton(
          onPressed: () {
            Get.toNamed(Routes.KARAKTER_PRINT,
                arguments: controller.insightDebitur.value);
          },
          text: 'Lihat Summary Karakter',
          color: primaryColor,
          shape: GFButtonShape.pills,
          icon: const Icon(
            Icons.summarize,
            size: 18,
            color: secondaryColor,
          ),
          fullWidthButton: true,
          size: GFSize.LARGE,
        ),
        const SizedBox(height: 10),
        FormBuilderRadioGroup(
          name: 'karakter',
          wrapAlignment: WrapAlignment.center,
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelStyle: Theme.of(context).textTheme.bodySmall!.merge(
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            border: InputBorder.none,
            alignLabelWithHint: true,
            label: const Text('Apakah karakter debitur ini layak?'),
          ),
          options: const [
            FormBuilderFieldOption(
              value: true,
              child: Text('👍 Ya'),
            ),
            FormBuilderFieldOption(
              value: false,
              child: Text('👎 Tidak'),
            ),
          ],
          onChanged: (value) {
            controller.isKarakterPressed.value = true;
          },
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
