// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import '../print_widget.dart';

// 📦 Package imports:

Future<Uint8List> makeUsulanBaruPdf(DebiturInsight debtor) async {
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
            // Header
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
            // Detail Debitur
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
            // Konten
            Table(
              // border: TableBorder.all(),
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
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
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.07),
                        1: const FlexColumnWidth(0.38),
                        2: const FlexColumnWidth(1),
                      },
                      tableWidth: TableWidth.max,
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
                            textDeskripsiNoBold("2. ${debtor.peminjam2}"),
                          ],
                        ),
                        TableRow(
                          children: [
                            textDeskripsiNoBold('2.'),
                            textDeskripsiNoBold("Pemilik Agunan"),
                            textDeskripsiNoBold("${debtor.pemilikAgunan1}"),
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
                              "Bulan 1 - ${int.parse(debtor.inputKeuangan!.angsuran!.toString()) - 1} :                Rp. ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.angsuranRp!.toString())).text}",
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox.shrink(),
                            SizedBox.shrink(),
                            textDeskripsiNoBold(
                              "Bulan ${int.parse(debtor.inputKeuangan!.angsuran!.toString())}      :                Rp. ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.angsuranRp!.toString())).text}",
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

                        // TODO AGUNAN
                        TableRow(
                          children: [
                            textDeskripsiNoBold('14.'),
                            textDeskripsiNoBold("Agunan I"),
                            textDeskripsiNoBold(
                              "-",
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            textDeskripsiNoBold(''),
                            textDeskripsiNoBold("Agunan II"),
                            textDeskripsiNoBold(
                              "-",
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            textDeskripsiNoBold('15.'),
                            textDeskripsiNoBold("Syarat lain :"),
                            textDeskripsiNoBold(
                              "",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.054),
                        1: const FlexColumnWidth(0.6),
                        2: const FlexColumnWidth(0.4),
                      },
                      tableWidth: TableWidth.max,
                      children: [
                        TableRow(
                          children: [
                            textDeskripsiNoBold(''),
                            textDeskripsiNoBold(
                                "a. Bukti kepemilikan agunan asli disimpan di Bank"),
                            SizedBox.shrink(),
                          ],
                        ),
                        TableRow(
                          children: [
                            textDeskripsiNoBold(''),
                            textDeskripsiNoBold(
                                "b. Telah lolos verifikasi SIKP di Kementrian"),
                            SizedBox.shrink(),
                          ],
                        ),
                        TableRow(
                          children: [
                            textDeskripsiNoBold(''),
                            textDeskripsiNoBold(
                                "c. Memiliki rekening tabungan di PT. BANK BPD DIY"),
                            SizedBox.shrink(),
                          ],
                        ),
                      ],
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
                    Table(
                      // columnWidths: {
                      //   0: const FlexColumnWidth(0.054),
                      //   1: const FlexColumnWidth(0.6),
                      //   2: const FlexColumnWidth(0.4),
                      // },
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
                  ],
                ),
              ],
            ),
            // Footer
            Table(
              border: TableBorder.symmetric(
                outside: const BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        center(controller.faker.name.firstName()),
                        center(controller.faker.name.firstName()),
                      ],
                    )
                  ],
                ),
                TableRow(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        center('Pemimpin Cabang Pembantu'),
                        center('Leader Kredit Mikro     '),
                      ],
                    )
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
        );
      },
    ),
  );

  return pdf.save();
}
