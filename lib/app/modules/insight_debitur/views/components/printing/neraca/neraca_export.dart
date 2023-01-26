// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/inputan/inputan_export.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';

Future<Uint8List> makeNeracaPdf(DebiturInsight debtor) async {
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
    title: 'Neraca',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.04),
                1: const FlexColumnWidth(0.96),
              },
              tableWidth: TableWidth.min,
              children: [
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Penjelasan Pos Neraca'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur(
                        'Penjelasan mengenai pos neraca adalah menunjukkan besarnya pos neraca posisi :'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    Align(
                        alignment: Alignment.centerRight,
                        child: textUmur(DateFormat('EEEE, dd MMMM yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString())))),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('1.'),
                        textUmurBoldLeft('Kas dan Bank'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah kas dan saldo simpanan di bank, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Kas On Hand'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.kasOnHand.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Tabungan'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.tabungan.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(debtor
                              .inputNeraca!.jumlahKasDanTabungan
                              .toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('2.'),
                        textUmurBoldLeft('Piutang'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah piutang, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Piutang'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.jumlahPiutang.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.jumlahPiutang.toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('3.'),
                        textUmurBoldLeft('Persediaan'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah persediaan bahan baku, barang dagangan yang berhubungan usaha, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.jumlahPersediaan.toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('4.'),
                        textUmurBoldLeft('Hutang Usaha'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah hutang usaha, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.hutangUsaha.toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('5.'),
                        textUmurBoldLeft('Hutang Bank'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah hutang bank, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.pinjamanLain.toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('6.'),
                        textUmurBoldLeft('Hutang Lainnya'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah hutang lainnya, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.hutangBank.toString()),
                        ).text),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.04),
                    1: const FlexColumnWidth(0.96),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        textUmur('7.'),
                        textUmurBoldLeft('Aktiva Tetap'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(
                            'Perkiraan ini menunjukkan jumlah nilai buku aktiva yang dimiliki, sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Table(
                  border: // border all
                      TableBorder.all(color: PdfColors.black, width: 0.5),
                  columnWidths: {
                    0: const FlexColumnWidth(0.75),
                    1: const FlexColumnWidth(0.25),
                  },
                  tableWidth: TableWidth.min,
                  children: [
                    TableRow(
                      children: [
                        Center(child: textUmur('Keterangan')),
                        textUmurR(DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                                debtor.inputNeraca!.tanggalInput.toString()))),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Peralatan/Mesin'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.peralatan.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Kendaraan'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.kendaraan.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Tanah dan Bangunan'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.tanahDanBangunan.toString()),
                        ).text),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Jumlah'),
                        textUmur(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputNeraca!.aktivaTetap.toString()),
                        ).text),
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
