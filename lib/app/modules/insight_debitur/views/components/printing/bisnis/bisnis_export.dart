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

Future<Uint8List> makeAnalisaBisnisPdf(DebiturInsight debtor) async {
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
                      'Analisa Bisnis',
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
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.15),
                2: const FlexColumnWidth(1.3),
                3: const FlexColumnWidth(0.5),
                4: const FlexColumnWidth(0.5),
                5: const FlexColumnWidth(0.5),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: PdfColors.grey,
                  width: 0.5,
                ),
                outside: const BorderSide(
                  color: PdfColors.white,
                  width: 0.5,
                ),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              tableWidth: TableWidth.min,
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Analisa Resiko',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Nilai',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'CRR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Ket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    titleText('A'),
                    SizedBox.shrink(),
                    titleText('Penguasaan Pasar'),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('1'),
                    headerText('Omzet penjualan telah tercapai'),
                    headerText(
                      debtor.analisaBisnis!.nilaiOmzet ==
                              debtor.analisaBisnis!.nilaiOmzet
                          ? debtor.analisaBisnis!.keteranganOmzet.toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('s/d 50%'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiOmzet == 50
                          ? debtor.analisaBisnis!.nilaiOmzet.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('s/d 60%'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiOmzet == 60
                          ? debtor.analisaBisnis!.nilaiOmzet.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('s/d 70%'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiOmzet == 70
                          ? debtor.analisaBisnis!.nilaiOmzet.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('s/d 80%'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiOmzet == 80
                          ? debtor.analisaBisnis!.nilaiOmzet.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('> 80%'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiOmzet == 90
                          ? debtor.analisaBisnis!.nilaiOmzet.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('2'),
                    headerText('Harga bersaing'),
                    headerText(
                      debtor.analisaBisnis!.nilaiHargaBersaing ==
                              debtor.analisaBisnis!.nilaiHargaBersaing
                          ? debtor.analisaBisnis!.keteranganHargaBersaing
                              .toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('Lebih mahal dari pesaing'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiHargaBersaing == 50
                          ? debtor.analisaBisnis!.nilaiHargaBersaing.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('Sama dengan pesaing'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiHargaBersaing == 60
                          ? debtor.analisaBisnis!.nilaiHargaBersaing.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('Lebih murah s/d 5%'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiHargaBersaing == 70
                          ? debtor.analisaBisnis!.nilaiHargaBersaing.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('Lebih murah 5 - 10%'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiHargaBersaing == 80
                          ? debtor.analisaBisnis!.nilaiHargaBersaing.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('Lebih murah > 10%'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiHargaBersaing == 90
                          ? debtor.analisaBisnis!.nilaiHargaBersaing.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('3'),
                    headerText('Persaingan'),
                    headerText(
                      debtor.analisaBisnis!.nilaiPersaingan ==
                              debtor.analisaBisnis!.nilaiPersaingan
                          ? debtor.analisaBisnis!.keteranganPersaingan
                              .toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('Tidak ketat'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiPersaingan == 90
                          ? debtor.analisaBisnis!.nilaiPersaingan.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('Kurang ketat'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiPersaingan == 80
                          ? debtor.analisaBisnis!.nilaiPersaingan.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('Cukup ketat'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiPersaingan == 70
                          ? debtor.analisaBisnis!.nilaiPersaingan.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('Ketat'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiPersaingan == 60
                          ? debtor.analisaBisnis!.nilaiPersaingan.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('Sangat ketat'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiPersaingan == 50
                          ? debtor.analisaBisnis!.nilaiPersaingan.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    titleText('B'),
                    SizedBox.shrink(),
                    titleText('Teknik Produksi'),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('1'),
                    headerText('Lokasi Usaha'),
                    headerText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha ==
                              debtor.analisaBisnis!.nilaiLokasiUsaha
                          ? debtor.analisaBisnis!.keteranganLokasiUsaha
                              .toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('Sangat strategis'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha == 90
                          ? debtor.analisaBisnis!.nilaiLokasiUsaha.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('Strategis'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha == 80
                          ? debtor.analisaBisnis!.nilaiLokasiUsaha.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('Cukup strategis'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha == 70
                          ? debtor.analisaBisnis!.nilaiLokasiUsaha.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('Kurang strategis'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha == 60
                          ? debtor.analisaBisnis!.nilaiLokasiUsaha.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('Tidak strategis'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiLokasiUsaha == 50
                          ? debtor.analisaBisnis!.nilaiLokasiUsaha.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

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
                      'Analisa Bisnis',
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
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.15),
                2: const FlexColumnWidth(1.3),
                3: const FlexColumnWidth(0.5),
                4: const FlexColumnWidth(0.5),
                5: const FlexColumnWidth(0.5),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: PdfColors.grey,
                  width: 0.5,
                ),
                outside: const BorderSide(
                  color: PdfColors.white,
                  width: 0.5,
                ),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              tableWidth: TableWidth.max,
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('2'),
                    Container(
                      width: 50,
                      child:
                          headerText('Produktivitas terhadap terpasang/omzet'),
                    ),
                    headerText(
                      debtor.analisaBisnis!.nilaiProduktivitas ==
                              debtor.analisaBisnis!.nilaiProduktivitas
                          ? debtor.analisaBisnis!.keteranganProduktivitas
                              .toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('s/d 50%'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiProduktivitas == 50
                          ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('s/d 60%'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiProduktivitas == 60
                          ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('s/d 70%'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiProduktivitas == 70
                          ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('s/d 80%'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiProduktivitas == 80
                          ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('> 80%'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiProduktivitas == 90
                          ? debtor.analisaBisnis!.nilaiProduktivitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    numberText('3'),
                    Container(
                      width: 50,
                      child: headerText('Kwalitas produk/jasa'),
                    ),
                    headerText(
                      debtor.analisaBisnis!.nilaiKualitas ==
                              debtor.analisaBisnis!.nilaiKualitas
                          ? debtor.analisaBisnis!.keteranganKualitas.toString()
                          : '',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('a'),
                    descText('Sangat baik'),
                    alphabetText(
                      '90',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiKualitas == 90
                          ? debtor.analisaBisnis!.nilaiKualitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('b'),
                    descText('Baik'),
                    alphabetText(
                      '80',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiKualitas == 80
                          ? debtor.analisaBisnis!.nilaiKualitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('c'),
                    descText('Cukup'),
                    alphabetText(
                      '70',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiKualitas == 70
                          ? debtor.analisaBisnis!.nilaiKualitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('d'),
                    descText('Kurang baik'),
                    alphabetText(
                      '60',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiKualitas == 60
                          ? debtor.analisaBisnis!.nilaiKualitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText('e'),
                    descText('Jelek'),
                    alphabetText(
                      '50',
                    ),
                    alphabetText(
                      debtor.analisaBisnis!.nilaiKualitas == 50
                          ? debtor.analisaBisnis!.nilaiKualitas.toString()
                          : '-',
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                //Tablerow with 6 columns sizedbox.shrink
              ],
            ),
            Container(height: 25),
            Table(
              border: TableBorder.symmetric(
                inside: const BorderSide(
                  color: PdfColors.grey,
                  width: 1,
                ),
                outside: const BorderSide(
                  color: PdfColors.white,
                  width: 1,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.15),
                2: const FlexColumnWidth(1.3),
                3: const FlexColumnWidth(0.5),
                4: const FlexColumnWidth(0.5),
                5: const FlexColumnWidth(0.5),
              },
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    alphabetText(''),
                    descText('Jumlah yang diisi (Max 10)'),
                    alphabetText(
                      '',
                    ),
                    alphabetText(
                      (toNum(debtor.analisaBisnis!.nilaiOmzet) +
                              toNum(debtor.analisaBisnis!.nilaiHargaBersaing) +
                              toNum(debtor.analisaBisnis!.nilaiPersaingan) +
                              toNum(debtor.analisaBisnis!.nilaiLokasiUsaha) +
                              toNum(debtor.analisaBisnis!.nilaiProduktivitas) +
                              toNum(debtor.analisaBisnis!.nilaiKualitas))
                          .toString(),
                    ),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    headerText('Avg CRR'),
                    alphabetText(
                        toDouble(debtor.analisaBisnis!.hasilCrrBisnis!.toInt())
                            .toStringAsFixed(1)),
                    SizedBox.shrink(),
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

Widget titleText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget alphabetText(
  final String text, {
  final TextAlign align = TextAlign.right,
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
