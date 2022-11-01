// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/views/components/printing/inputan/inputan_export.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

Future<Uint8List> makeUsulanPdf(DebiturInsight debtor) async {
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
    title: 'Usulan',
    author: 'fleetime',
    compress: true,
    creator: 'fleetime',
    pageMode: PdfPageMode.fullscreen,
    version: PdfVersion.pdf_1_5,
  );

  var syaratList = debtor.syaratLain;

  final totalUsaha = (10 *
          (double.parse(debtor.analisaJenisUsaha!.totalCrrUsaha.toString()) /
              100))
      .toStringAsFixed(1);

  final totalKarakter = (30 *
      (double.parse(debtor.analisaKarakter!.totalCrrKarakter.toString()) /
          100));

  final totalBisnis = (25 *
      (double.parse(debtor.analisaBisnis!.hasilCrrBisnis.toString()) / 100));

  final totalKeuangan = (25 *
      (double.parse(debtor.analisaKeuangan!.totalCrrKeuangan.toString()) /
          100));

  final totalAgunan = (10 *
      (double.parse(debtor.analisaAgunan!.totalCrrAgunan.toString()) / 100));

  final totalCrrAll = double.parse(totalUsaha) +
      totalKarakter +
      totalBisnis +
      totalKeuangan +
      totalAgunan;

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Table(
                border: TableBorder.all(),
                tableWidth: TableWidth.min,
                children: [
                  TableRow(
                    children: [
                      Center(child: header('MEMORANDUM PENGUSULAN KREDIT')),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(child: header('KREDIT MIKRO')),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            // Table Bobot
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur('#'),
                        textUmur('No'),
                        textUmur('Risk Area'),
                        textUmur('Bobot %'),
                        textUmur('Nilai'),
                        textUmur('Total'),
                        textUmur('Keterangan'),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.symmetric(
                    inside:
                        const BorderSide(color: PdfColors.black, width: 0.5),
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR('1'),
                        textUmur('Jenis Usaha'),
                        textUmurR('10'),
                        textUmurR(double.parse(debtor
                                .analisaJenisUsaha!.totalCrrUsaha
                                .toString())
                            .toStringAsFixed(1)),
                        textUmurR((10 *
                                (double.parse(debtor
                                        .analisaJenisUsaha!.totalCrrUsaha
                                        .toString()) /
                                    100))
                            .toStringAsFixed(1)),
                        textUmur(''),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.symmetric(
                    inside:
                        const BorderSide(color: PdfColors.black, width: 0.5),
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR('2'),
                        textUmur('Karakter'),
                        textUmurR('30'),
                        textUmurR(double.parse(debtor
                                .analisaKarakter!.totalCrrKarakter
                                .toString())
                            .toStringAsFixed(1)),
                        textUmurR((30 *
                                (double.parse(debtor
                                        .analisaKarakter!.totalCrrKarakter
                                        .toString()) /
                                    100))
                            .toStringAsFixed(1)),
                        textUmur(''),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.symmetric(
                    inside:
                        const BorderSide(color: PdfColors.black, width: 0.5),
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR('3'),
                        textUmur('Usaha Bisnis'),
                        textUmurR('25'),
                        textUmurR(double.parse(
                                debtor.analisaBisnis!.hasilCrrBisnis.toString())
                            .toStringAsFixed(1)),
                        textUmurR((25 *
                                (double.parse(debtor
                                        .analisaBisnis!.hasilCrrBisnis
                                        .toString()) /
                                    100))
                            .toStringAsFixed(1)),
                        textUmur(''),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.symmetric(
                    inside:
                        const BorderSide(color: PdfColors.black, width: 0.5),
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR('4'),
                        textUmur('Keuangan'),
                        textUmurR('25'),
                        textUmurR(double.parse(debtor
                                .analisaKeuangan!.totalCrrKeuangan
                                .toString())
                            .toStringAsFixed(1)),
                        textUmurR((25 *
                                (double.parse(debtor
                                        .analisaKeuangan!.totalCrrKeuangan
                                        .toString()) /
                                    100))
                            .toStringAsFixed(1)),
                        textUmur(''),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.symmetric(
                    inside:
                        const BorderSide(color: PdfColors.black, width: 0.5),
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR('5'),
                        textUmur('Agunan'),
                        textUmurR('10'),
                        textUmurR(double.parse(
                                debtor.analisaAgunan!.totalCrrAgunan.toString())
                            .toStringAsFixed(1)),
                        textUmurR((10 *
                                (double.parse(debtor
                                        .analisaAgunan!.totalCrrAgunan
                                        .toString()) /
                                    100))
                            .toStringAsFixed(1)),
                        textUmur(''),
                      ],
                    )
                  ],
                ),
                Table(
                  border: TableBorder.all(
                    color: PdfColors.black,
                    width: 0.5,
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                          left: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmurR('Total Nilai'),
                        textUmurR('100'),
                        textUmurR(''),
                        textUmurR(double.parse(totalCrrAll.toString())
                            .toStringAsFixed(1)),
                        totalCrrAll > 65.0
                            ? textUmur('Disetujui')
                            : textUmur('Ditolak'),
                      ],
                    )
                  ],
                ),
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurR('Passing Grade'),
                        textUmurR('65.0'),
                        textUmur('')
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurBold('A'),
                        textUmurBoldLeft('Baik')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            // Syarat Lain
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.1428),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                    6: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Syarat Lain:'),
                        textUmurR(''),
                        textUmurR(''),
                        textUmurR(''),
                        textUmur('')
                      ],
                    ),
                  ],
                ),
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.714),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        ListView.builder(
                          itemCount: syaratList!.length,
                          itemBuilder: (context, index) => Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                textUmurR(
                                  '${(index + 1)}',
                                )
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: syaratList.length,
                          itemBuilder: (context, index) => Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textUmur('${syaratList[index].keterangan}')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(''),
                        textUmur('Demikian untuk selanjutnya mohon keputusan')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Tanda Tangan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: textUmur('Diajukan Kepada Komite Kredit'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(
                          child: textUmur('Tanggal 21 October 2022'),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 75),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: textUmur('Sumaryanto / AKM'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: textUmur('Komite Kredit'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 75),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: textUmur('Waskhito'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

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

Widget header(
  final String text, {
  final TextAlign align = TextAlign.center,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 3),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
