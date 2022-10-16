// ignore_for_file: unnecessary_overrides

// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadsController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  final longtitude = TextEditingController();
  final latitude = TextEditingController();
  final alamat = TextEditingController();

  final longtitudeUsaha = TextEditingController();
  final latitudeUsaha = TextEditingController();
  final alamatUsaha = TextEditingController();

  void getImages(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2);
    } else {
      Get.snackbar(
        'Error',
        'Gagal membuka kamera',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10),
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(seconds: 2),
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    longtitude.dispose();
    latitude.dispose();
    alamat.dispose();
    longtitudeUsaha.dispose();
    latitudeUsaha.dispose();
    alamatUsaha.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
