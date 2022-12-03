import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
        actions: [
          Obx(() => PopupMenuButton(
                icon: controller.isImageListView.value
                    ? const Icon(
                        // gridview icon
                        Icons.view_list,
                      )
                    : const Icon(
                        // listview icon
                        Icons.grid_view,
                      ),
                itemBuilder: (_) {
                  return [
                    CheckedPopupMenuItem(
                      value: 1,
                      checked: controller.isImageListView.value,
                      child: const Text('List View'),
                    ),
                    CheckedPopupMenuItem(
                      value: 2,
                      checked: !controller.isImageListView.value,
                      child: const Text('Grid View'),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 1) {
                    controller.isImageListView.value = true;
                  } else {
                    controller.isImageListView.value = false;
                  }
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
          if (controller.imageList.isNotEmpty) {
            return controller.isImageListView.value
                ? ListView.builder(
                    itemCount: controller.imageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Card(
                            color: GFColors.LIGHT,
                            child: GFListTile(
                              // avatar: GFAvatar(
                              //   backgroundImage: NetworkImage(
                              //     controller.imageList[index].file!,
                              //   ),
                              //   shape: GFAvatarShape.square,
                              //   backgroundColor: Colors.transparent,
                              // ),
                              avatar: CircleAvatar(
                                child: CachedNetworkImage(
                                  imageUrl: controller.imageList[index].file!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              titleText: controller.imageList[index].keterangan,
                              subTitleText: DateFormat('dd MMMM yyyy').format(
                                  controller.imageList[index].createdDate!),
                              icon: Row(
                                children: [
                                  GFButton(
                                    icon: const Icon(
                                      Icons.share,
                                      color: GFColors.WHITE,
                                    ),
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
                                    icon: const Icon(
                                      Icons.download,
                                      color: GFColors.WHITE,
                                    ),
                                    onPressed: () async {
                                      try {
                                        controller.downloadNetworkImage(
                                          controller.imageList[index].file!,
                                          controller
                                              .imageList[index].keterangan!,
                                          'AKM-${data.peminjam1}',
                                        );
                                      } on Exception catch (error) {
                                        Get.snackbar('Error', error.toString());
                                      }
                                    },
                                    text: 'D/L',
                                    color: GFColors.SUCCESS,
                                    type: GFButtonType.solid,
                                    size: GFSize.LARGE,
                                    shape: GFButtonShape.pills,
                                  ),
                                ],
                              ),
                            ),
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
                                  loadingBuilder: (context, event) => Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                      value: event == null
                                          ? 0
                                          : event.cumulativeBytesLoaded /
                                              event.expectedTotalBytes!,
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
                            child: Container(
                              color: GFColors.LIGHT,
                              // child: Image.network(
                              //   controller.imageList[index].file!,
                              //   fit: BoxFit.cover,
                              // ),
                              child: CachedNetworkImage(
                                imageUrl: controller.imageList[index].file!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ));
                      },
                      childCount: controller.imageList.length,
                    ),
                  );
          } else {
            return Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Belum ada foto',
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
                        'assets/images/home/404.zip',
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
                        'Belum ada foto yang diupload, klik button di bawah untuk upload foto',
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
            );
          }
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        heroTag: 'btn1',
        onPressed: () {
          Get.toNamed(
            Routes.MEDIA,
            arguments: data,
          );
        },
        child: const Icon(
          Icons.add_photo_alternate_outlined,
        ),
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