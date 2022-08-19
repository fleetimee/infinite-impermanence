// ignore_for_file: must_be_immutable

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:printing/printing.dart';

// 🌎 Project imports:
import 'package:akm/app/models/invoice.dart';
import 'package:akm/app/modules/printing/views/pdfexport/pdf/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  Invoice? invoice;

  PdfPreviewPage({Key? key}) : super(key: key);
  // const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(Get.arguments),
      ),
    );
  }
}
