import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:get/get.dart';
// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/routes/app_pages.dart';

class PengutusSubmitButtonResult extends StatelessWidget {
  const PengutusSubmitButtonResult({
    super.key,
    required this.controller,
    required this.iconNotYet,
    required this.iconDone,
    required this.buttonStyle,
  });

  final PengutusSubmitController controller;
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
                color: Colors.pink,
                shape: GFButtonShape.pills,
                text: 'Cek Inputan',
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
                color: Colors.pink,
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
            Obx(() => controller.isUsulanRead.value ? iconDone : iconNotYet),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.USULAN_BARU_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isUsulanRead(true);
                },
                color: Colors.pink,
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
            Obx(() => controller.isPutusanRead.value ? iconDone : iconNotYet),
            const SizedBox(width: 5),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.PUTUSAN_PRINT,
                      arguments: controller.insightDebitur.value);

                  controller.isPutusanRead(true);
                },
                color: Colors.pink,
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
        Obx(() {
          return GestureDetector(
            onTap: () {
              if (!controller.isUsulanRead.value ||
                  !controller.isPutusanRead.value ||
                  !controller.isDraftUsulanRead.value ||
                  !controller.isHasilInputanRead.value) {
                ErrorDialogPink(
                  title: 'Inputan Belum Dilihat',
                  desc: 'Beberapa inputan belum dilihat, silahkan cek kembali',
                  context: context,
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: FormBuilderCheckbox(
              name: 'inputan',
              onChanged: (value) {
                controller.isInputanRead.value = value!;

                if (controller.isInputanRead.value) {
                  CustomSnackBarPink.show(context, 'Inputan sudah dilihat');
                }
              },
              enabled: controller.isHasilInputanRead.value &&
                  controller.isPutusanRead.value &&
                  controller.isUsulanRead.value &&
                  controller.isDraftUsulanRead.value,
              initialValue: controller.isInputanRead.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              activeColor: Colors.pink,
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
          );
        }),
      ],
    );
  }
}
