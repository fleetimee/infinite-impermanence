import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
      body: Obx(() => controller.isFileLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.fileList.isNotEmpty
              ? ListView.separated(
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
                          titleText:
                              '${controller.fileList[index].keterangan!}.pdf',
                          subTitleText: DateFormat('dd MMMM yyyy')
                              .format(controller.fileList[index].createdDate!),
                          icon: Row(
                            children: [
                              GFIconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  size: 15,
                                  color: GFColors.WHITE,
                                ),
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
                                            placeholder: (progress) => Center(
                                                child: Text('$progress %')),
                                            errorWidget: (error) => Center(
                                                child: Text(error.toString())),
                                          ));
                                },
                                color: GFColors.INFO,
                                size: GFSize.SMALL,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GFIconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.print,
                                  size: 15,
                                  color: GFColors.WHITE,
                                ),
                                onPressed: () {
                                  controller.printFile(
                                      controller.fileList[index].file!,
                                      controller.fileList[index].keterangan!);
                                },
                                color: GFColors.SUCCESS,
                                size: GFSize.SMALL,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GFIconButton(
                                size: GFSize.SMALL,
                                color: GFColors.DANGER,
                                icon: const Icon(
                                  Icons.share,
                                ),
                                onPressed: () {
                                  controller.shareFile(
                                    controller.fileList[index].file!,
                                    controller.fileList[index].keterangan!,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'Belum ada dokumen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Lottie.asset(
                            'assets/images/home/yeaa.zip',
                            frameRate: FrameRate.max,
                            fit: BoxFit.cover,
                            repeat: true,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'Gagal memuat animasi',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            'Belum ada dokumen yang diupload, klik button di bawah untuk upload foto',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(
            Routes.MEDIA_DOCS,
            arguments: data,
          );
        },
        child: const FaIcon(
          FontAwesomeIcons.folderPlus,
          color: GFColors.WHITE,
        ),
      ),
    );
  }
}
