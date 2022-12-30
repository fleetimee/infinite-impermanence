// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:akm/app/modules/pengajuan_detail/views/components/printing/tanggapan_reviewer/reviewer_export.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

// ignore: must_be_immutable
class ReviewerPreview extends StatelessWidget {
  ReviewerPreview({Key? key}) : super(key: key);

  PengajuanDetail data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanggapan Reviewer'),
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
              '${DateFormat('dd-MM-yy').format(DateTime.now())}_TANGAPAN_REVIEWER.pdf',
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
