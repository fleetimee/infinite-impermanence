import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/pk/pk_export.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PkPreview extends StatelessWidget {
  PkPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print PK: '),
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
              '${DateFormat('dd-MM-yy').format(DateTime.now())}_PK_.pdf',
          onShared: (context) {
            Get.snackbar(
              'Berhasil',
              'File berhasil dibagikan',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
          build: (context) => makePkPdf(data),
        ),
      ),
    );
  }
}
