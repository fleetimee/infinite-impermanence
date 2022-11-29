import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';

import '../controllers/gallery_image_controller.dart';

class GalleryImageView extends GetView<GalleryImageController> {
  GalleryImageView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery: ${data.peminjam1}'),
        centerTitle: true,
        actions: [
          Obx(() => PopupMenuButton(
                icon: controller.isImageListView.value
                    ? const Icon(
                        // gridview icon
                        Icons.list,
                      )
                    : const Icon(
                        // listview icon
                        Icons.grid_view,
                      ),
                itemBuilder: (_) {
                  return [
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          controller.isImageListView.toggle();
                          // Get.toNamed(Routes.GALLERY_IMAGE, arguments: data);
                        },
                        child: controller.isImageListView.value
                            ? const Text('Grid view')
                            : const Text('List view'),
                      ),
                    ),
                  ];
                },
              ))
        ],
      ),
      body: Obx(() {
        if (controller.isImageLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return controller.isImageListView.value
              ? ListView.builder(
                  itemCount: controller.imageList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => PhotoView(
                            imageProvider: NetworkImage(
                              controller.imageList[index].file!,
                            ),
                          ),
                        );
                      },
                      child: GFListTile(
                        avatar: GFAvatar(
                          backgroundImage: NetworkImage(
                            controller.imageList[index].file!,
                          ),
                          shape: GFAvatarShape.square,
                        ),
                        titleText: controller.imageList[index].keterangan,
                        subTitleText: DateFormat('dd MMMM yyyy')
                            .format(controller.imageList[index].createdDate!),
                        // description: GFButton(
                        //   onPressed: () async {
                        //     try {
                        //       var imageId = await ImageDownloader.downloadImage(
                        //         controller.imageList[index].file!,
                        //       );
                        //       if (imageId == null) {
                        //         return;
                        //       }
                        //       var filename =
                        //           await ImageDownloader.findName(imageId);
                        //       var path =
                        //           await ImageDownloader.findPath(imageId);
                        //       var size =
                        //           await ImageDownloader.findByteSize(imageId);
                        //       var mimeType =
                        //           await ImageDownloader.findMimeType(imageId);
                        //       Get.snackbar('Success', 'Image downloaded');
                        //     } on Exception catch (error) {
                        //       Get.snackbar('Error', error.toString());
                        //     }
                        //   },
                        //   text: 'Download',
                        //   color: Colors.red,
                        //   type: GFButtonType.outline,
                        // ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  itemCount: controller.imageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => PhotoView(
                            imageProvider: NetworkImage(
                              controller.imageList[index].file!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Image.network(
                          controller.imageList[index].file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.MEDIA, arguments: data);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
