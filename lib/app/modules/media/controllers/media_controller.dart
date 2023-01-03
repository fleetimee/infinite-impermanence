// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/modules/gallery_image/controllers/gallery_image_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/widget/upload_screen.dart';

class MediaController extends GetxController {
  var keterangan = TextEditingController();

  final debiturController = Get.put(InsightDebiturController());
  final galleryController = Get.put(GalleryImageController());

  final formKey = GlobalKey<FormBuilderState>();

  final isMediaProcessing = false.obs;

  void saveMedia(id) {
    final body = {
      'keterangan': keterangan.text,
      'file': formKey.currentState?.fields['file']?.value[0].path,
    };

    try {
      isMediaProcessing(true);
      Get.dialog(
        const UploadScreen(),
        barrierDismissible: false,
      );
      MediaProvider().saveMedia(id, body).then((resp) {
        isMediaProcessing(false);
        clearForm();
        galleryController.imageList.clear();
        galleryController.getImages(id);
        Get.back();
        debiturController.fetchOneDebitur(id);
        Get.snackbar(
          'Success',
          'File berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isMediaProcessing(false);
        Get.back();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: e.toString(),
          btnOkOnPress: () {},
        ).show();
      });
    } catch (e) {
      isMediaProcessing(false);
      Get.back();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: e.toString(),
        btnOkOnPress: () {},
      ).show();
    }
  }

  void clearForm() {
    formKey.currentState?.fields['file']?.reset();
    keterangan.clear();
  }
}
