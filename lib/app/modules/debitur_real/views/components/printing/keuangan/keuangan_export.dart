// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import '../../../../../../models/debtor.dart';

// 📦 Package imports:

Future<Uint8List> makeAnalisaKeuanganPdf(Debtor debtor) async {
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
    title: 'Analisa Keuangan',
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

// Multipage

  pdf.addPage(
    Page(
      margin: const EdgeInsets.all(35),
      orientation: PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      // margin: const EdgeInsets.fromLTRB(
      //     0.24, 0.275590551181102, 0.196850393700787, 0.31496062992126),
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
                      'Analisa Keuangan',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.blue900,
                      ),
                    ),
                    // Text(debtor.peminjam1.toString()),
                    Text(
                      'Data Keuangan',
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
            Row(
              children: [
                Text(
                  '1. Jumlah aset yll           ',
                ),
                Spacer(),
                Text('Rp'),
                Spacer(),
                Text(MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(
                      debtor.analisaKeuangan!.totalAset.toString()),
                ).text),
                Spacer(
                  flex: 8,
                )
              ],
            ),
            Container(height: 2),
            Row(
              children: [
                Text(
                  '2. Equity / Modal          ',
                ),
                Spacer(),
                Text('Rp'),
                Spacer(),
                Text(MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(
                      debtor.inputRugiLaba!.jumlahModal.toString()),
                ).text),
                Spacer(
                  flex: 8,
                )
              ],
            ),
            Container(height: 2),
            Row(
              children: [
                Text(
                  '3. Pinjaman lain           ',
                ),
                Spacer(),
                Text('Rp'),
                Spacer(),
                Text(MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(
                      debtor.inputRugiLaba!.jumlahHutang.toString()),
                ).text),
                Spacer(
                  flex: 8,
                )
              ],
            ),

            Container(height: 25),
            Row(
              children: [
                Text(
                  '4. Kredit yang diajukan     ',
                ),
                Spacer(),
                Text('Rp   '),
                Spacer(),
                Text(MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(
                      debtor.inputKeuangan!.kreditDiusulkan.toString()),
                ).text),
                Spacer(),
                Text(
                    debtor.analisaKeuangan!.kreditDisetujuin == true
                        ? '                OK'
                        : 'NOPE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Spacer(
                  flex: 8,
                )
              ],
            ),
            Container(height: 25),
            Row(
              children: [
                Text(
                  '5. Jumlah aset kini         ',
                ),
                Spacer(),
                Text('Rp'),
                Spacer(),
                Text(MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(debtor
                      .analisaKeuangan!.totalAngsuranKeseluruhan
                      .toString()),
                ).text),
                Spacer(
                  flex: 8,
                )
              ],
            ),
            Container(height: 15),
            Table(
              border: TableBorder.all(),
              tableWidth: TableWidth.max,
              columnWidths: {
                0: const FlexColumnWidth(0.35),
                1: const FlexColumnWidth(1.65),
                2: const FlexColumnWidth(1),
                3: const FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Asumsi Keuangan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Kini',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Yad',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '%kini',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '%yad',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    paddedTextDescription('1'),
                    paddedTextDescription('a. Omzet/bulan kotor'),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.penjualanKini.toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.penjualanAsumsi.toString()),
                    ).text),
                    paddedText('100'),
                    paddedText('100'),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('b. Biaya bahan/bulan'),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaBahanKini.toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaBahanAsumsi.toString()),
                    ).text),
                    paddedText(debtor.analisaKeuangan!.persenBiayaBahanKini
                        .toString()),
                    paddedText(
                        debtor.analisaKeuangan!.persenBiayaBahanYad.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('c. Upah/bulan'),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaUpahKini.toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaUpahAsumsi.toString()),
                    ).text),
                    paddedText(
                        debtor.analisaKeuangan!.persenBiayaUpahKini.toString()),
                    paddedText(
                        debtor.analisaKeuangan!.persenBiayaUpahYad.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('d. Biaya operasi'),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(debtor
                          .inputKeuangan!.biayaOperasionalKini
                          .toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(debtor
                          .inputKeuangan!.biayaOperasionalAsumsi
                          .toString()),
                    ).text),
                    paddedText(debtor.analisaKeuangan!.persenBiayaOperasiKini
                        .toString()),
                    paddedText(debtor.analisaKeuangan!.persenBiayaOperasiYad
                        .toString()),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('e. Biaya hidup/bulan'),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaHidupKini.toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.biayaHidupAsumsi.toString()),
                    ).text),
                    paddedText(debtor.analisaKeuangan!.persenBiayaHidupKini
                        .toString()),
                    paddedText(
                        debtor.analisaKeuangan!.persenBiayaHidupYad.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Laba Usaha :',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(debtor
                          .analisaKeuangan!.totalLabaUsahaKini
                          .toString()),
                    ).text),
                    paddedText(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.analisaKeuangan!.totalLabaUsahaYad.toString()),
                    ).text),
                    paddedText(
                        debtor.analisaKeuangan!.persenLabaUsahaKini.toString()),
                    paddedText(
                        debtor.analisaKeuangan!.persenLabaUsahaYad.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Analisa Ratio',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    paddedTextDescription('2'),
                    paddedTextDescription('a. Ratio profit'),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenRatioKini
                              .toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                      toDouble(
                              debtor.analisaKeuangan!.persenRatioYad.toString())
                          .toStringAsFixed(1),
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('b. ROE (min 10%)'),
                    paddedTextBold(
                        debtor.analisaKeuangan!.persenRoeKini.toString()),
                    paddedTextBold(
                        debtor.analisaKeuangan!.persenRoeYad.toString()),
                    paddedText(
                        debtor.analisaKeuangan!.keteranganRoe.toString()),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('c. ROA (min 8%)'),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenRoaKini.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenRoaYad.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedText(
                        debtor.analisaKeuangan!.keteranganRoa.toString()),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('d. DER (max 200%)'),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenDerKini.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenDerYad.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                        debtor.analisaKeuangan!.keteranganDer.toString()),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('e. DSC (min 1.3 kali)'),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenDscKini.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.persenDscYad.toString())
                          .toStringAsFixed(1),
                    ),
                    paddedTextBold(
                        debtor.analisaKeuangan!.keteranganDsc.toString()),
                    SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            Container(height: 15),
            Table(
              tableWidth: TableWidth.max,
              columnWidths: {
                0: const FlexColumnWidth(0.35),
                1: const FlexColumnWidth(1.65),
                2: const FlexColumnWidth(1),
                3: const FlexColumnWidth(1),
                4: const FlexColumnWidth(0.1),
                5: const FlexColumnWidth(0.1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.full,
              children: [
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    paddedTextBold(
                      'CRR',
                    ),
                    paddedTextBold(
                      toDouble(debtor.analisaKeuangan!.totalCrrKeuangan
                              .toString())
                          .toStringAsFixed(2),
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      '.',
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescription('PINJAMAN MAKSIMAL'),
                    SizedBox.shrink(),
                    paddedText(
                      MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(debtor
                            .analisaKeuangan!.pinjamanMaksimal
                            .toString()),
                      ).text,
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    paddedTextDescriptionBold('Perhitungan Investasi'),
                    paddedText('Biaya/bln'),
                    paddedText(
                      MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(debtor
                            .analisaKeuangan!.perhitunganModalKerja
                            .toString()),
                      ).text,
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    paddedText('Perputaran mk'),
                    paddedText(
                      toDouble(debtor.inputKeuangan!.tradeCycle.toString())
                          .toStringAsFixed(1),
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    paddedTextBold('Keb Investasi'),
                    paddedText(
                      MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(debtor
                            .analisaKeuangan!.kebutuhanInvestasi
                            .toString()),
                      ).text,
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    paddedTextBold('Keb Kredit'),
                    paddedText(
                      MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        initialValue: double.parse(
                            debtor.analisaKeuangan!.kebutuhanKredit.toString()),
                      ).text,
                    ),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            Container(height: 45),
            // Make a paragraph
            Paragraph(
              text: 'Data Keuangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Paragraph(
              text:
                  'Butir 1 : jumlah asset adalah kekayaan pengusaha tempat dia berusaha, termasuk hutang.',
              margin: const EdgeInsets.symmetric(vertical: 1),
            ),
            Paragraph(
              text:
                  'Butir 2 : Modal pengusaha sendiri yg terlibat dalam usaha mikro',
              margin: const EdgeInsets.symmetric(vertical: 1),
            ),
            Paragraph(
              margin: const EdgeInsets.symmetric(vertical: 1),
              text:
                  'Butir 3 : Pinjaman lain dimaksudkan adalah pinjaman dari pihak lain yang diterima, atau hutang dagang kepada pemasok.',
            ),
            Paragraph(
              margin: const EdgeInsets.symmetric(vertical: 1),
              text: 'Butir 4 : Jelas',
            ),
            Paragraph(
              margin: const EdgeInsets.symmetric(vertical: 1),
              text:
                  'Butir 5 : Jumlah asset setelah memperoleh kredit bank meliputi euity /modal dan seluruh hutang',
            ),
            Container(height: 80),
            Footer(
              trailing:
                  Text('Page ${context.pageNumber} of ${context.pagesCount}'),
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
        // margin: const EdgeInsets.fromLTRB(
        //     0.24, 0.275590551181102, 0.196850393700787, 0.31496062992126),
        build: (context) {
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Analisa Keuangan',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.blue900,
                        ),
                      ),
                      // Text(debtor.peminjam1.toString()),
                      Text(
                        'Tabel Angsuran',
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
              Container(height: 35),
              Paragraph(
                  text:
                      'Keterangan: Tabel bunga atas untuk pinjaman bank lain dan yang bawah untuk pinjaman kredit BPD DIY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.only(right: 185)),
              Container(height: 15),
              Table(
                border: TableBorder.all(),

                tableWidth: TableWidth.max,
                // columnWidths: {
                //   0: const FlexColumnWidth(0.35),
                //   1: const FlexColumnWidth(1.65),
                //   2: const FlexColumnWidth(1),
                //   3: const FlexColumnWidth(1),
                // },
                defaultVerticalAlignment: TableCellVerticalAlignment.full,
                children: [
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      paddedTextDescription('Bunga/thn'),
                      paddedTextDescription(' - %'),
                      paddedText('Ang (P+B)'),
                      paddedText(' - Bln'),
                      SizedBox.shrink(),
                      paddedText('-'),
                    ],
                  ),
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      paddedText('Ang (P+B)'),
                      paddedText(' - Bln'),
                      SizedBox.shrink(),
                      paddedText('-'),
                    ],
                  ),
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      Text('.'),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                    ],
                  ),
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      paddedTextDescription('Bunga/thn'),
                      paddedTextDescription(
                          '${debtor.inputKeuangan!.bungaPerTahun.toString()} %'),
                      paddedText('Ang (P+B)'),
                      paddedText(
                          '${debtor.inputKeuangan!.angsuran.toString()} Bln'),
                      SizedBox.shrink(),
                      paddedText(MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        leftSymbol: 'Rp  ',
                        initialValue: double.parse(
                          debtor.inputKeuangan!.angsuranRp.toString(),
                        ),
                      ).text),
                    ],
                  ),
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      Text('.'),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                    ],
                  ),
                  TableRow(
                    verticalAlignment: TableCellVerticalAlignment.full,
                    children: [
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      paddedTextDescription('Total Angsuran'),
                      paddedText(MoneyMaskedTextController(
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                        leftSymbol: 'Rp  ',
                        initialValue: double.parse(
                          debtor.inputKeuangan!.angsuranRp.toString(),
                        ),
                      ).text),
                    ],
                  ),
                ],
              ),
              Container(height: 520),
              Footer(
                trailing:
                    Text('Page ${context.pageNumber} of ${context.pagesCount}'),
              ),
            ],
          );
        }),
  );

  return pdf.save();
}

Widget paddedText(
  final String text, {
  final TextAlign align = TextAlign.right,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        textAlign: align,
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

// convert string to double
double toDouble(String text) {
  final String newText = text.replaceAll(',', '.');
  return double.parse(newText);
}
