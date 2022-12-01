import 'dart:io';

import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class GalleryImageController extends GetxController {
  @override
  void onInit() {
    getImages(debiturId.id);
    super.onInit();
  }

  var imageList = List<Upload>.empty(growable: true).obs;

  final isImageLoading = false.obs;

  final isImageListView = false.obs;

  final debiturId = Get.arguments;

  void getImages(int id) {
    try {
      isImageLoading(true);
      MediaProvider().fetchMedia(id).then((resp) {
        isImageLoading(false);
        imageList.addAll(resp);
      }, onError: (e) {
        isImageLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isImageLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void shareNetworkImage(String url, String filename) async {
    Directory tempDir = await getTemporaryDirectory();

    final path = tempDir.path;

    await Dio().download(url, '$path/$filename.jpg');

    // Share.shareFiles(['$path/$filename.jpg']);

    // convert string to XFile
    XFile file = XFile(
      '$path/$filename.jpg',
      bytes: File('$path/$filename.jpg').readAsBytesSync(),
      length: File('$path/$filename.jpg').lengthSync(),
    );

    Share.shareXFiles([file]);
  }

  void downloadNetworkImage(
      String url, String filename, String albumname) async {
    Directory tempDir = await getTemporaryDirectory();

    final path = tempDir.path;

    await Dio().download(
      url,
      '$path/$filename.jpg',
    );

    GallerySaver.saveImage('$path/$filename.jpg', albumName: albumname);

    Get.snackbar(
      'Success',
      'Image saved',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }
}
