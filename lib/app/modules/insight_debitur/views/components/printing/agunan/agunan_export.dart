// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

Future<Uint8List> makeAgunanPdf(DebiturInsight debtor) async {
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load('assets/fonts/times-new-roman.ttf')),
    bold: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold.ttf')),
    boldItalic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold-italic.ttf')),
    italic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-italic.ttf')),
  );

  // Get list of agunan
  var agunanList = debtor.agunan;

  // Specify agunan for each type
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

  final pdf = Document(
    theme: myTheme,
    title: 'Agunan',
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
              border: TableBorder.all(width: 0.5),
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
                2: const FlexColumnWidth(0.25),
                3: const FlexColumnWidth(0.25),
              },
              children: [
                TableRow(
                  children: [
                    textUmurTinggi('No'),
                    textUmurTinggi('Jenis Agunan'),
                    textUmurTinggi('Nilai Agunan'),
                    textUmurTinggi('Keterangan')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('1'),
                    textUmur('Tanah'),
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    formAgunanTanah != null
                        ? textUmur(formAgunanTanah
                            .map((e) => e.buktiKepemilikan)
                            .toList()
                            .join(', '))
                        : textUmur('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('2'),
                    textUmur('Tanah dan Bangunan'),
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
                    formAgunanTanahBangunan != null
                        ? textUmur(formAgunanTanahBangunan
                            .map((e) => e.buktiKepemilikan)
                            .toList()
                            .join(', '))
                        : textUmurR('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('3'),
                    textUmur('Kendaraan'),
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    formKendaraan != null
                        ? textUmur(formKendaraan
                            .map((e) => e.noBpkb)
                            .toList()
                            .join(', '))
                        : textUmurR('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('4'),
                    textUmur('Mesin & Peralatan'),
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    formPeralatan != null
                        ? textUmur(formPeralatan
                            .map((e) => e.deskripsiPanjang)
                            .toList()
                            .join(', '))
                        : textUmurR('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('5'),
                    textUmur('Cash Collateral'),
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    formCash != null
                        ? textUmur(formCash
                            .map((e) => e.deskripsiPanjang)
                            .toList()
                            .join(', '))
                        : textUmurR('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('6'),
                    textUmur('Kios Pasar'),
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    formLos != null
                        ? textUmur(formLos
                            .map((e) => e.deskripsiPendek)
                            .toList()
                            .join(', '))
                        : textUmurR('-')
                  ],
                ),
              ],
            ),
            Table(
              columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.20),
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
                    textUmurR('7'),
                    textUmur('Lainnya'),
                    formLainnya != null
                        ? textUmur(MoneyMaskedTextController(
                                precision: 0,
                                leftSymbol: 'Rp. ',
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                initialValue: double.parse(formLainnya
                                    .fold<int>(
                                        0,
                                        (previousValue, element) =>
                                            previousValue +
                                            int.parse(
                                                element.nilaiPasar.toString()))
                                    .toString()))
                            .text)
                        : textUmurR('-'),
                    textUmurR('-')
                  ],
                ),
              ],
            ),
          ],
        )
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

Widget textUmurTinggi(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
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
