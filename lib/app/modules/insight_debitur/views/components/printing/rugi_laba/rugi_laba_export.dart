// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';

Future<Uint8List> makeRugilabaPdf(DebiturInsight debtor) async {
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
    title: 'Rugi Laba',
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
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                header('ANALISIS KREDIT'),
              ],
            ),
          ],
        ),
        SizedBox(height: 25),
        Table(
          children: [
            TableRow(
              children: [
                header('LAPORAN KEUANGAN'),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.22),
            1: const FlexColumnWidth(0.03),
            2: const FlexColumnWidth(0.75),
          },
          children: [
            TableRow(
              children: [
                textUmur('Nama Debitur'),
                textUmur(':'),
                textUmur(debtor.peminjam1.toString()),
              ],
            ),
            TableRow(
              children: [
                textUmur('Alamat'),
                textUmur(':'),
                textUmur(debtor.alamat1.toString()),
              ],
            ),
            TableRow(
              children: [
                textUmur('No. SKPK'),
                textUmur(':'),
                textUmur(debtor.noSkpk.toString()),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Table(
          children: [
            TableRow(
              children: [
                header('PERKIRAAN NERACA'),
              ],
            ),
            TableRow(
              children: [
                headerSmol(
                    'Per Tanggal ${DateFormat('dd MMMM yyyy', 'id_ID').format(
                  DateTime.parse(debtor.inputNeraca!.tanggalInput.toString())
                      .subtract(Duration(
                          days: DateTime.parse(
                                  debtor.inputNeraca!.tanggalInput.toString())
                              .day))
                      .add(const Duration(days: 1))
                      .subtract(
                        const Duration(days: 1),
                      ),
                )}')
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Center(child: textUmur('AKTIVA')),
                    textUmur(''),
                    textUmur(''),
                    Center(child: textUmur('PASSIVA')),
                  ],
                )
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Aktiva Lancar'),
                    textUmur(''),
                    textUmur('Hutang'),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('1. Kas'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue:
                          double.parse(debtor.inputRugiLaba!.kas.toString()),
                    ).text),
                    textUmur('1. Hutang Dagang'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.hutangUsaha.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('2. Bank'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue:
                          double.parse(debtor.inputRugiLaba!.bank.toString()),
                    ).text),
                    textUmur('2. Hutang Bank'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.hutangBank.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('3. Piutang Dagang'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.piutang.toString()),
                    ).text),
                    textUmur('3. Hutang Lainnya'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.hutangLainnya.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('4. Persediaan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.persediaan.toString()),
                    ).text),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur(
                      '.',
                    ),
                    textUmurR(''),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    textUmur('Jumlah Aktiva Lancar'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.jumlahAktivaLancar.toString()),
                    ).text),
                    textUmur('Jumlah Hutang'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.jumlahHutang.toString()),
                    ).text),
                  ],
                )
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur(
                      '.',
                    ),
                    textUmurR(''),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Aktiva Tetap'),
                    textUmurR(''),
                    textUmur('Modal'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.jumlahModal.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('1. Peralatan/Mesin'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.peralatan.toString()),
                    ).text),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('2. Kendaraan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.kendaraan.toString()),
                    ).text),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('3. Tanah dan Bangunan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.tanahDanBangunan.toString()),
                    ).text),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur(
                      '.',
                    ),
                    textUmurR(''),
                    textUmur(''),
                    textUmurR(''),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    textUmur('Jumlah Aktiva Tetap'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.jumlahAktivaTetap.toString()),
                    ).text),
                    textUmur('Jumlah Modal'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.jumlahModal.toString()),
                    ).text),
                  ],
                )
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.25),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    textUmur('Jumlah Aktiva'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.sumAktiva.toString()),
                    ).text),
                    textUmur('Jumlah Pasiva'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.sumPasiva.toString()),
                    ).text),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Table(
          children: [
            TableRow(
              children: [
                header('PERKIRAAN LABA/RUGI'),
              ],
            ),
            TableRow(
              children: [
                headerSmol(
                    'Periode Bulan ${DateFormat('dd MMMM yyyy', 'id_ID').format(
                  DateTime.parse(debtor.inputNeraca!.tanggalInput.toString())
                      .subtract(Duration(
                          days: DateTime.parse(
                                  debtor.inputNeraca!.tanggalInput.toString())
                              .day))
                      .add(const Duration(days: 1))
                      .subtract(
                        const Duration(days: 1),
                      ),
                )}')
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: {},
              children: [
                TableRow(
                  children: [
                    textUmur('Perkiraan Penjualan'),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.75),
                1: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Omzet Penjualan rata rata perbulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue:
                          double.parse(debtor.inputRugiLaba!.omzet.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 0.5, color: PdfColors.black),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.75),
                1: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Harga pokok penjualan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.hargaPokok.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(0.75),
                1: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    Center(child: textUmur('Laba Kotor')),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.labaKotor.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.50),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Biaya :'),
                    textUmurR(''),
                    textUmur(''),
                  ],
                )
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.50),
                1: const FlexColumnWidth(0.25),
                2: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('1. Biaya Tenaga Kerja'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.biayaTenagaKerja.toString()),
                    ).text),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('2. Biaya Operasional'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.biayaOperasional.toString()),
                    ).text),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('3. Biaya Lainnya'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.biayaLainnya.toString()),
                    ).text),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(0.75),
                1: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    Center(child: textUmur('Total Biaya')),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.totalBiaya.toString()),
                    ).text),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    Center(child: textUmur('Laba Sebelum Pajak (EBIT)')),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.labaSebelumPajak.toString()),
                    ).text),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    Center(child: textUmur('Perkiraan Pajak')),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.perkiraanPajak.toString()),
                    ).text),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    Center(child: textUmur('Laba Setelah Pajak')),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.labaSetelahPajak.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    header('PERKIRAAN PENGHASILAN PER BULAN'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(0.75),
                1: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Penghasilan rata-rata per bulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.labaSetelahPajak.toString()),
                    ).text),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Biaya hidup rata - rata per bulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.biayaHidup.toString()),
                    ).text),
                  ],
                ),
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                      right: BorderSide(
                        width: 0.5,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  children: [
                    textUmur('Sisa penghasilan bersih per bulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.sisaPenghasilan.toString()),
                    ).text),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.21),
            1: const FlexColumnWidth(0.04),
            2: const FlexColumnWidth(0.75),
          },
          children: [
            TableRow(
              children: [
                textUmur('Tanggal'),
                textUmur(': '),
                textUmur(''),
              ],
            ),
          ],
        ),
        SizedBox(height: 75),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.21),
            1: const FlexColumnWidth(0.04),
            2: const FlexColumnWidth(0.75),
          },
          children: [
            TableRow(
              children: [
                textUmur('Ttd Tangan'),
                textUmur(': '),
                textUmur(''),
              ],
            )
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

Widget header(
  final String text, {
  final TextAlign align = TextAlign.center,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );

Widget headerSmol(
  final String text, {
  final TextAlign align = TextAlign.center,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
