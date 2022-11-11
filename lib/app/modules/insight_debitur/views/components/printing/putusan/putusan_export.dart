// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import '../print_widget.dart';

// 📦 Package imports:

Future<Uint8List> makePutusanPdf(DebiturInsight debtor) async {
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

  final controller = Get.put(InsightDebiturController());

  // Get list of syarat lain
  var syaratList = debtor.syaratLain;

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

  // Get total leghth of all agunan
  var totalLength = (formAgunanTanah?.length ?? 0) +
      (formAgunanTanahBangunan?.length ?? 0) +
      (formKendaraan?.length ?? 0) +
      (formPeralatan?.length ?? 0) +
      (formCash?.length ?? 0) +
      (formLos?.length ?? 0) +
      (formLainnya?.length ?? 0);

  // final controller = Get.put(InsightDebiturController());

  // logo
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/pdf/logo.png'))
          .buffer
          .asUint8List());

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
      margin: const EdgeInsets.all(40),
      orientation: PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        // Header
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(1),
                1: const FlexColumnWidth(0.2),
                2: const FlexColumnWidth(1),
              },
              tableWidth: TableWidth.max,
              children: [
                TableRow(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(imageLogo),
                    ),
                    SizedBox.shrink(),
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(1),
                        1: const FlexColumnWidth(0.85),
                      },
                      border: TableBorder.symmetric(
                        outside: const BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                      children: [
                        TableRow(
                          children: [
                            textUmur('Tgl rapat komite kredit'),
                            textUmurR('March 2022')
                          ],
                        ),
                        TableRow(
                          children: [
                            textUmur('Nomor MKK'),
                            textUmurR('MKK/2021/03/01')
                          ],
                        ),
                        TableRow(
                          children: [
                            textUmur('No SKPK'),
                            textUmurR('SKPK/2021/03/01')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('.'),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    textUmurRB('PUTUSAN KREDIT'),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
              // border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(0.45),
                1: const FlexColumnWidth(1),
              },
              tableWidth: TableWidth.max,
              children: [
                TableRow(
                  children: [
                    textDeskripsiNoBold('Nama Pemohon'),
                    textDeskripsi(debtor.peminjam1.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Alamat'),
                    textDeskripsi(debtor.alamat1.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Jenis Kredit'),
                    textDeskripsi(
                        debtor.inputKeuangan?.digunakanUntuk.toString() ?? ''),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Plafon Kredit'),
                    textDeskripsi(
                      "Rp ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString())).text} ( ${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()))} Rupiah )",
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    textDeskripsiNoBold('Kolektabilitas'),
                    textDeskripsi(
                      "Lancar",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Konten
        Table(
          tableWidth: TableWidth.max,
          children: [
            TableRow(
              children: [
                Text('.', style: const TextStyle(color: PdfColors.white)),
              ],
            ),
            TableRow(
              children: [
                contentText(
                    'DISETUJUI: Untuk Kredit Baru Atas Nama ${debtor.peminjam1}'),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                textUmurL(
                    'Dalam hal ini agar diperhatikan bentuk persyaratan baku sebagai berikut : ')
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.07),
            1: const FlexColumnWidth(0.38),
            2: const FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                textDeskripsiNoBold('1.'),
                textDeskripsiNoBold("Debitur"),
                textDeskripsiNoBold("1. ${debtor.peminjam1}"),
              ],
            ),
            TableRow(
              children: [
                SizedBox.shrink(),
                SizedBox.shrink(),
                debtor.peminjam2 == ''
                    ? textDeskripsiNoBold("2. -")
                    : textDeskripsiNoBold("2. ${debtor.peminjam2}"),
              ],
            ),
            TableRow(
              children: [
                SizedBox.shrink(),
                SizedBox.shrink(),
                debtor.peminjam3 == ''
                    ? textDeskripsiNoBold("3. -")
                    : textDeskripsiNoBold("3. ${debtor.peminjam3}"),
              ],
            ),
            TableRow(
              children: [
                SizedBox.shrink(),
                SizedBox.shrink(),
                debtor.peminjam4 == ''
                    ? textDeskripsiNoBold("4. -")
                    : textDeskripsiNoBold("4. ${debtor.peminjam4}"),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('2.'),
                textDeskripsiNoBold("Pemilik Agunan"),
                textDeskripsiNoBold("1. ${debtor.pemilikAgunan1}"),
              ],
            ),
            TableRow(
              children: [
                SizedBox.shrink(),
                SizedBox.shrink(),
                debtor.pemilikAgunan2 == ''
                    ? textDeskripsiNoBold("2. -")
                    : textDeskripsiNoBold("2. ${debtor.pemilikAgunan2}"),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('3.'),
                textDeskripsiNoBold("Plafon Kredit"),
                textDeskripsiNoBold(
                  "Rp ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString())).text} ( ${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()))} Rupiah )",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('4.'),
                textDeskripsiNoBold("Keperluan Kredit"),
                textDeskripsiNoBold(
                  debtor.inputKeuangan!.digunakanUntuk.toString(),
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('5.'),
                textDeskripsiNoBold("Jenis Kredit"),
                textDeskripsiNoBold(
                  "UMKM/${double.parse(debtor.inputRugiLaba!.omzet.toString()) <= 100000000 ? "Mikro" : "Kecil"}/Angsuran Tetap/${double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) > 25000000 ? "KUR Kecil" : "KUR Mikro"}",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('6.'),
                textDeskripsiNoBold("Jangka Waktu"),
                textDeskripsiNoBold(
                  "${debtor.inputKeuangan!.angsuran.toString()} (${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.angsuran.toString()))}) Bulan",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('7.'),
                textDeskripsiNoBold("Angsuran per bulan"),
                textDeskripsiNoBold(
                  "Rp. ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.angsuranRp!.toString())).text}",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('8.'),
                textDeskripsiNoBold("Bunga kredit"),
                textDeskripsiNoBold(
                  "${debtor.inputKeuangan!.bungaPerTahun.toString()}% efektif floating rate per tahun",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('9.'),
                textDeskripsiNoBold("Denda"),
                textDeskripsiNoBold(
                  "50% dari suku bunga yang berlaku",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('10.'),
                textDeskripsiNoBold("Denda Pelunasan"),
                textDeskripsiNoBold(
                  "-",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('11.'),
                textDeskripsiNoBold("Provisi Kredit"),
                textDeskripsiNoBold(
                  "-",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('12.'),
                textDeskripsiNoBold("Biaya Administrasi"),
                textDeskripsiNoBold(
                  "-",
                ),
              ],
            ),
            TableRow(
              children: [
                textDeskripsiNoBold('13.'),
                textDeskripsiNoBold("Biaya Materai"),
                textDeskripsiNoBold(
                  "Sesuai ketentuan",
                ),
              ],
            ),
          ],
        ),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.07),
            1: const FlexColumnWidth(0.38),
            2: const FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                textDeskripsiNoBold('14.'),
                textDeskripsiNoBold('Agunan'),
                textDeskripsiNoBold(
                    'Debitur ini memiliki ${(totalLength + 1)} agunan diantara lain :'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        formAgunanTanah != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formAgunanTanah.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                  '${formAgunanTanah[index].deskripsiPendek}'),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Atas Nama'),
                              textDeskripsiNoBold(
                                  '${formAgunanTanah[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Luas'),
                              textDeskripsiNoBold(
                                  '${formAgunanTanah[index].luasTanah} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanah[index]
                                        .nilaiPasar!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanah[index]
                                        .nilaiLiquidasi!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanah[index]
                                        .nilaiPengikatan
                                        .toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formAgunanTanah != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formAgunanTanahBangunan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formAgunanTanahBangunan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                  '${formAgunanTanahBangunan[index].deskripsiPendek}'),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Atas Nama'),
                              textDeskripsiNoBold(
                                  '${formAgunanTanahBangunan[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Luas'),
                              textDeskripsiNoBold(
                                  '${formAgunanTanahBangunan[index].luasTanah} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanahBangunan[index]
                                        .nilaiPasar!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanahBangunan[index]
                                        .nilaiLiquidasi!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanahBangunan[index]
                                        .nilaiPengikatan
                                        .toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formAgunanTanahBangunan != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formKendaraan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formKendaraan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                '${formKendaraan[index].jenis} Merk ${formKendaraan[index].merk} Tipe: ${formKendaraan[index].type} Tahun: ${formKendaraan[index].tahun}',
                              ),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Atas Nama'),
                              textDeskripsiNoBold(
                                  '${formKendaraan[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('No BPKB'),
                              textDeskripsiNoBold(
                                  '${formKendaraan[index].noBpkb}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formKendaraan[index]
                                    .nilaiPasar!
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formKendaraan[index]
                                    .nilaiLiquidasi!
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formKendaraan[index]
                                    .nilaiPengikatan
                                    .toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formKendaraan != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formPeralatan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formPeralatan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                '${formPeralatan[index].deskripsiPanjang}',
                              ),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formPeralatan[index]
                                    .nilaiPasar!
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formPeralatan[index]
                                    .nilaiLiquidasi!
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formPeralatan[index]
                                    .nilaiPengikatan
                                    .toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formPeralatan != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formCash != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formCash.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                '${formCash[index].deskripsiPanjang}',
                              ),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formCash[index].nilaiPasar!.toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formCash[index].nilaiLiquidasi!.toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formCash[index].nilaiPengikatan.toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formCash != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formLos != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: formLos.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.07),
                          1: const FlexColumnWidth(0.38),
                          2: const FlexColumnWidth(1),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                '${formLos[index].deskripsiPendek}',
                              ),
                              textDeskripsiNoBold(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                'No Register',
                              ),
                              textDeskripsiNoBold(
                                  '${formLos[index].noRegistrasi}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold(
                                'Atas Nama',
                              ),
                              textDeskripsiNoBold(
                                  '${formLos[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Luas'),
                              textDeskripsiNoBold(
                                  '${formLos[index].luasLos} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pasar'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formLos[index].nilaiPasar!.toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Liquidasi'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formLos[index].nilaiLiquidasi!.toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textDeskripsiNoBold(''),
                              textDeskripsiNoBold('Nilai Pengikatan'),
                              textDeskripsiNoBold(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formLos[index].nilaiPengikatan.toString()),
                              ).text),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),

        formLainnya != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        formLainnya != null
            ? Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.07),
                  1: const FlexColumnWidth(0.85),
                  2: const FlexColumnWidth(1),
                },
                tableWidth: TableWidth.min,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: PdfColors.grey,
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    children: [
                      textDeskripsiNoBold(''),
                      textDeskripsiNoBold(
                        'Usaha Yang Dibiayai',
                      ),
                      textDeskripsiNoBold(''),
                    ],
                  ),
                ],
              )
            : Container(),

        formLainnya != null
            ? SizedBox(
                height: 10,
              )
            : Container(),

        SizedBox(
          height: 10,
        ),

        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.04),
            1: const FlexColumnWidth(0.92),
            2: const FlexColumnWidth(0.1),
          },
          tableWidth: TableWidth.min,
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: PdfColors.grey,
                border: Border(
                  bottom: BorderSide(
                    color: PdfColors.black,
                    width: 1,
                  ),
                ),
              ),
              children: [
                textDeskripsiNoBold(''),
                textDeskripsiNoBold(
                  'Asuransi Penjaminan oleh ${debtor.asuransi?.namaPerusahaan}',
                ),
                textDeskripsiNoBold(''),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: PdfColors.grey,
              ),
              children: [
                textDeskripsiNoBold(''),
                textDeskripsiNoBold(
                  'Premi ${debtor.asuransi?.premi} % X ${MoneyMaskedTextController(
                    decimalSeparator: '',
                    thousandSeparator: '.',
                    leftSymbol: 'Rp. ',
                    precision: 0,
                    initialValue: double.parse(
                        debtor.inputKeuangan!.kreditDiusulkan.toString()),
                  ).text} = ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', leftSymbol: 'Rp. ', precision: 0, initialValue: double.parse(debtor.asuransi!.totalAsuransi.toString())).text}',
                ),
                textDeskripsiNoBold(''),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.07),
            1: const FlexColumnWidth(0.38),
            2: const FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                textDeskripsiNoBold('15.'),
                textDeskripsiNoBold('Syarat Lain'),
                textDeskripsiNoBold(''),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(0.04),
            1: const FlexColumnWidth(0.92),
            2: const FlexColumnWidth(0.1),
          },
          children: [
            TableRow(
              children: [
                textDeskripsiNoBold(''),
                ListView.builder(
                  itemCount: syaratList!.length,
                  itemBuilder: (context, index) => Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textUmur(
                            '${(index + 1)}. ${syaratList[index].keterangan}')
                      ],
                    ),
                  ),
                ),
                textDeskripsiNoBold(''),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        // // Footer
        Table(
          tableWidth: TableWidth.max,
          children: [
            TableRow(
              children: [
                // textDeskripsiNoBold(''),
                center("Yogyakarta, March 2022"),
                // SizedBox.shrink(),
              ],
            ),
          ],
        ),
        Table(
          // border: TableBorder.all(),
          columnWidths: {},
          tableWidth: TableWidth.max,
          children: [
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                center(controller.faker.name.fullName()),
              ],
            ),
            TableRow(
              children: [
                center('Pemimpin Cabang Pembantu'),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '.',
                  style: const TextStyle(color: PdfColors.white),
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
