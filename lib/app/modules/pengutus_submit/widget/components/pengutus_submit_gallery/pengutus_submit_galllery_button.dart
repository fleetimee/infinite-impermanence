import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:get/get.dart';
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/routes/app_pages.dart';

class PengutusSubmitGalleryButton extends StatelessWidget {
  const PengutusSubmitGalleryButton({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(() => controller.isGalleryPhotoRead.value == true
                ? iconDone
                : iconNotYet),
            const SizedBox(width: 10),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_IMAGE,
                      arguments: controller.insightDebitur.value);

                  controller.isGalleryPhotoRead(true);
                },
                text: 'Cek Gallery',
                color: Colors.pink,
                textStyle: buttonStyle,
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
            Obx(() => controller.isGalleryDocumentRead.value == true
                ? iconDone
                : iconNotYet),
            const SizedBox(width: 10),
            Expanded(
              child: GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_FILE,
                      arguments: controller.insightDebitur.value);

                  controller.isGalleryDocumentRead(true);
                },
                color: Colors.pink,
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
        Obx(() {
          return GestureDetector(
            onTap: () {
              if (!controller.isGalleryDocumentRead.value ||
                  !controller.isGalleryPhotoRead.value) {
                ErrorDialogPink(
                  title: 'Gallery Belum Dilihat',
                  desc: 'Beberapa gallery belum dilihat, silahkan cek kembali',
                  context: context,
                  btnOkOnPress: () {},
                ).show();
              }
            },
            child: FormBuilderCheckbox(
              name: 'berkas',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              enabled: controller.isGalleryDocumentRead.value &&
                  controller.isGalleryPhotoRead.value,
              activeColor: Colors.pink,
              onChanged: (value) {
                controller.isGalleryRead.value = value!;

                if (controller.isGalleryRead.value) {
                  CustomSnackBarPink.show(context, 'Gallery sudah dilihat');
                }
              },
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
          );
        }),
      ],
    );
  }
}
