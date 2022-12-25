import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitView extends GetView<ReviewerSubmitController> {
  const ReviewerSubmitView({Key? key}) : super(key: key);

  String formatDatetime(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GFTypography(
                  text: 'Review Pengajuan',
                  type: GFTypographyType.typo1,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Text(
                    controller.isProcessing.value
                        ? 'Loading...'
                        : 'Pengajuan ini berisikan calon debitur dengan nama ${controller.insightDebitur.value.peminjam1}, dengan no pengajuan ${controller.pengajuan.id} yang diajukan pada tanggal ${formatDatetime(controller.pengajuan.tglSubmit!)} oleh analis Novian',
                    style: Theme.of(context).textTheme.caption?.merge(
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Berikut adalah detail pengajuan yang diajukan :',
                  style: Theme.of(context).textTheme.caption?.merge(
                        const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.grey[200],
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const GFTypography(
                            text: 'Gallery Debitur',
                            type: GFTypographyType.typo3,
                            showDivider: false,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Ini merupakan sekumpulan dokumen penunjang seperti foto dan dokumen lainnya yang sudah diunggah oleh tim analis',
                            style: Theme.of(context).textTheme.caption?.merge(
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
                            icon: const Icon(
                              Icons.image,
                              size: 18,
                              color: secondaryColor,
                            ),
                            fullWidthButton: true,
                            size: GFSize.LARGE,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
