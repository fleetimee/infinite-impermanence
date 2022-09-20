import 'package:akm/app/modules/debitur_real/views/components/printing/karakter/bisnis_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class BisnisPreview extends StatelessWidget {
  BisnisPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisa Bisnis: ${data.peminjam1}'),
        centerTitle: true,
      ),
      body: PdfPreview(
        // Make color red
        build: (context) => makeAnalisaBisnisPdf(data),
      ),
    );
  }
}
