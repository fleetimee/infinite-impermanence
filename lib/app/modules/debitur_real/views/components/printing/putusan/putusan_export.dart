// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

// 🌎 Project imports:
import '../../../../../../models/debtor.dart';

// 📦 Package imports:

Future<Uint8List> makePutusanPdf(Debtor debtor) async {
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
    title: 'Analisa Jenis Usaha',
    author: 'fleetime',
    compress: true,
    creator: 'fleetime',
    pageMode: PdfPageMode.fullscreen,
    version: PdfVersion.pdf_1_5,
  );

  // logo
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/pdf/logo.png'))
          .buffer
          .asUint8List());

  pdf.addPage(
    Page(
      margin: const EdgeInsets.all(35),
      orientation: PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(0.2),
                2: const FlexColumnWidth(1),
              },
              tableWidth: TableWidth.max,
              children: [
                TableRow(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(imageLogo),
                    ),
                    SizedBox.shrink(),
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(1),
                        1: const FlexColumnWidth(0.85),
                      },
                      border: TableBorder.symmetric(
                        outside: const BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            textUmur('Tgl rapat komite kredit'),
                            textUmurR('March 2022')
                          ],
                        ),
                        TableRow(
                          children: [
                            textUmur('Nomor MKK'),
                            textUmurR('MKK/2021/03/01')
                          ],
                        ),
                        TableRow(
                          children: [
                            textUmur('No SKPK'),
                            textUmurR('SKPK/2021/03/01')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('.'),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    textUmurRB('PUTUSAN KREDIT'),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
              // border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(0.3),
                1: const FlexColumnWidth(1),
              },
              tableWidth: TableWidth.max,
              children: [
                TableRow(
                  children: [
                    textDeskripsiNoBold('Nama Pemohon'),
                    textDeskripsi(debtor.peminjam1.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Alamat'),
                    textDeskripsi(debtor.alamat1.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Jenis Kredit'),
                    textDeskripsi(
                        debtor.inputKeuangan?.digunakanUntuk.toString() ?? ''),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Plafon Kredit'),
                    textDeskripsi(
                      "Rp ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString())).text} ( ${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()))} Rupiah )",
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Kolektabilitas'),
                    textDeskripsi(
                      "Lancar",
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

Widget passingGrade(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget total(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget titleTextNo(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget textUmur(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget textDeskripsiNoBold(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 11,
        ),
      ),
    );

Widget textDeskripsi(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget textUmurR(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget textUmurRB(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget textUmurBold(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget contentIsi(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget scoreText(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );

Widget contentTextKarakter(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget alphabetText(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget descText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );

Widget headerText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget numberText(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget contentText(
  final String text, {
  final TextAlign align = TextAlign.center,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget paddedTextDescription(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        textAlign: align,
      ),
    );

Widget paddedTextDescriptionBold(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

Widget paddedTextBold(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

// convert int? to num
num toNum(int? value) {
  if (value == null) {
    return 0;
  } else {
    return value;
  }
}

// convert int to double
double toDouble(int value) {
  return value.toDouble();
}
