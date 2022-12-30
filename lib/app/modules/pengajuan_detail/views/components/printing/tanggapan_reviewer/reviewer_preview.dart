// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:akm/app/modules/pengajuan_detail/views/components/printing/tanggapan_reviewer/reviewer_export.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class ReviewerPreview extends StatelessWidget {
  ReviewerPreview({Key? key}) : super(key: key);

  Pengajuan data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: primaryColor),
        child: PdfPreview(
          dynamicLayout: true,
          canDebug: false,
          initialPageFormat: PdfPageFormat.a4,
          onPrinted: (context) => {
            Get.snackbar(
              'Berhasil',
              'Berhasil mencetak',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            )
          },
          pdfFileName: // date
              '${DateFormat('dd-MM-yy').format(DateTime.now())}_TANGAPAN_ANALIS.pdf',
          onShared: (context) {
            Get.snackbar(
              'Berhasil',
              'File berhasil dibagikan',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
          build: (context) => makeReviewerPdf(data),
        ),
      ),
    );
  }
}
