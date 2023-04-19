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

class ReviewerSubmitKeuanganButton extends StatelessWidget {
  const ReviewerSubmitKeuanganButton({
    super.key,
    required this.controller,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  });

  final Icon iconNotYet;
  final Icon iconDone;
  final TextStyle buttonStyle;
  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => controller.isLaporanKeuanganRead.value
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.RUGILABA_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isLaporanKeuanganRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Laporan Keuangan',
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
              () => controller.isKeteranganNeracaRead.value
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.NERACA_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isKeteranganNeracaRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Keterangan Neraca',
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
              () => controller.isAnalisaKeuanganRead.value
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.KEUANGAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isAnalisaKeuanganRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Analisa Keuangan',
                textStyle: buttonStyle,
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Obx(
            () => GestureDetector(
              onTap: () {
                if (!controller.isLaporanKeuanganRead.value ||
                    !controller.isAnalisaKeuanganRead.value ||
                    !controller.isKeteranganNeracaRead.value) {
                  ErrorDialog(
                    title: 'Keuangan Belum Dilihat',
                    desc:
                        'Beberapa keuangan belum dilihat, silahkan cek kembali',
                    context: context,
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: FormBuilderRadioGroup(
                enabled: controller.isLaporanKeuanganRead.value &&
                    controller.isAnalisaKeuanganRead.value &&
                    controller.isKeteranganNeracaRead.value,
                name: 'keuangan',
                wrapAlignment: WrapAlignment.center,
                onChanged: (value) {
                  // if clicked then change isPressed to true
                  controller.isKeuanganPressed.value = true;

                  if (value == true) {
                    CustomSnackBar.show(
                        context, 'Keuangan Debitur dinyatakan LAYAK');
                  } else {
                    CustomSnackBar.show(
                        context, 'Keuangan Debitur dinyatakan TIDAK LAYAK');
                  }
                },
                activeColor: primaryColor,
                decoration: InputDecoration(
                  labelText: 'Apakah keuangan debitur ini layak?',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelStyle: Theme.of(context).textTheme.bodySmall!.merge(
                        const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                ),
                options: [
                  FormBuilderFieldOption(
                    value: true,
                    child: Text(
                      'YA',
                      style: Theme.of(context).textTheme.bodySmall!.merge(
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: false,
                    child: Text(
                      'TIDAK',
                      style: Theme.of(context).textTheme.bodySmall!.merge(
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                    ),
                  ),
                ],
                validator: FormBuilderValidators.required(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
