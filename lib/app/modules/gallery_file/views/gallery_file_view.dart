import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/gallery_file_controller.dart';

class GalleryFileView extends GetView<GalleryFileController> {
  GalleryFileView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Manager: ${data.peminjam1}'),
      ),
      body: Obx(
        () => controller.isFileLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
                itemCount: controller.fileList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      color: GFColors.LIGHT,
                      child: GFListTile(
                        avatar: const Icon(
                          FontAwesomeIcons.filePdf,
                          color: GFColors.DANGER,
                        ),
                        titleText: controller.fileList[index].keterangan!,
                        subTitleText: DateFormat('dd MMMM yyyy')
                            .format(controller.fileList[index].createdDate!),
                        icon: GFButton(
                          onPressed: () {
                            showMaterialModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                bounce: false,
                                isDismissible: false,
                                enableDrag: false,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) => const PDF(
                                      enableSwipe: true,
                                      autoSpacing: true,
                                      pageFling: true,
                                      swipeHorizontal: true,
                                    ).cachedFromUrl(
                                      controller.fileList[index].file!,
                                      placeholder: (progress) =>
                                          Center(child: Text('$progress %')),
                                      errorWidget: (error) =>
                                          Center(child: Text(error.toString())),
                                    ));
                          },
                          text: 'Lihat',
                          color: GFColors.SUCCESS,
                          type: GFButtonType.outline2x,
                          size: GFSize.SMALL,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
