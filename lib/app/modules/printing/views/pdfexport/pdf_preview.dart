// ignore_for_file: must_be_immutable

import 'package:akm/app/models/invoice.dart';
import 'package:akm/app/modules/printing/views/pdfexport/pdf/pdfexport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

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
