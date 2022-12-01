import 'dart:io';

import 'package:akm/app/data/provider/media/save_mediaprovider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class GalleryFileController extends GetxController {
  @override
  void onInit() {
    getFiles(debiturId.id);
    super.onInit();
  }

  var fileList = List<Upload>.empty(growable: true).obs;

  final isFileLoading = false.obs;

  final debiturId = Get.arguments;

  void getFiles(int id) {
    try {
      isFileLoading(true);
      MediaProvider().fetchDocs(id).then((resp) {
        isFileLoading(false);
        fileList.addAll(resp);
      }, onError: (e) {
        isFileLoading(false);
        Get.snackbar('Error', e.toString());
      });
    } catch (e) {
      isFileLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }

  void downloadNetworkFile(String url, String filename) async {
    Directory tempDir = await getTemporaryDirectory();

    final path = tempDir.path;

    await Dio().download(url, '$path/$filename');

    Get.snackbar('Success', 'File downloaded to $path/$filename');
  }

  void printFile(String url, String filename) async {
    Directory tempDir = await getTemporaryDirectory();

    final path = tempDir.path;

    // Download as ui8list
    final response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));

    // Save to temp directory
    final file = File('$path/$filename');

    await file.writeAsBytes(response.data);

    // Print
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => file.readAsBytesSync(),
    );
  }

  void shareFile(String url, String filename) async {
    Directory tempDir = await getTemporaryDirectory();

    final path = tempDir.path;

    await Dio().download(url, '$path/$filename.pdf');

    XFile file = XFile(
      '$path/$filename.pdf',
      bytes: File('$path/$filename.pdf').readAsBytesSync(),
      length: File('$path/$filename.pdf').lengthSync(),
    );

    Share.shareXFiles([file]);
  }

  // void viewFile(String url, String filename) async {
  //   Directory tempDir = await getTemporaryDirectory();

  //   final path = tempDir.path;

  //   // Download as ui8list
  //   final response = await Dio()
  //       .get(url, options: Options(responseType: ResponseType.bytes));

  //   // Save to temp directory
  //   final file = File('$path/$filename.pdf');

  //   await file.writeAsBytes(response.data);

  //   // Open
  //   PdfPreview(
  //     build: (format) => file.readAsBytesSync(),

  //   );
  // }
}
