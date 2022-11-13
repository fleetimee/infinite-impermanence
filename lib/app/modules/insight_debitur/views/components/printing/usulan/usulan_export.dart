// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/views/components/printing/inputan/inputan_export.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
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

  var agunanList = debtor.agunan;

  Agunan agunanTanah = agunanList!.any((element) => element.kodeAgunan == 1)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 1))
      : Agunan();

  Agunan agunanTanahBangunan =
      agunanList.any((element) => element.kodeAgunan == 2)
          ? agunanList.elementAt(
              agunanList.indexWhere((element) => element.kodeAgunan == 2))
          : Agunan();

  Agunan agunanKendaraan = agunanList.any((element) => element.kodeAgunan == 3)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 3))
      : Agunan();

  Agunan agunanPeralatan = agunanList.any((element) => element.kodeAgunan == 4)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 4))
      : Agunan();

  Agunan agunanCash = agunanList.any((element) => element.kodeAgunan == 5)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 5))
      : Agunan();

  Agunan agunanLos = agunanList.any((element) => element.kodeAgunan == 6)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 6))
      : Agunan();

  Agunan agunanLainnya = agunanList.any((element) => element.kodeAgunan == 7)
      ? agunanList.elementAt(
          agunanList.indexWhere((element) => element.kodeAgunan == 7))
      : Agunan();

  var formAgunanTanah = agunanTanah.formTanah;
  var formAgunanTanahBangunan = agunanTanahBangunan.formTanahBangunan;
  var formKendaraan = agunanKendaraan.formKendaraan;
  var formPeralatan = agunanPeralatan.formPeralatan;
  var formCash = agunanCash.formCash;
  var formLos = agunanLos.formLos;
  var formLainnya = agunanLainnya.formLainnya;

  var syaratList = debtor.syaratLain;
  const premi = 3.34;

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

  var gradeKeterangan = totalCrrAll > 90 && totalCrrAll <= 100
      ? 'Excellent'
      : totalCrrAll > 79.01 && totalCrrAll <= 90
          ? 'Baik sekali'
          : totalCrrAll > 69.01 && totalCrrAll <= 79
              ? 'Baik'
              : totalCrrAll > 64.01 && totalCrrAll <= 69
                  ? 'Cukup Baik'
                  : totalCrrAll > 59.01 && totalCrrAll <= 64
                      ? 'Cukup'
                      : totalCrrAll > 54.01 && totalCrrAll <= 59
                          ? 'Agak Kurang'
                          : totalCrrAll > 49.01 && totalCrrAll <= 54
                              ? 'Kurang'
                              : 'Kurang Sekali';

  final gradeAlphabet = totalCrrAll > 90
      ? 'AAA'
      : totalCrrAll > 80
          ? 'AA'
          : totalCrrAll > 70
              ? 'A'
              : totalCrrAll > 65
                  ? 'BB'
                  : totalCrrAll > 60
                      ? 'B'
                      : totalCrrAll > 54
                          ? 'C'
                          : totalCrrAll > 50
                              ? 'D'
                              : 'E';

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
            SizedBox(height: 10),
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.714),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur('Kepada'),
                        textUmurR(':'),
                        textUmurBoldLeft('Adi Nugraha'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Dari'),
                        textUmurR(':'),
                        textUmurBoldLeft('Sumaryanto'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('Hal'),
                        textUmurR(':'),
                        textUmur('Usulan Kredit Mikro a/n ${debtor.peminjam1}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur(
                            'Sesuai permohonan kredit mikro dari nama berikut ini, dengan ini kami sampaikan '),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur(
                            'hasil analisa/perhitungan dan usulan kredit sebagai berikut :'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.2856),
                    3: const FlexColumnWidth(0.4284),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Peminjam'),
                        textUmurBoldLeft(': 1. ${debtor.peminjam1.toString()}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur(''),
                        debtor.peminjam2 == '' || debtor.peminjam2 == null
                            ? textUmur('  2. -')
                            : textUmurBoldLeft(
                                '  2. ${debtor.peminjam2.toString()}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur(''),
                        debtor.peminjam3 == '' || debtor.peminjam3 == null
                            ? textUmurBoldLeft('  3. -')
                            : textUmurBoldLeft(
                                '  3. ${debtor.peminjam3.toString()}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur(''),
                        debtor.peminjam4 == '' || debtor.peminjam4 == null
                            ? textUmurBoldLeft('  4. -')
                            : textUmurBoldLeft(
                                ' 4. ${debtor.peminjam4.toString()}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Jenis Usaha'),
                        textUmurBoldLeft(
                            ': ${debtor.jenisUsaha} ${debtor.bidangUsaha}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Lokasi Usaha'),
                        textUmurBoldLeft(': ${debtor.lokasiUsaha}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Plafond Kredit'),
                        textUmurBoldLeft(': ${MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.kreditDiusulkan.toString()),
                        ).text}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Keperluan Kredit'),
                        textUmurBoldLeft(
                            ': ${debtor.inputKeuangan!.digunakanUntuk}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Jenis Kredit'),
                        textUmurBoldLeft(
                            ': UMKM/${debtor.jenisUsaha}/${double.parse(debtor.inputRugiLaba!.omzet.toString()) <= 100000000 ? "Mikro" : "Kecil"}/Angsuran Tetap/${double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) > 25000000 ? "KUR Kecil" : "KUR Mikro"}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Jangka Waktu'),
                        textUmurBoldLeft(
                            ': ${debtor.inputKeuangan!.angsuran} Bulan'),
                      ],
                    ),
                  ],
                ),
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.2856),
                    3: const FlexColumnWidth(0.2142),
                    4: const FlexColumnWidth(0.2142),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Angsuran'),
                        textUmurBoldLeft(': ${MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.angsuranRp.toString()),
                        ).text}'),
                        textUmurBold('')
                      ],
                    ),
                  ],
                ),
                Table(
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.2856),
                    3: const FlexColumnWidth(0.4284),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Suku Bunga'),
                        textUmurBoldLeft(
                            ': ${debtor.inputKeuangan!.bungaPerTahun} %'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Denda'),
                        textUmurBoldLeft(': 50% dari suku bunga yang berlaku'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Denda Pelunasan Dipercepat'),
                        textUmurBoldLeft(': -'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Provisi Kredit'),
                        textUmurBoldLeft(': -'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Asuransi Penjaminan Kredit'),
                        textUmurBoldLeft(': ${MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(debtor
                                  .inputKeuangan!.kreditDiusulkan
                                  .toString()) *
                              premi /
                              100,
                        ).text}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurR(''),
                        textUmur('Agunan'),
                        textUmurBoldLeft(': '),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            // Table Agunan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  border: TableBorder.all(
                    color: PdfColors.black,
                    width: 0.5,
                  ),
                  columnWidths: {
                    0: const FlexColumnWidth(0.1015),
                    1: const FlexColumnWidth(0.047),
                    2: const FlexColumnWidth(0.1428),
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur('#'),
                        textUmur('#'),
                        textUmur('Jenis Agunan'),
                        textUmurBoldLeft('Bukti Kepemilikan'),
                        textUmur('Nilai Agunan'),
                        textUmur('#'),
                      ],
                    ),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Tanah'),
                        formAgunanTanah != null
                            ? textUmurBoldLeft(formAgunanTanah
                                .map((e) => e.buktiKepemilikan)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formAgunanTanah != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formAgunanTanah
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Tanah dan Bangunan'),
                        formAgunanTanahBangunan != null
                            ? textUmurBoldLeft(formAgunanTanahBangunan
                                .map((e) => e.buktiKepemilikan)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formAgunanTanahBangunan != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(
                                        formAgunanTanahBangunan
                                            .fold<int>(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue +
                                                    int.parse(element.nilaiPasar
                                                        .toString()))
                                            .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Kendaraan'),
                        formKendaraan != null
                            ? textUmurBoldLeft(formKendaraan
                                .map((e) => e.noBpkb)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formKendaraan != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formKendaraan
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Mesin dan Peralatan'),
                        formPeralatan != null
                            ? textUmurBoldLeft(formPeralatan
                                .map((e) => e.deskripsiPanjang)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formPeralatan != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formPeralatan
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Cash'),
                        formCash != null
                            ? textUmurBoldLeft(formCash
                                .map((e) => e.deskripsiPanjang)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formCash != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formCash
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                        textUmur(''),
                        textUmur('Kios Pasar'),
                        formLos != null
                            ? textUmurBoldLeft(formLos
                                .map((e) => e.noRegistrasi)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formLos != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formLos
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
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
                          bottom: BorderSide(
                            color: PdfColors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        textUmur(''),
                        textUmur(''),
                        textUmur('Lainnya'),
                        formLainnya != null
                            ? textUmurBoldLeft(formLainnya
                                .map((e) => e.deskripsiPanjang)
                                .toList()
                                .join(', '))
                            : textUmurBoldLeft('-'),
                        formLainnya != null
                            ? textUmurR(MoneyMaskedTextController(
                                    precision: 0,
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    initialValue: double.parse(formLainnya
                                        .fold<int>(
                                            0,
                                            (previousValue, element) =>
                                                previousValue +
                                                int.parse(element.nilaiPasar
                                                    .toString()))
                                        .toString()))
                                .text)
                            : textUmurR('-'),
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
                    3: const FlexColumnWidth(0.2856),
                    4: const FlexColumnWidth(0.1428),
                    5: const FlexColumnWidth(0.1428),
                  },
                  children: [
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur(''),
                        textUmur('Jumlah'),
                        textUmurBoldLeft(''),
                        textUmurR(MoneyMaskedTextController(
                                precision: 0,
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                initialValue: double.parse(debtor
                                    .analisaAgunan!.totalAgunan
                                    .toString()))
                            .text),
                        textUmur(''),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Table Bobot
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        textUmurBold(gradeAlphabet),
                        textUmurBoldLeft(gradeKeterangan)
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
