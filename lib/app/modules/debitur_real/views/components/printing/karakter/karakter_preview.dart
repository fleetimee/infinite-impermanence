// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:printing/printing.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/debitur_real/views/components/printing/bisnis/bisnis_export.dart';

class KarakterPreview extends StatelessWidget {
  KarakterPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisa Karakter: ${data.peminjam1}'),
        centerTitle: true,
      ),
      body: PdfPreview(
        // Make color red
        build: (context) => makeAnalisaBisnisPdf(data),
      ),
    );
  }
}
