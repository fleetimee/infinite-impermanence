// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import '../../../../../../models/debtor.dart';

// 📦 Package imports:

Future<Uint8List> makeModelPdf(Debtor debtor) async {
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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.blue900,
                      ),
                    ),
                    // Text(debtor.peminjam1.toString()),
                    Text(
                      '${debtor.peminjam1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 175,
                  width: 175,
                  child: Image(imageLogo),
                ),
              ],
            ),
            Container(height: 15),
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              children: [
                TableRow(
                  children: [
                    contentText('MODEL PARAMETER YANG DIGUNAKAN'),
                  ],
                ),
                TableRow(
                  children: [
                    contentText('(Kredit Mikro)'),
                  ],
                ),
              ],
              tableWidth: TableWidth.max,
            ),
            Container(height: 15),
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.15),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(0.5),
                3: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    titleTextNo('NO'),
                    textUmurBold('PARAMETER RESIKO YANG DIUKUR'),
                    textUmurBold('Bobot (%)'),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    textUmurBold('(dgn agunan)'),
                    SizedBox.shrink(),
                  ],
                ),
              ],
              tableWidth: TableWidth.max,
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.15),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(0.5),
                3: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    alphabetText('1'),
                    textUmur('Jenis Usaha'),
                    contentIsi('10'),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('2'),
                    textUmur('Karakter'),
                    contentIsi('30'),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('3'),
                    textUmur('Usaha Bisnis'),
                    contentIsi('25'),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('4'),
                    textUmur('Keuangan'),
                    contentIsi('25'),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(children: [
                  alphabetText('5'),
                  textUmur('Agunan'),
                  contentIsi('10'),
                  SizedBox.shrink(),
                ]),
              ],
              tableWidth: TableWidth.max,
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.15),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(0.5),
                3: const FlexColumnWidth(1),
              },
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    total('Total'),
                    contentIsi('100'),
                    SizedBox.shrink(),
                  ],
                ),
              ],
              tableWidth: TableWidth.max,
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.15),
                1: const FlexColumnWidth(1),
                2: const FlexColumnWidth(0.5),
                3: const FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    passingGrade('Passing Grade'),
                    contentIsi('65'),
                    SizedBox.shrink(),
                  ],
                ),
              ],
              tableWidth: TableWidth.max,
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
