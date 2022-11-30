import 'package:akm/app/routes/app_pages.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                        // showMaterialModalBottomSheet(
                        //   context: context,
                        //   builder: (context) => PhotoView(
                        //     imageProvider: NetworkImage(
                        //       controller.imageList[index].file!,
                        //     ),
                        //   ),
                        // );
                      },
                      child: GFListTile(
                        avatar: GFAvatar(
                          backgroundImage: NetworkImage(
                            controller.imageList[index].file!,
                          ),
                          shape: GFAvatarShape.square,
                          backgroundColor: Colors.transparent,
                        ),
                        titleText: controller.imageList[index].keterangan,
                        subTitleText: DateFormat('dd MMMM yyyy')
                            .format(controller.imageList[index].createdDate!),
                        icon: Row(
                          children: [
                            GFButton(
                              onPressed: () {
                                controller.shareNetworkImage(
                                  controller.imageList[index].file!,
                                  controller.imageList[index].keterangan!,
                                );
                              },
                              text: 'Share',
                              color: GFColors.INFO,
                              type: GFButtonType.solid,
                              size: GFSize.LARGE,
                              shape: GFButtonShape.pills,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GFButton(
                              onPressed: () async {
                                try {
                                  controller.downloadNetworkImage(
                                    controller.imageList[index].file!,
                                    controller.imageList[index].keterangan!,
                                    'AKM-${data.peminjam1}',
                                  );
                                } on Exception catch (error) {
                                  Get.snackbar('Error', error.toString());
                                }
                              },
                              text: 'Download',
                              color: GFColors.SUCCESS,
                              type: GFButtonType.solid,
                              size: GFSize.LARGE,
                              shape: GFButtonShape.pills,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => PhotoViewGallery.builder(
                              backgroundDecoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                              allowImplicitScrolling: true,
                              enableRotation: true,
                              loadingBuilder: (context, event) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              ),
                              pageController: PageController(
                                initialPage: index,
                              ),
                              scrollPhysics: const BouncingScrollPhysics(),
                              itemCount: controller.imageList.length,
                              onPageChanged: (index) {
                                controller.imageList[index].id;
                              },
                              builder: (context, index) {
                                return PhotoViewGalleryPageOptions(
                                  imageProvider: NetworkImage(
                                      controller.imageList[index].file!),
                                  heroAttributes: PhotoViewHeroAttributes(
                                    tag: controller.imageList[index].id
                                        .toString(),
                                  ),
                                );
                              },
                              // loadingBuilder: (context, event) => Container(
                              //   color: Colors.grey[200],
                              //   child: Center(
                              //     child: SizedBox(
                              //       width: 20.0,
                              //       height: 20.0,
                              //       child: CircularProgressIndicator(
                              //         value: event == null
                              //             ? 0
                              //             : event.cumulativeBytesLoaded /
                              //                 event.expectedTotalBytes!,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ),
                          );
                        },
                        child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          imageUrl: controller.imageList[index].file!,
                          shimmerBaseColor: Colors.grey[300]!,
                          shimmerHighlightColor: Colors.grey[100]!,
                        ),
                      );
                    },
                    childCount: controller.imageList.length,
                  ),
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

// GridView.builder(
//                   itemCount: controller.imageList.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                   ),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         showMaterialModalBottomSheet(
//                           context: context,
//                           builder: (context) => PhotoViewGallery.builder(
//                             pageController: PageController(
//                               initialPage: index,
//                             ),
//                             scrollPhysics: const BouncingScrollPhysics(),
//                             itemCount: controller.imageList.length,
//                             onPageChanged: (index) {
//                               controller.imageList[index].id;
//                             },
//                             builder: (context, index) {
//                               return PhotoViewGalleryPageOptions(
//                                 imageProvider: NetworkImage(
//                                     controller.imageList[index].file!),
//                                 heroAttributes: PhotoViewHeroAttributes(
//                                   tag:
//                                       controller.imageList[index].id.toString(),
//                                 ),
//                               );
//                             },
//                             loadingBuilder: (context, event) => Center(
//                               child: SizedBox(
//                                 width: 20.0,
//                                 height: 20.0,
//                                 child: CircularProgressIndicator(
//                                   value: event == null
//                                       ? 0
//                                       : event.cumulativeBytesLoaded /
//                                           event.expectedTotalBytes!,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(5),
//                         child: FancyShimmerImage(
//                           boxFit: BoxFit.cover,
//                           imageUrl: controller.imageList[index].file!,
//                         ),
//                       ),
//                     );
//                   },
//                 );