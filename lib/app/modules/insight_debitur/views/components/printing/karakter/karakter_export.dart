// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

// 🌎 Project imports:

// 📦 Package imports:

Future<Uint8List> makeAnalisaKarakterPdf(DebiturInsight debtor) async {
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
    title: 'Analisa Karakter',
    author: 'fleetime',
    compress: true,
    creator: 'fleetime',
    pageMode: PdfPageMode.fullscreen,
    version: PdfVersion.pdf_1_5,
    producer: 'fleetime',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 5),
                Text(
                  'Umur',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
                Table(
                  // border: TableBorder.all(),
                  columnWidths: {
                    0: const FlexColumnWidth(0.12),
                    1: const FlexColumnWidth(0.2),
                    2: const FlexColumnWidth(0.2),
                    3: const FlexColumnWidth(0.2),
                    4: const FlexColumnWidth(0.3),
                    5: const FlexColumnWidth(0.3),
                    6: const FlexColumnWidth(0.3),
                    7: const FlexColumnWidth(0.5),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.full,
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        titleTextNo('NO'),
                        titleTextNo('UMUR'),
                        titleTextNo('NILAI'),
                        titleTextNo('SCORE'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('1'),
                        textUmur('21 - 30'),
                        textUmur('61 - 70'),
                        textUmur(int.parse(debtor.umur.toString()) > 20
                            ? (int.parse(debtor.umur.toString()) <= 30)
                                ? ((int.parse(debtor.umur.toString()) - 21) /
                                            10 *
                                            10 +
                                        61)
                                    .toStringAsFixed(0)
                                : '-'
                            : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('2'),
                        textUmur('31 - 40'),
                        textUmur('71 - 80'),
                        textUmur(int.parse(debtor.umur.toString()) > 30
                            ? (int.parse(debtor.umur.toString()) <= 40)
                                ? ((int.parse(debtor.umur.toString()) - 31) /
                                            10 *
                                            10 +
                                        71)
                                    .toStringAsFixed(0)
                                : '-'
                            : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('3'),
                        textUmur('41 - 50'),
                        textUmur('81 - 90'),
                        textUmur(int.parse(debtor.umur.toString()) > 40
                            ? (int.parse(debtor.umur.toString()) <= 50)
                                ? ((int.parse(debtor.umur.toString()) - 41) /
                                            10 *
                                            10 +
                                        81)
                                    .toStringAsFixed(0)
                                : '-'
                            : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('4'),
                        textUmur('51 - 55'),
                        textUmur('71 - 80'),
                        textUmur(int.parse(debtor.umur.toString()) > 50
                            ? (int.parse(debtor.umur.toString()) <= 55)
                                ? ((int.parse(debtor.umur.toString()) - 51) /
                                            5 *
                                            10 +
                                        71)
                                    .toStringAsFixed(0)
                                : '-'
                            : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('5'),
                        textUmur('56 - 65'),
                        textUmur('51 - 65'),
                        textUmur(int.parse(debtor.umur.toString()) > 55
                            ? (int.parse(debtor.umur.toString()) <= 65)
                                ? ((int.parse(debtor.umur.toString()) - 65)
                                                .abs() /
                                            10 *
                                            15 +
                                        51)
                                    .toStringAsFixed(0)
                                : '-'
                            : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        textUmurBold('Jumlah'),
                        textUmurBold(
                            debtor.analisaKarakter!.scoreUmur.toString()),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
                Container(height: 5),
                Text(
                  'Pendidikan',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
                Table(
                  // border: TableBorder.all(),
                  columnWidths: {
                    0: const FlexColumnWidth(0.12),
                    1: const FlexColumnWidth(0.4),
                    2: const FlexColumnWidth(0.2),
                    3: const FlexColumnWidth(0.2),
                    4: const FlexColumnWidth(0.3),
                    5: const FlexColumnWidth(0.3),
                    6: const FlexColumnWidth(0.3),
                    7: const FlexColumnWidth(0.5),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.full,
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        titleTextNo('No'),
                        titleTextNo('Pendidikan'),
                        titleTextNo('Nilai'),
                        titleTextNo('CRR'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('1'),
                        textUmur('Tnp Pendidikan'),
                        textUmur('60'),
                        textUmur(
                            debtor.pendidikan == 'Tidak Sekolah' ? '60' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('2'),
                        textUmur('SD'),
                        textUmur('70'),
                        textUmur(debtor.pendidikan == 'SD' ? '70' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('3'),
                        textUmur('SLTP'),
                        textUmur('75'),
                        textUmur(debtor.pendidikan == 'SLTP' ? '75' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('4'),
                        textUmur('SLTA'),
                        textUmur('80'),
                        textUmur(debtor.pendidikan == 'SLTA' ? '80' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('5'),
                        textUmur('D3'),
                        textUmur('85'),
                        textUmur(debtor.pendidikan == 'D3' ? '85' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('6'),
                        textUmur('S1'),
                        textUmur('90'),
                        textUmur(debtor.pendidikan == 'S1' ? '90' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('7'),
                        textUmur('S2'),
                        textUmur('95'),
                        textUmur(debtor.pendidikan == 'S2' ? '95' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('8'),
                        textUmur('S3'),
                        textUmur('95'),
                        textUmur(debtor.pendidikan == 'S3' ? '95' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        textUmurBold('Jumlah'),
                        textUmurBold(
                            debtor.analisaKarakter!.scorePendidikan.toString()),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
                Container(height: 5),
                Text(
                  'Pengalaman dalam bisnis sejenis',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
                Table(
                  // border: TableBorder.all(),
                  columnWidths: {
                    0: const FlexColumnWidth(0.12),
                    1: const FlexColumnWidth(0.15),
                    2: const FlexColumnWidth(0.2),
                    3: const FlexColumnWidth(0.2),
                    4: const FlexColumnWidth(0.3),
                    5: const FlexColumnWidth(0.3),
                    6: const FlexColumnWidth(0.3),
                    7: const FlexColumnWidth(0.5),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.full,
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        titleTextNo('No'),
                        titleTextNo('Tahun'),
                        titleTextNo('Nilai'),
                        titleTextNo('CRR'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('1'),
                        textUmur('1'),
                        textUmur('60'),
                        textUmur(debtor.lamanyaBerusaha == 1 ? '60' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('2'),
                        textUmur('2'),
                        textUmur('65'),
                        textUmur(debtor.lamanyaBerusaha == 2 ? '65' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('3'),
                        textUmur('3'),
                        textUmur('70'),
                        textUmur(debtor.lamanyaBerusaha == 3 ? '70' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('4'),
                        textUmur('4'),
                        textUmur('75'),
                        textUmur(debtor.lamanyaBerusaha == 4 ? '75' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('5'),
                        textUmur('5'),
                        textUmur('80'),
                        textUmur(debtor.lamanyaBerusaha == 5 ? '80' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('6'),
                        textUmur('6'),
                        textUmur('85'),
                        textUmur(debtor.lamanyaBerusaha == 6 ? '85' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('7'),
                        textUmur('7'),
                        textUmur('90'),
                        textUmur(debtor.lamanyaBerusaha == 7 ? '90' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        alphabetText('8'),
                        textUmur('8'),
                        textUmur('95'),
                        textUmur(debtor.lamanyaBerusaha == 8 ? '95' : '-'),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                    TableRow(
                      children: [
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        textUmurBold('Jumlah'),
                        textUmurBold(debtor
                            .analisaKarakter!.scoreLamanyaBerusaha
                            .toString()),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                        SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
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
  final TextAlign align = TextAlign.center,
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
