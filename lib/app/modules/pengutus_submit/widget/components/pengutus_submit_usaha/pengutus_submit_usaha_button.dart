import 'package:get/get.dart';
// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/routes/app_pages.dart';

class PengutusSubmitUsahaButton extends StatelessWidget {
  const PengutusSubmitUsahaButton({
    super.key,
    required this.controller,
    required this.iconDone,
    required this.iconNotYet,
    required this.buttonStyle,
  });

  final PengutusSubmitController controller;
  final Icon iconDone;
  final Icon iconNotYet;
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
              () => controller.isAnalisaUsahaRead.value == true
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USAHA_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isAnalisaUsahaRead(true);
                },
                text: 'Cek Analisa Usaha',
                textStyle: buttonStyle,
                color: Colors.pink,
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
        Obx(() {
          return GestureDetector(
            onTap: () {
              if (!controller.isAnalisaUsahaRead.value) {
                ErrorDialogPink(
                  title: 'Analisa Usaha Belum Dibaca',
                  desc: 'Silahkan baca analisa usaha terlebih dahulu',
                  context: context,
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: FormBuilderRadioGroup(
              name: 'usaha',
              wrapAlignment: WrapAlignment.center,
              activeColor: Colors.pink,
              enabled: controller.isAnalisaUsahaRead.value,
              onChanged: (value) {
                controller.isUsahaPressed.value = true;

                if (value == true) {
                  CustomSnackBarPink.show(
                      context, 'Usaha Debitur dinyatakan LAYAK');
                } else {
                  CustomSnackBarPink.show(
                      context, 'Usaha Debitur dinyatakan TIDAK LAYAK');
                }
              },
              decoration: InputDecoration(
                labelText: 'Apakah jenis usaha debitur ini layak?',
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: promptText(Colors.transparent, context),
                border: InputBorder.none,
                alignLabelWithHint: true,
              ),
              options: [
                FormBuilderFieldOption(
                  value: true,
                  child: Text(
                    'YA',
                    style: promptTextSubtitle(Colors.transparent, context),
                  ),
                ),
                FormBuilderFieldOption(
                  value: false,
                  child: Text(
                    'TIDAK',
                    style: promptTextSubtitle(Colors.transparent, context),
                  ),
                ),
              ],
              validator: FormBuilderValidators.required(),
            ),
          );
        }),
      ],
    );
  }
}
