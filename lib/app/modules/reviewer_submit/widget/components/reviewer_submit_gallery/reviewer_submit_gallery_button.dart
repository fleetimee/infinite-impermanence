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

class ReviewSubmitGalleryButton extends StatelessWidget {
  const ReviewSubmitGalleryButton({
    super.key,
    required this.controller,
    required this.iconDone,
    required this.iconNotYet,
    required this.buttonStyle,
  });

  final ReviewerSubmitController controller;
  final Icon iconDone;
  final Icon iconNotYet;
  final TextStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(
              () => controller.isGalleryPhotoRead.value ? iconDone : iconNotYet,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_IMAGE,
                      arguments: controller.insightDebitur.value);

                  controller.isGalleryPhotoRead(true);
                },
                text: 'Cek Gallery',
                textStyle: buttonStyle,
                color: primaryColor,
                shape: GFButtonShape.pills,
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
              () => controller.isGalleryDocumentRead.value
                  ? iconDone
                  : iconNotYet,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_FILE,
                      arguments: controller.insightDebitur.value);

                  controller.isGalleryDocumentRead(true);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Cek Dokumen',
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
                if (!controller.isGalleryPhotoRead.value ||
                    !controller.isGalleryDocumentRead.value) {
                  ErrorDialog(
                    context: context,
                    title: 'Perhatian',
                    desc: 'Silahkan cek gallery dan dokumen terlebih dahulu',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: FormBuilderCheckbox(
                name: 'berkas',
                enabled: controller.isGalleryPhotoRead.value &&
                    controller.isGalleryDocumentRead.value,
                onChanged: (value) {
                  controller.isGalleryRead.value = value!;

                  if (controller.isGalleryRead.value == true) {
                    CustomSnackBar.show(context, 'Berkas sudah diperiksa');
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                activeColor: primaryColor,
                initialValue: controller.isGalleryRead.value,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Saya sudah melihat berkas ini',
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
                  errorText: 'Saya sudah melihat berkas ini',
                ),
              ),
            )),
      ],
    );
  }
}
