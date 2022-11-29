import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        title: const Text('Gallery View'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isImageLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            itemCount: controller.imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return PhotoView(
                          imageProvider: NetworkImage(
                            controller.imageList[index].file!,
                          ),
                        );
                      });
                },
                child: Card(
                  child: Image.network(
                    controller.imageList[index].file.toString(),
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
