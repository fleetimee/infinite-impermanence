// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/insight_debitur/views/components/printing/agunan/agunan_export.dart';
import '../../../../../../common/style.dart';

class AgunanPreview extends StatelessWidget {
  AgunanPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agunan: ${data.peminjam1}'),
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
              '${DateFormat('dd-MM-yy').format(DateTime.now())}_AGUNAN_${data.peminjam1}.pdf',
          onShared: (context) {
            Get.snackbar(
              'Berhasil',
              'File berhasil dibagikan',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          },
          build: (context) => makeAgunanPdf(data),
        ),
      ),
    );
  }
}
