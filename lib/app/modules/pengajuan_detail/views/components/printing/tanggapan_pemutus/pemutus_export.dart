import 'package:akm/app/models/user/user_pengajuan.model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';

Future<Uint8List> makePemutusPdf(Pengajuan pengajuan) async {
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load('assets/fonts/times-new-roman.ttf')),
    bold: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold.ttf')),
    boldItalic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold-italic.ttf')),
    italic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-italic.ttf')),
  );

  final pdf = Document(
    theme: myTheme,
    title: 'Tanggapan Pemutus',
    author: 'fleetime',
    compress: true,
    creator: 'fleetime',
    pageMode: PdfPageMode.fullscreen,
    version: PdfVersion.pdf_1_5,
  );

  pdf.addPage(
    MultiPage(
        footer: (context) => Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              padding: const EdgeInsets.only(right: 1.0 * PdfPageFormat.cm),
              child: Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: const TextStyle(
                  color: PdfColors.black,
                  fontSize: 10,
                ),
              ),
            ),
        margin: const EdgeInsets.all(35),
        orientation: PageOrientation.portrait,
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
              Text(
                'Tanggapan Pemutus',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tanggal: ${DateFormat('dd-MM-yy').format(DateTime.now())}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ]),
  );

  return pdf.save();
}
