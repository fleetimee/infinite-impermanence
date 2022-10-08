// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:

// 📦 Package imports:

Future<Uint8List> makeAnalisausahaPdf(DebiturInsight debtor) async {
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
                      'Analisa Jenis Usaha',
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
              columnWidths: {},
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              tableWidth: TableWidth.min,
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    textUmur(
                      debtor.jenisUsaha.toString(),
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    titleTextNo('No'),
                    titleTextNo('Jenis Usaha'),
                    titleTextNo('Score'),
                    titleTextNo('Nilai CRR'),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('1'),
                    textUmur('Pertanian'),
                    contentIsi('60'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Pertanian' ? '60' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('2'),
                    textUmur('Perikanan'),
                    contentIsi('65'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Perikanan' ? '65' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('3'),
                    textUmur('Pertambangan'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Pertambangan' ? '65' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('4'),
                    textUmur('Perindustrian'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Perindustrian' ? '70' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('5'),
                    textUmur('Listrik'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Listrik' ? '70' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('6'),
                    textUmur('Gas'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Gas' ? '70' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('7'),
                    textUmur('Air'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Air' ? '70' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('8'),
                    textUmur('Konstruksi'),
                    contentIsi('70'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Konstruksi' ? '75' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('9'),
                    textUmur('Perdagangan'),
                    contentIsi('85'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Perdagangan' ? '85' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('10'),
                    textUmur('Pengangkutan'),
                    contentIsi('75'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Pengangkutan' ? '75' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('11'),
                    textUmur('Komunikasi'),
                    contentIsi('80'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Komunikasi' ? '80' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('12'),
                    textUmur('Jasa Dunia Usaha'),
                    contentIsi('75'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Jasa Dunia Usaha' ? '75' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('13'),
                    textUmur('Jasa Sosial'),
                    contentIsi('75'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Jasa Sosial' ? '75' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    alphabetText('14'),
                    textUmur('Lain - Lain'),
                    contentIsi('75'),
                    textUmurBold(
                      debtor.jenisUsaha == 'Lain - Lain' ? '75' : '-',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    textUmurBold(
                      debtor.analisaJenisUsaha!.totalCrrUsaha.toString(),
                    ),
                  ],
                ),
              ],
            ),
            Container(height: 15),
            Paragraph(text: 'Score dari jenis usaha tergantung dari'),
            Paragraph(
              text: '1. Kinerja Bank masa lalu dalam menangani debitur sejenis',
              margin: const EdgeInsets.symmetric(vertical: 1),
            ),
            Paragraph(
              text: '2. Kondisi pasar dari produk tersebut secara regional',
              margin: const EdgeInsets.symmetric(vertical: 1),
            ),
            Container(
                width: 300,
                child: Paragraph(
                  text:
                      '3. Policy pemerintah atau lembaga lain terhadap (misalnya pajak expor textil turun dan sebagainya)',
                  margin: const EdgeInsets.symmetric(vertical: 1),
                ))
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
