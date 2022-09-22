// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:printing/printing.dart';

// 🌎 Project imports:
import 'keuangan_export.dart';

class KeuanganPreview extends StatelessWidget {
  KeuanganPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisa Keuangan: ${data.peminjam1}'),
        centerTitle: true,
      ),
      body: PdfPreview(
        // Make color red
        build: (context) => makeAnalisaKeuanganPdf(data),
      ),
    );
  }
}
