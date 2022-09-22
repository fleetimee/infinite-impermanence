// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import '../../../../../../models/debtor.dart';

// 📦 Package imports:

Future<Uint8List> makeAnalisaKarakterPdf(Debtor debtor) async {
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
    title: 'Analisa Bisnis',
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
                      'Analisa Karakter',
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
              columnWidths: {
                0: const FlexColumnWidth(0.18),
                1: const FlexColumnWidth(1.3),
                2: const FlexColumnWidth(0.4),
                3: const FlexColumnWidth(0.4),
                4: const FlexColumnWidth(0.3),
                5: const FlexColumnWidth(0.3),
                6: const FlexColumnWidth(0.3),
                7: const FlexColumnWidth(0.5),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: PdfColors.grey,
                  width: 0.1,
                ),
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              tableWidth: TableWidth.min,
              children: [
                TableRow(
                  children: [
                    titleTextNo('No'),
                    titleTextNo('KARAKTER YANG DINILAI'),
                    titleTextNo('Data'),
                    titleTextNo('NILAI'),
                    titleTextNo('Bobot'),
                    titleTextNo('Score'),
                    titleTextNo('CRR'),
                    titleTextNo('KET'),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('1'),
                    contentTextKarakter('Umur'),
                    contentIsi(debtor.umur.toString()),
                    titleTextNo(''),
                    contentIsi('5'),
                    scoreText(debtor.analisaKarakter!.scoreUmur.toString()),
                    scoreText(debtor.analisaKarakter!.crrUmur.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('2'),
                    contentTextKarakter('Pendidikan'),
                    contentIsi(debtor.pendidikan.toString()),
                    titleTextNo(''),
                    contentIsi('10'),
                    scoreText(
                        debtor.analisaKarakter!.scorePendidikan.toString()),
                    scoreText(debtor.analisaKarakter!.crrPendidikan.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('3'),
                    contentTextKarakter('Pengalaman dlm bisnis'),
                    contentIsi(debtor.lamanyaBerusaha.toString()),
                    titleTextNo(''),
                    contentIsi('20'),
                    scoreText(debtor.analisaKarakter!.scoreLamanyaBerusaha
                        .toString()),
                    scoreText(
                        debtor.analisaKarakter!.crrLamanyaBerusaha.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('4'),
                    contentTextKarakter('Ulet dalam bisnis'),
                    contentIsi(''),
                    contentIsi('0 - 95'),
                    contentIsi('20'),
                    scoreText(debtor.analisaKarakter!.scoreUlet.toString()),
                    scoreText(debtor.analisaKarakter!.crrUlet.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('5'),
                    contentTextKarakter('Flexible / Kaku'),
                    contentIsi(''),
                    contentIsi('0 - 95'),
                    contentIsi('15'),
                    scoreText(debtor.analisaKarakter!.scoreKaku.toString()),
                    scoreText(debtor.analisaKarakter!.crrKaku.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('6'),
                    contentTextKarakter('Kreatif / Inovatif'),
                    contentIsi(''),
                    contentIsi('0 - 95'),
                    contentIsi('15'),
                    scoreText(debtor.analisaKarakter!.scoreKreatif.toString()),
                    scoreText(debtor.analisaKarakter!.crrKreatif.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('7'),
                    contentTextKarakter('Memiliki kejujuran dalam bisnis'),
                    contentIsi(''),
                    contentIsi('0 - 95'),
                    contentIsi('15'),
                    scoreText(
                        debtor.analisaKarakter!.scoreKejujuran.toString()),
                    scoreText(debtor.analisaKarakter!.crrKejujuran.toString()),
                    titleTextNo(''),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    scoreText('-'),
                    SizedBox.shrink()
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    scoreText('Jumlah %'),
                    scoreText('100'),
                    SizedBox.shrink(),
                    scoreText(
                        debtor.analisaKarakter!.totalCrrKarakter.toString()),
                    SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            Table(
                border: TableBorder.symmetric(
                  inside: const BorderSide(
                    color: PdfColors.grey,
                    width: 0.1,
                  ),
                  outside: const BorderSide(
                    color: PdfColors.black,
                    width: 0.5,
                  ),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.full,
                tableWidth: TableWidth.min,
                children: [
                  TableRow(children: [
                    titleTextNo('No'),
                    titleTextNo('Data'),
                  ])
                ])
          ],
        );
      },
    ),
  );

  // pdf.addPage(
  //   Page(
  //     margin: const EdgeInsets.all(35),
  //     orientation: PageOrientation.portrait,
  //     pageFormat: PdfPageFormat.a4,
  //     build: (context) {
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Analisa Bisnis',
  //                     style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: PdfColors.blue900,
  //                     ),
  //                   ),
  //                   // Text(debtor.peminjam1.toString()),
  //                   Text(
  //                     '${debtor.peminjam1}',
  //                     style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                       color: PdfColors.black,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Spacer(),
  //               SizedBox(
  //                 height: 175,
  //                 width: 175,
  //                 child: Image(imageLogo),
  //               ),
  //             ],
  //           ),
  //           Container(height: 15),
  //           Table(
  //             columnWidths: {
  //               0: const FlexColumnWidth(0.25),
  //               1: const FlexColumnWidth(0.15),
  //               2: const FlexColumnWidth(1.3),
  //               3: const FlexColumnWidth(0.5),
  //               4: const FlexColumnWidth(0.5),
  //               5: const FlexColumnWidth(0.5),
  //             },
  //             border: TableBorder.symmetric(
  //               inside: const BorderSide(
  //                 color: PdfColors.grey,
  //                 width: 0.5,
  //               ),
  //               outside: const BorderSide(
  //                 color: PdfColors.white,
  //                 width: 0.5,
  //               ),
  //             ),
  //             defaultVerticalAlignment: TableCellVerticalAlignment.full,
  //             tableWidth: TableWidth.max,
  //             children: [
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   numberText('2'),
  //                   Container(
  //                     width: 50,
  //                     child:
  //                         headerText('Produktivitas terhadap terpasan/omzet'),
  //                   ),
  //                   headerText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas ==
  //                             debtor.analisaBisnis!.nilaiProduktivitas
  //                         ? debtor.analisaBisnis!.keteranganProduktivitas
  //                             .toString()
  //                         : '',
  //                   ),
  //                   SizedBox.shrink(),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('a'),
  //                   descText('s/d 50%'),
  //                   alphabetText(
  //                     '50',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas == 50
  //                         ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('b'),
  //                   descText('s/d 60%'),
  //                   alphabetText(
  //                     '60',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas == 60
  //                         ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('c'),
  //                   descText('s/d 70%'),
  //                   alphabetText(
  //                     '70',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas == 70
  //                         ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('d'),
  //                   descText('s/d 80%'),
  //                   alphabetText(
  //                     '80',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas == 80
  //                         ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('e'),
  //                   descText('> 80%'),
  //                   alphabetText(
  //                     '90',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiProduktivitas == 90
  //                         ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   numberText('3'),
  //                   Container(
  //                     width: 50,
  //                     child: headerText('Kwalitas produk/jasa'),
  //                   ),
  //                   headerText(
  //                     debtor.analisaBisnis!.nilaiKualitas ==
  //                             debtor.analisaBisnis!.nilaiKualitas
  //                         ? debtor.analisaBisnis!.keteranganKualitas.toString()
  //                         : '',
  //                   ),
  //                   SizedBox.shrink(),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('a'),
  //                   descText('Sangat baik'),
  //                   alphabetText(
  //                     '90',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiKualitas == 90
  //                         ? debtor.analisaBisnis!.nilaiKualitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('b'),
  //                   descText('Baik'),
  //                   alphabetText(
  //                     '80',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiKualitas == 80
  //                         ? debtor.analisaBisnis!.nilaiKualitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('c'),
  //                   descText('Cukup'),
  //                   alphabetText(
  //                     '70',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiKualitas == 70
  //                         ? debtor.analisaBisnis!.nilaiKualitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('d'),
  //                   descText('Kurang baik'),
  //                   alphabetText(
  //                     '60',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiKualitas == 60
  //                         ? debtor.analisaBisnis!.nilaiKualitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText('e'),
  //                   descText('Jelek'),
  //                   alphabetText(
  //                     '50',
  //                   ),
  //                   alphabetText(
  //                     debtor.analisaBisnis!.nilaiKualitas == 50
  //                         ? debtor.analisaBisnis!.nilaiKualitas.toString()
  //                         : '-',
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               //Tablerow with 6 columns sizedbox.shrink
  //             ],
  //           ),
  //           Container(height: 25),
  //           Table(
  //             border: TableBorder.symmetric(
  //               inside: const BorderSide(
  //                 color: PdfColors.grey,
  //                 width: 1,
  //               ),
  //               outside: const BorderSide(
  //                 color: PdfColors.white,
  //                 width: 1,
  //               ),
  //             ),
  //             columnWidths: {
  //               0: const FlexColumnWidth(0.25),
  //               1: const FlexColumnWidth(0.15),
  //               2: const FlexColumnWidth(1.3),
  //               3: const FlexColumnWidth(0.5),
  //               4: const FlexColumnWidth(0.5),
  //               5: const FlexColumnWidth(0.5),
  //             },
  //             children: [
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   alphabetText(''),
  //                   descText('Jumlah yang diisi (Max 10)'),
  //                   alphabetText(
  //                     '',
  //                   ),
  //                   alphabetText(
  //                     (toNum(debtor.analisaBisnis!.nilaiOmzet) +
  //                             toNum(debtor.analisaBisnis!.nilaiHargaBersaing) +
  //                             toNum(debtor.analisaBisnis!.nilaiPersaingan) +
  //                             toNum(debtor.analisaBisnis!.nilaiLokasiUsaha) +
  //                             toNum(debtor.analisaBisnis!.nilaiProduktivitas) +
  //                             toNum(debtor.analisaBisnis!.nilaiKualitas))
  //                         .toString(),
  //                   ),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   SizedBox.shrink(),
  //                   SizedBox.shrink(),
  //                   SizedBox.shrink(),
  //                   headerText('Avg CRR'),
  //                   alphabetText(
  //                       toDouble(debtor.analisaBisnis!.hasilCrrBisnis!.toInt())
  //                           .toStringAsFixed(1)),
  //                   SizedBox.shrink(),
  //                 ],
  //               ),
  //             ],
  //           )
  //         ],
  //       );
  //     },
  //   ),
  // );

  return pdf.save();
}

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
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 13,
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
