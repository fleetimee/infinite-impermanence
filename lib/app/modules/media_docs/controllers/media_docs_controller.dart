// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/modules/gallery_file/controllers/gallery_file_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/widget/upload_screen.dart';

class MediaDocsController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  final debiturController = Get.put(InsightDebiturController());
  final fileManagerController = Get.put(GalleryFileController());

  final isDocsProcessing = false.obs;

  var keterangan = TextEditingController();

  void deployDocs(id) {
    final body = {
      'keterangan': keterangan.text,
      'file': formKey.currentState?.fields['file']?.value[0].path,
    };

    try {
      isDocsProcessing(true);
      Get.dialog(
        const UploadScreen(),
        barrierDismissible: false,
      );
      MediaProvider().saveMedia(id, body).then((resp) {
        isDocsProcessing(false);
        clearForm();
        fileManagerController.fileList.clear();
        fileManagerController.getFiles(id);
        Get.back();
        debiturController.fetchOneDebitur(id);
        Get.snackbar(
          'Success',
          'File berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }, onError: (e) {
        isDocsProcessing(false);
        Get.back();
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      isDocsProcessing(false);
      Get.back();
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void clearForm() {
    keterangan.clear();
    formKey.currentState?.reset();
  }
}
