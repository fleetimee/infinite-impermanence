// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/routes/app_pages.dart';

class PengutusSubmitAgunanButton extends StatelessWidget {
  const PengutusSubmitAgunanButton({
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
              () => controller.isAnalisaAgunanRead.value == true
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.AGUNAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isAnalisaAgunanRead(true);
                },
                color: Colors.pink,
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
            Obx(() => controller.isDetailAgunanRead.value == true
                ? iconDone
                : iconNotYet),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.DETAIL_AGUNAN,
                      arguments: controller.insightDebitur.value);

                  controller.isDetailAgunanRead(true);
                },
                color: Colors.pink,
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
        Obx(() => GestureDetector(
              onTap: () {
                if (!controller.isAnalisaAgunanRead.value ||
                    !controller.isDetailAgunanRead.value) {
                  ErrorDialogPink(
                    title: 'Data Agunan Belum Dilihat',
                    desc:
                        'Beberapa data agunan belum dilihat, silahkan cek kembali',
                    context: context,
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: FormBuilderRadioGroup(
                activeColor: Colors.pink,
                name: 'agunan',
                enabled: controller.isAnalisaAgunanRead.value &&
                    controller.isDetailAgunanRead.value,
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isAgunanPressed.value = true;

                  if (value == true) {
                    CustomSnackBarPink.show(
                        context, 'Agunan Debitur dinyatakan LAYAK');
                  } else {
                    CustomSnackBarPink.show(
                        context, 'Agunan Debitur dinyatakan TIDAK LAYAK');
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Apakah bisnis debitur ini layak?',
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
            )),
      ],
    );
  }
}
