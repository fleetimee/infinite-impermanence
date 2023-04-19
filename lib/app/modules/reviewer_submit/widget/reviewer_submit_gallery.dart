// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitGallery extends StatelessWidget {
  const ReviewerSubmitGallery({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReviewerSubmitController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 6,
                    child: GFTypography(
                      text: 'Gallery Debitur',
                      type: GFTypographyType.typo3,
                      showDivider: false,
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Icon(
                        controller.isGalleryRead.value == true
                            ? Icons.check_box
                            : Icons.close,
                        color: controller.isGalleryRead.value == true
                            ? Colors.green
                            : Colors.transparent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan sekumpulan dokumen penunjang seperti foto dan dokumen lainnya yang sudah diunggah oleh tim analis',
                style: Theme.of(context).textTheme.bodySmall?.merge(
                      const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_IMAGE,
                      arguments: controller.insightDebitur.value);
                },
                text: 'Lihat Gallery',
                color: primaryColor,
                shape: GFButtonShape.pills,
                icon: const Icon(
                  Icons.image,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "     ATAU     ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GFButton(
                onPressed: () {
                  Get.toNamed(Routes.GALLERY_FILE,
                      arguments: controller.insightDebitur.value);
                },
                color: primaryColor,
                shape: GFButtonShape.pills,
                text: 'Lihat Dokumen',
                icon: const Icon(
                  Icons.picture_as_pdf,
                  size: 18,
                  color: secondaryColor,
                ),
                fullWidthButton: true,
                size: GFSize.LARGE,
              ),
              const SizedBox(height: 10),
              FormBuilderCheckbox(
                name: 'berkas',
                onChanged: (value) {
                  controller.isGalleryRead.value = value!;
                },
                initialValue: controller.isGalleryRead.value,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Saya sudah melihat berkas ini',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'Saya sudah melihat berkas ini',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
