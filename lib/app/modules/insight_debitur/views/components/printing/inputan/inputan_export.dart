// 🐦 Flutter imports:
import 'package:akm/app/modules/insight_debitur/views/components/printing/print_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

Future<Uint8List> makeInputPdf(DebiturInsight debtor) async {
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

  pdf.addPage(
    MultiPage(
        // pageTheme: PageTheme(
        //   buildForeground: (context) {
        //     return FullPage(
        //       ignoreMargins: true,
        //       child: Watermark.text(
        //         'fleetime',
        //         style: TextStyle(
        //           color: PdfColors.grey,
        //           fontSize: 100,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     );
        //   },
        // ),

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
                  // Header
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
                          textUmur(
                              'DATA INPUT UNTUK ANALISA RISK RATING KREDIT MIKRO'),
                        ],
                      ),
                      TableRow(
                        children: [
                          textUmur(''),
                          textUmur('Data & Analisa Debitur'),
                        ],
                      ),
                    ],
                  ),
                  // Detail Debitur
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('1'),
                              textUmur('Peminjam 1'),
                              textUmur(debtor.peminjam1.toString()),
                              textUmur('KTP  1'),
                              textUmur(debtor.ktp1.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Peminjam 2'),
                              textUmur(debtor.peminjam2.toString()),
                              textUmur('KTP 2'),
                              textUmur(debtor.ktp2.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Peminjam 3'),
                              textUmur('-'),
                              textUmur('No. KTP'),
                              textUmur(debtor.noKtp1.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Peminjam 4'),
                              textUmur('-'),
                              textUmur('No. KTP'),
                              textUmur(debtor.noKtp2.toString()),
                            ],
                          ),
                        ],
                      ),
                      // Alamat
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.72),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('2'),
                              textUmur('Alamat 1'),
                              textUmur(debtor.alamat1.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Alamat 2'),
                              textUmur(debtor.alamat2.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Alamat 3'),
                              textUmur('-'),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Alamat 4'),
                              textUmur('-'),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('3'),
                              textUmur('Lamanya berusaha (tahun)'),
                              textUmur(debtor.lamanyaBerusaha.toString()),
                              textUmur('Pekerjaan 1'),
                              textUmur(debtor.pekerjaan1.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('4'),
                              textUmur('Tempat tgl lahir'),
                              textUmur('${debtor.tempatLahir}, ${
                                  // DateTime Format to dd-mm-yyyy
                                  DateFormat('dd/MM/yyyy').format(DateTime.parse(debtor.tanggalLahir.toString()))}'),
                              textUmur('Pekerjaan 2'),
                              textUmur(debtor.pekerjaan2.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('5'),
                              textUmur('Pendidikan'),
                              textUmur(debtor.pendidikan.toString()),
                              textUmur('Bidang Usaha'),
                              textUmur(debtor.bidangUsaha.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('6'),
                              textUmur('Jenis Usaha'),
                              textUmur(debtor.jenisUsaha.toString()),
                              textUmur('Lokasi Usaha'),
                              textUmur(debtor.lokasiUsaha.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('7'),
                              textUmur('SKPK NO'),
                              textUmur(debtor.noSkpk.toString()),
                              textUmur('Umur'),
                              textUmur(debtor.umur.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('8'),
                              textUmur('Tanggal'),
                              textUmur(DateFormat('EEEE, dd MMMM, yyyy').format(
                                  DateTime.parse(
                                      debtor.tglSekarang.toString()))),
                              textUmur('Status Kel'),
                              textUmur(
                                  '${debtor.statusKeluarga} Anak ${debtor.jumlahTanggungan}'),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Deskripsi data pemohon'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      // Deskripsi data pemohon
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
                              textUmur('${debtor.deskripsiDebitur}'),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Data & Analisa Kredit Mikro'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Data Analisa Keuangan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('9'),
                              textUmur('Kredit yang diajukan'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.kreditDiusulkan
                                    .toString()),
                              ).text),
                              textUmur('Angsuran (bulan)'),
                              textUmurR(
                                  debtor.inputKeuangan!.angsuran.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('10'),
                              textUmur('Provisi (%)'),
                              textUmur(
                                  debtor.inputKeuangan!.provisi.toString()),
                              textUmur('Sistim Angsuran'),
                              textUmur(debtor.inputKeuangan!.sistemAngsuran
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('11'),
                              textUmur('Digunakan untuk'),
                              textUmur(debtor.inputKeuangan!.digunakanUntuk
                                  .toString()),
                              textUmur('Jumlah Angsuran'),
                              textUmurR((MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.angsuranRp
                                    .toString()),
                              ).text)),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                              textUmurR((MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.angsuranRp
                                    .toString()),
                              ).text)),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('12'),
                              textUmur('Pinjaman Lainnya (Rp)'),
                              textUmurR((MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: 0,
                              ).text)),
                              textUmur('Ang/bln pinj lain'),
                              textUmurR((MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: 0,
                              ).text)),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('13'),
                              textUmur('Nilai aset (diluar rumah)'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse((double.parse(debtor
                                            .inputRugiLaba!.jumlahAktivaTetap
                                            .toString()) -
                                        double.parse(debtor
                                            .inputRugiLaba!.tanahDanBangunan
                                            .toString()))
                                    .toString()),
                              ).text),
                              textUmur('Asumsi'),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('14'),
                              textUmur('Penjualan/bln yll'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.penjualanKini
                                    .toString()),
                              ).text),
                              textUmur('Penjualan yad'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.penjualanAsumsi
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('15'),
                              textUmur('Biaya HPP/bln yll'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaBahanAsumsi
                                    .toString()),
                              ).text),
                              textUmur('Biaya HPP/bln yad'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaBahanAsumsi
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('16'),
                              textUmur('Biaya upah'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaUpahKini
                                    .toString()),
                              ).text),
                              textUmur('Biaya upah/bln yad'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaUpahAsumsi
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('17'),
                              textUmur('Biaya operasional'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaOperasionalKini
                                    .toString()),
                              ).text),
                              textUmur('Biaya operasional/bln yad'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaOperasionalAsumsi
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('18'),
                              textUmur('Biaya hidup'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaHidupKini
                                    .toString()),
                              ).text),
                              textUmur('Biaya hidup/bln yad'),
                              textUmurR(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(debtor
                                    .inputKeuangan!.biayaHidupAsumsi
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('19'),
                              textUmur('Bunga /thn (%)'),
                              textUmurR(
                                  '${debtor.inputKeuangan!.bungaPerTahun}'),
                              textUmur('Trade cycle MK'),
                              textUmurR(double.parse(debtor
                                      .inputKeuangan!.tradeCycle
                                      .toString())
                                  .toStringAsFixed(1)),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('20'),
                              textUmur('Jangka waktu (bulan)'),
                              textUmurR('${debtor.inputKeuangan!.angsuran}'),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Deskripsi data keuangan'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      // Deskripsi keuangan
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
                              textUmur('${debtor.deskripsiDebitur}'),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Data & Analisa Agunan'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Data Agunan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('21'),
                              textUmur('Barang agunan'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      formAgunanTanah != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold('Agunan Tanah')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formAgunanTanah.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formAgunanTanah[index].deskripsiPendek}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formAgunanTanahBangunan != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold('Agunan Tanah Bangunan')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formAgunanTanahBangunan.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formAgunanTanahBangunan[index].deskripsiPendek}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formKendaraan != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold('Agunan Kendaraan')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formKendaraan.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formKendaraan[index].jenis} Merk ${formKendaraan[index].merk}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formPeralatan != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold('Agunan Peralatan')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formPeralatan.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formPeralatan[index].deskripsiPanjang}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formCash != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [textUmurBold('Agunan Cash')],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formCash.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formCash[index].deskripsiPanjang}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formLos != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold(
                                              'Agunan Los (Kios Pasar)')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formLos.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. ${formLos[index].deskripsiPendek}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      formLainnya != null
                          ? Table(
                              columnWidths: {
                                0: const FlexColumnWidth(0.04),
                                1: const FlexColumnWidth(0.24),
                                2: const FlexColumnWidth(0.72),
                              },
                              tableWidth: TableWidth.min,
                              children: [
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textUmurBold('Agunan Lainnya')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    textUmur(''),
                                    textUmur(''),
                                    ListView.builder(
                                      itemCount: formLainnya.length,
                                      itemBuilder: (context, index) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textUmur(
                                                '${index + 1}. Usaha yang dibiayai')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('22'),
                              textUmur('Asuransi'),
                              textUmur(''),
                              textUmur('Rp. '),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('23'),
                              textUmur('Nilai Agunan (Rp)'),
                              textUmur(''),
                              textUmur('Bukti Kepemilikan'),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('a. Tanah'),
                              formAgunanTanah != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(
                                              formAgunanTanah
                                                  .fold<int>(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          int.parse(element
                                                              .nilaiPasar
                                                              .toString()))
                                                  .toString()))
                                      .text)
                                  : textUmur(''),
                              formAgunanTanah != null
                                  ? textUmur(formAgunanTanah
                                      .map((e) => e.buktiKepemilikan)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('b. Tanah dan Bangunan'),
                              formAgunanTanahBangunan != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(
                                              formAgunanTanahBangunan
                                                  .fold<int>(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          int.parse(element
                                                              .nilaiPasar
                                                              .toString()))
                                                  .toString()))
                                      .text)
                                  : textUmur(''),
                              formAgunanTanahBangunan != null
                                  ? textUmur(formAgunanTanahBangunan
                                      .map((e) => e.buktiKepemilikan)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('c. Kendaraan'),
                              formKendaraan != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(
                                              formKendaraan
                                                  .fold<int>(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          int.parse(element
                                                              .nilaiPasar
                                                              .toString()))
                                                  .toString()))
                                      .text)
                                  : textUmur(''),
                              formKendaraan != null
                                  ? textUmur(formKendaraan
                                      .map((e) => e.noBpkb)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('d. Mesin & Peralatan'),
                              formPeralatan != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(
                                              formPeralatan
                                                  .fold<int>(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          int.parse(element
                                                              .nilaiPasar
                                                              .toString()))
                                                  .toString()))
                                      .text)
                                  : textUmur(''),
                              formPeralatan != null
                                  ? textUmur(formPeralatan
                                      .map((e) => e.deskripsiPanjang)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('e. Cash Collateral'),
                              formCash != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(formCash
                                              .fold<int>(
                                                  0,
                                                  (previousValue, element) =>
                                                      previousValue +
                                                      int.parse(element
                                                          .nilaiPasar
                                                          .toString()))
                                              .toString()))
                                      .text)
                                  : textUmur(''),
                              formCash != null
                                  ? textUmur(formCash
                                      .map((e) => e.deskripsiPanjang)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      //TODO: Table bit redundant
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('f. Kios / Los Pasar'),
                              formLos != null
                                  ? textUmur(MoneyMaskedTextController(
                                          precision: 0,
                                          leftSymbol: 'Rp. ',
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          initialValue: double.parse(formLos
                                              .fold<int>(
                                                  0,
                                                  (previousValue, element) =>
                                                      previousValue +
                                                      int.parse(element
                                                          .nilaiPasar
                                                          .toString()))
                                              .toString()))
                                      .text)
                                  : textUmur(''),
                              formLos != null
                                  ? textUmur(formLos
                                      .map((e) => e.deskripsiPendek)
                                      .toList()
                                      .join(', '))
                                  : textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('f. Lainnya'),
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
                                                      int.parse(element
                                                          .nilaiPasar
                                                          .toString()))
                                              .toString()))
                                      .text)
                                  : textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('24'),
                              textUmur('Bukti Kepemilikan agunan'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('25'),
                              textUmur('Ijin yang dimiliki (legitimasi)'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Deskripsi Agunan'),
                              textUmur(''),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
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
                              textUmur('${debtor.deskripsiDebitur}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Data Karakter
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.24),
                          4: const FlexColumnWidth(0.24),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur('Data & Analisa Karakter'),
                              textUmur(''),
                              textUmur('Keterangan'),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.04),
                          1: const FlexColumnWidth(0.24),
                          2: const FlexColumnWidth(0.24),
                          3: const FlexColumnWidth(0.48),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmur('26'),
                              textUmur('Ulet dalam bisnis (1 - 95)'),
                              textUmurR(
                                  debtor.analisaKarakter!.scoreUlet.toString()),
                              textUmur(debtor.analisaKarakter!.keteranganUlet
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('27'),
                              textUmur('Flexible / Kaku (1 - 95)'),
                              textUmurR(
                                  debtor.analisaKarakter!.scoreKaku.toString()),
                              textUmur(debtor.analisaKarakter!.keteranganKaku
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('28'),
                              textUmur('Kreatif / Inovatif (1 - 95)'),
                              textUmurR(debtor.analisaKarakter!.scoreKreatif
                                  .toString()),
                              textUmur(debtor.analisaKarakter!.keteranganKreatif
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur('29'),
                              textUmur(
                                  'Memiliki kejujuran dlm bisnis (1 - 95)'),
                              textUmurR(debtor.analisaKarakter!.scoreKejujuran
                                  .toString()),
                              textUmur(debtor
                                  .analisaKarakter!.keteranganKejujuran
                                  .toString()),
                            ],
                          ),
                        ],
                      ),
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
                              textUmur('Deskripsi karakter pemohon'),
                            ],
                          ),
                          TableRow(
                            children: [
                              textUmur(''),
                              textUmur(
                                  '${debtor.analisaKarakter!.deskripsiKarakter}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Data Bisnis
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  )
                ],
              )
            ]),
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

Widget textUmurModified(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
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
