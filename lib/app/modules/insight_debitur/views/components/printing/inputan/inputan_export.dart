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

  // variable for string omzet penjualan
  var omzetPenjualan = '';
  var hargaBersaing = '';
  var persainganPasar = '';
  var lokasiUsaha = '';
  var kapasitasTerpasang = '';
  var kualitas = '';

  // processing kualitas
  if (debtor.analisaBisnis?.keteranganKualitas == "Sangat baik") {
    kualitas =
        "Analisa bisnis menunjukkan bahwa kualitas bisnis saat ini sangat baik. Hal ini dapat dilihat dari hasil penjualan yang tinggi, efisiensi operasional yang baik, dan kepuasan pelanggan yang tinggi.";
  } else if (debtor.analisaBisnis?.keteranganKualitas == "Baik") {
    kualitas =
        "Analisa bisnis menunjukkan bahwa kualitas bisnis saat ini baik. Hal ini dapat dilihat dari hasil penjualan yang tinggi, efisiensi operasional yang baik, dan kepuasan pelanggan yang tinggi.";
  } else if (debtor.analisaBisnis?.keteranganKualitas == "Cukup") {
    kualitas =
        "Analisa bisnis menunjukkan bahwa kualitas bisnis saat ini cukup. Meskipun masih ada ruang untuk peningkatan, debitur ini  telah berhasil menjalankan bisnis dengan efisien dan memenuhi kebutuhan pelanggan dengan baik";
  } else if (debtor.analisaBisnis?.keteranganKualitas == "Kurang Baik") {
    kualitas =
        "Analisa bisnis menunjukkan bahwa kualitas bisnis saat ini kurang baik. perlu segera mengambil tindakan yang efektif untuk meningkatkan kualitas bisnis, seperti meningkatkan efisiensi operasional, meningkatkan kualitas produk atau jasa yang ditawarkan, dan meningkatkan kepuasan pelanggan";
  } else {
    kualitas =
        "Analisa bisnis menunjukkan bahwa kualitas bisnis  saat ini jelek. harus segera mengambil tindakan yang efektif untuk meningkatkan kualitas bisnis , seperti meningkatkan efisiensi operasional, meningkatkan kualitas produk atau jasa yang ditawarkan, dan meningkatkan kepuasan pelanggan. Jika tidak, berisiko mengalami kerugian yang signifikan dan terancam kebangkrutan";
  }

  // Processing if omzet penjualan keterangan
  if (debtor.analisaBisnis?.keteranganOmzet == "Lebih dari 80%") {
    omzetPenjualan =
        'Hasil analisa omzet penjualan menunjukkan bahwa bisnis yang dijalankan debitur ini telah mencapai omzet lebih dari 80% sampai saat ini. Ini merupakan prestasi yang sangat baik dan menunjukkan bahwa strategi pemasaran yang debitur lakukan telah efektif dalam meningkatkan penjualan.';
  } else if (debtor.analisaBisnis?.keteranganOmzet == "s/d 80%") {
    // Processing if omzet penjualan is null
    omzetPenjualan =
        'Hasil analisa omzet penjualan menunjukkan bahwa bisnis yang dijalankan debitur ini telah mencapai omzet sampai dengan 80% sampai saat ini. Ini merupakan prestasi yang baik dan menunjukkan bahwa strategi pemasaran yang debitur lakukan telah efektif dalam meningkatkan penjualan.';
  } else if (debtor.analisaBisnis?.keteranganOmzet == "s/d 70%") {
    // Processing if omzet penjualan is null
    omzetPenjualan =
        'Hasil analisa omzet penjualan menunjukkan bahwa bisnis yang dijalankan debitur ini telah mencapai omzet sampai dengan 70% sampai saat ini. Ini merupakan prestasi yang cukup baik dan menunjukkan bahwa strategi pemasaran yang debitur lakukan telah efektif dalam meningkatkan penjualan.';
  } else if (debtor.analisaBisnis?.keteranganOmzet == 's/d 60%') {
    omzetPenjualan =
        'Hasil analisa omzet penjualan menunjukkan bahwa bisnis yang dijalankan debitur ini telah mencapai omzet sampai dengan 60% sampai saat ini. Ini merupakan prestasi yang kurang dan menunjukkan bahwa strategi pemasaran yang debitur lakukan belum efektif dalam meningkatkan penjualan.';
  } else {
    omzetPenjualan =
        'Hasil analisa omzet penjualan menunjukkan bahwa bisnis yang dijalankan debitur ini belum mencapai omzet sampai saat ini. Ini merupakan prestasi yang sangat kurang dan menunjukkan bahwa strategi pemasaran yang debitur lakukan sangat belum efektif dalam meningkatkan penjualan.';
  }

  // processing if harga bersaing keterangan
  if (debtor.analisaBisnis?.keteranganHargaBersaing ==
      "Lebih murah diatas 10%") {
    hargaBersaing =
        "Setelah melakukan analisa harga bersaing, debitur ini memiliki harga yang lebih murah diatas 10% dibandingkan dengan pesaingnya. dengan harga yang lebih kompetitif, debitur dapat memberikan nilai yang lebih baik bagi pelanggan sambil tetap menjaga margin keuntungan yang sehat.";
  } else if (debtor.analisaBisnis?.keteranganHargaBersaing ==
      "lebih murah 5 - 10%") {
    hargaBersaing =
        "Setelah melakukan analisa harga bersaing, debitur ini memiliki harga yang lebih murah 5 - 10% dibandingkan dengan pesaingnya. dengan harga yang kompetitif, debitur dapat memberikan nilai yang lebih baik bagi pelanggan sambil tetap menjaga margin keuntungan yang sehat.";
  } else if (debtor.analisaBisnis?.keteranganHargaBersaing ==
      "lebih murah s/d 5%") {
    hargaBersaing =
        "Setelah melakukan analisa harga bersaing, debitur ini memiliki harga yang lebih murah s/d 5% dibandingkan dengan pesaingnya. dengan harga yang kompetitif, debitur dapat memberikan nilai yang lebih baik bagi pelanggan sambil tetap menjaga margin keuntungan yang sehat.";
  } else if (debtor.analisaBisnis?.keteranganHargaBersaing ==
      "Sama dengan pesaing") {
    hargaBersaing =
        "Setelah melakukan analisa harga bersaing, debitur ini memiliki harga yang sama dengan pesaingnya. dengan harga yang kompetitif, debitur dapat memberikan nilai yang lebih baik bagi pelanggan sambil tetap menjaga margin keuntungan yang sehat.";
  } else {
    hargaBersaing =
        "Setelah melakukan analisa harga bersaing, debitur ini memiliki harga yang lebih mahal dibandingkan dengan pesaingnya. dengan harga yang lebih mahal, debitur dapat memberikan nilai yang lebih baik bagi pelanggan sambil tetap menjaga margin keuntungan yang sehat.";
  }

  // processing persaingan pasar
  if (debtor.analisaBisnis?.keteranganPersaingan == "Tidak ketat") {
    persainganPasar =
        "Setelah melakukan analisa pasar, dapat disimpulkan bahwa persaingan pasar saat ini tidak terlalu ketat. Hal ini menunjukkan bahwa ada peluang yang bagus bagi debitur untuk meningkatkan pangsa pasar dan meningkatkan omzet penjualan.";
  } else if (debtor.analisaBisnis?.keteranganPersaingan == "Kurang ketat") {
    persainganPasar =
        "Setelah melakukan analisa pasar, dapat disimpulkan bahwa persaingan pasar saat ini kurang ketat. Meskipun demikian, debitur tidak boleh lengah dan harus terus berupaya untuk meningkatkan pangsa pasarnya";
  } else if (debtor.analisaBisnis?.keteranganPersaingan == "Cukup ketat") {
    persainganPasar =
        "Setelah melakukan analisa pasar, dapat disimpulkan bahwa persaingan pasar saat ini cukup ketat. Hal ini menunjukkan bahwa debitur harus terus berupaya untuk meningkatkan pangsa pasarnya.";
  } else if (debtor.analisaBisnis?.keteranganPersaingan == "Ketat") {
    persainganPasar =
        "Setelah melakukan analisa pasar, dapat disimpulkan bahwa persaingan pasar saat ini ketat. Hal ini menunjukkan bahwa debitur harus terus berupaya untuk meningkatkan pangsa pasar agar dapat bersaing dengan baik di tengah persaingan yang ketat ini. Diupayakan debitur terus melakukan strategi pemasaran yang efektif dan meningkatkan kualitas produk untuk dapat bersaing dengan baik di pasar yang ketat ini.";
  } else {
    persainganPasar =
        "Analisa pasar menunjukkan bahwa persaingan saat ini sangat ketat. diupayakan debitur akan terus melakukan strategi pemasaran efektif dan meningkatkan kualitas produk untuk bersaing dengan baik";
  }

  // processing lokasi usaha
  if (debtor.analisaBisnis?.keteranganLokasiUsaha == "Sangat strategis") {
    lokasiUsaha =
        "Setelah melakukan analisa lokasi pasar, dapat  disimpulkan bahwa lokasi sangat strategis dan dapat membantu meningkatkan pangsa pasar. Lokasi ini berada di area yang ramai dikunjungi oleh banyak orang dan mudah diakses, sehingga sangat memudahkan pelanggan untuk mengunjunginya";
  } else if (debtor.analisaBisnis?.keteranganLokasiUsaha == "Strategis") {
    lokasiUsaha =
        "Setelah melakukan analisa lokasi pasar, dapat  disimpulkan bahwa lokasi strategis dan dapat membantu meningkatkan pangsa pasar. Lokasi ini berada di area yang ramai dikunjungi oleh banyak orang dan mudah diakses, sehingga sangat memudahkan pelanggan untuk mengunjunginya";
  } else if (debtor.analisaBisnis?.keteranganLokasiUsaha == "Cukup strategis") {
    lokasiUsaha =
        "Setelah melakukan analisa lokasi pasar, dapat  disimpulkan bahwa lokasi cukup strategis dan dapat membantu meningkatkan pangsa pasar. Lokasi ini berada di area yang ramai dikunjungi oleh banyak orang dan mudah diakses, sehingga sangat memudahkan pelanggan untuk mengunjunginya";
  } else if (debtor.analisaBisnis?.keteranganLokasiUsaha ==
      "Kurang strategis") {
    lokasiUsaha =
        "Analisa lokasi menunjukkan bahwa lokasinya kurang strategis dibanding saingan. Debitur diupayakan untuk akan terus berupaya meningkatkan pangsa pasar dengan strategi pemasaran efektif dan meningkatkan kualitas produk serta mencari lokasi alternatif yang lebih strategis";
  } else {
    lokasiUsaha =
        "Analisa lokasi menunjukkan bahwa lokasinya sangat kurang strategis dibanding saingan. Debitur diupayakan untuk akan terus berupaya meningkatkan pangsa pasar dengan strategi pemasaran efektif dan meningkatkan kualitas produk serta mencari lokasi alternatif yang lebih strategis";
  }

  // processing kapasitas terpasang
  if (debtor.analisaBisnis?.keteranganProduktivitas == "Lebih dari 80%") {
    kapasitasTerpasang =
        "Hasil analisa penjualan menunjukkan bahwa kapasitas terpasang saat ini lebih dari 80%. Hal ini menunjukkan bahwa debitur telah berhasil menggunakan sumber daya penjualan yang dimiliki dengan efektif dan dapat meningkatkan omzet penjualan";
  } else if (debtor.analisaBisnis?.keteranganProduktivitas == "s/d 80%") {
    kapasitasTerpasang =
        "Hasil analisa penjualan menunjukkan bahwa kapasitas terpasang saat ini s/d 80%. Hal ini menunjukkan bahwa debitur telah berhasil menggunakan sumber daya penjualan yang dimiliki dengan efektif dan dapat meningkatkan omzet penjualan";
  } else if (debtor.analisaBisnis?.keteranganProduktivitas == "s/d 70%") {
    kapasitasTerpasang =
        "Hasil analisa penjualan menunjukkan bahwa kapasitas terpasang saat ini sampai dengan 70%. Walaupun masih terbilang cukup tinggi, debitur diupayakan akan terus untuk meningkatkan kapasitas terpasang penjualan agar dapat meningkatkan omzet penjualan.";
  } else if (debtor.analisaBisnis?.keteranganProduktivitas == "s/d 60%") {
    kapasitasTerpasang =
        "Hasil analisa penjualan menunjukkan bahwa kapasitas terpasang  saat ini sampai dengan 60%. Ini menunjukkan bahwa debitur perlu lebih berhati-hati dalam mengelola sumber daya penjualan agar dapat meningkatkan omzet penjualan. Debitur diupayakan terus mengevaluasi strategi penjualan dan mencari cara untuk meningkatkan efektivitas penggunaan sumber daya penjualan demi mencapai hasil yang lebih baik di masa yang akan datang.";
  } else {
    kapasitasTerpasang =
        "Hasil analisa penjualan menunjukkan bahwa kapasitas terpasang saat ini kurang dari 60%. Hal ini menunjukkan bahwa debitur belum berhasil menggunakan sumber daya penjualan yang dimiliki dengan efektif dan dapat meningkatkan omzet penjualan";
  }

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
      margin: const EdgeInsets.all(40),
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
                    textUmurBoldLeft('Data & Analisa Debitur'),
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
                        debtor.peminjam2 == '' || debtor.peminjam2 == null
                            ? textUmur('-')
                            : textUmur(debtor.peminjam2.toString()),
                        textUmur('KTP 2'),
                        debtor.ktp2 == 0.toString()
                            ? textUmur('-')
                            : textUmur(debtor.ktp2.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur('Peminjam 3'),
                        debtor.peminjam3 == '' || debtor.peminjam3 == null
                            ? textUmur('-')
                            : textUmur(debtor.peminjam3.toString()),
                        textUmur('No. KTP'),
                        textUmur(debtor.noKtp1.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur('Peminjam 4'),
                        debtor.peminjam4 == '' || debtor.peminjam4 == null
                            ? textUmur('-')
                            : textUmur(debtor.peminjam4.toString()),
                        textUmur('No. KTP'),
                        debtor.noKtp2 == '' || debtor.noKtp2 == null
                            ? textUmur('-')
                            : textUmur(debtor.noKtp2.toString()),
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
                        debtor.alamat2 == '' || debtor.alamat2 == null
                            ? textUmur('-')
                            : textUmur(debtor.alamat2.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur('Alamat 3'),
                        debtor.alamat3 == '' || debtor.alamat3 == null
                            ? textUmur('-')
                            : textUmur(debtor.alamat3.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmur('Alamat 4'),
                        debtor.alamat4 == '' || debtor.alamat4 == null
                            ? textUmur('-')
                            : textUmur(debtor.alamat4.toString()),
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
                        debtor.pekerjaan2 == '' || debtor.pekerjaan2 == null
                            ? textUmur('-')
                            : textUmur(debtor.pekerjaan2.toString()),
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
                            DateTime.parse(debtor.tglSekarang.toString()))),
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
                        textUmurBoldLeft('Data & Analisa Kredit Mikro'),
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
                          initialValue: double.parse(
                              debtor.inputKeuangan!.kreditDiusulkan.toString()),
                        ).text),
                        textUmur('Angsuran (bulan)'),
                        textUmurR(debtor.inputKeuangan!.angsuran.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('10'),
                        textUmur('Provisi (%)'),
                        textUmur(debtor.inputKeuangan!.provisi.toString()),
                        textUmur('Sistim Angsuran'),
                        textUmur(
                            debtor.inputKeuangan!.sistemAngsuran.toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur('11'),
                        textUmur('Digunakan untuk'),
                        textUmur(
                            debtor.inputKeuangan!.digunakanUntuk.toString()),
                        textUmur('Jumlah Angsuran'),
                        textUmurR((MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.angsuranRp.toString()),
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
                          initialValue: double.parse(
                              debtor.inputKeuangan!.angsuranRp.toString()),
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
                          initialValue: double.parse(
                              debtor.inputKeuangan!.penjualanKini.toString()),
                        ).text),
                        textUmur('Penjualan yad'),
                        textUmurR(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.penjualanAsumsi.toString()),
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
                          initialValue: double.parse(
                              debtor.inputKeuangan!.biayaUpahKini.toString()),
                        ).text),
                        textUmur('Biaya upah/bln yad'),
                        textUmurR(MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.biayaUpahAsumsi.toString()),
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
                          initialValue: double.parse(
                              debtor.inputKeuangan!.biayaHidupKini.toString()),
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
                        textUmurR('${debtor.inputKeuangan!.bungaPerTahun}'),
                        textUmur('Trade cycle MK'),
                        textUmurR(double.parse(
                                debtor.inputKeuangan!.tradeCycle.toString())
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
                        textUmur(
                            'Usaha ${debtor.bidangUsaha!.toLowerCase()} yang dikelola oleh pemohon, saat ini omset penjualan sebesar ${MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.penjualanKini.toString()),
                        ).text} / bulan dengan asumsi peningkatan omset dan biaya sebesar 10%, maka dengan adanya pinjaman baru sebesar ${MoneyMaskedTextController(
                          decimalSeparator: '',
                          thousandSeparator: '.',
                          leftSymbol: 'Rp. ',
                          precision: 0,
                          initialValue: double.parse(
                              debtor.inputKeuangan!.kreditDiusulkan.toString()),
                        ).text} dari bank BPD DIY, pemohon masih dapat menabung setiap bulan setelah dikurangi semua kewajiban pinjaman di Bank.'),
                      ],
                    ),
                    TableRow(
                      children: [
                        textUmur(''),
                        textUmurBoldLeft('Data & Analisa Agunan'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Data Agunan
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [textUmurBold('Agunan Tanah')],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [textUmurBold('Agunan Tanah Bangunan')],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [textUmurBold('Agunan Kendaraan')],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [textUmurBold('Agunan Peralatan')],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textUmurBold('Agunan Los (Kios Pasar)')
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [textUmurBold('Agunan Lainnya')],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textUmur('${index + 1}. Usaha yang dibiayai')
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
                                            int.parse(
                                                element.nilaiPasar.toString()))
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
                    textUmur('Yang terlampir diatas'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur('25'),
                    textUmur('Ijin yang dimiliki (legitimasi)'),
                    textUmur('${debtor.ijinLegitimasi?.jenisIjin}'),
                    textUmur('${debtor.ijinLegitimasi?.keteranganIjin}'),
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
                    textUmur(
                        'Agunan yang dijadikan jaminan sebesar ${MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.analisaAgunan!.totalAgunan.toString()),
                    ).text}'),
                  ],
                ),
              ],
            ),
            // Data Karakter
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
                    textUmurBoldLeft('Data & Analisa Karakter'),
                    textUmur(''),
                    textUmurBoldLeft('Keterangan'),
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
                    textUmurWide('26'),
                    textUmurWide('Ulet dalam bisnis (1 - 95)'),
                    textUmurRWide(debtor.analisaKarakter!.scoreUlet.toString()),
                    textUmur(debtor.analisaKarakter!.keteranganUlet.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('27'),
                    textUmurWide('Flexible / Kaku (1 - 95)'),
                    textUmurRWide(debtor.analisaKarakter!.scoreKaku.toString()),
                    textUmurWide(
                        debtor.analisaKarakter!.keteranganKaku.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('28'),
                    textUmurWide('Kreatif / Inovatif (1 - 95)'),
                    textUmurRWide(
                        debtor.analisaKarakter!.scoreKreatif.toString()),
                    textUmurWide(
                        debtor.analisaKarakter!.keteranganKreatif.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('29'),
                    textUmurWide('Memiliki kejujuran dlm bisnis (1 - 95)'),
                    textUmurRWide(
                        debtor.analisaKarakter!.scoreKejujuran.toString()),
                    textUmurWide(
                        debtor.analisaKarakter!.keteranganKejujuran.toString()),
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
                    textUmur('${debtor.analisaKarakter!.deskripsiKarakter}'),
                  ],
                ),
              ],
            ),
            // Data Bisnis
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
                    textUmurBoldLeft('Data Analisa Bisnis'),
                    textUmur(''),
                    textUmurBoldLeft('Keterangan'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur('30'),
                    textUmur('Omzet Penjualan'),
                    textUmur(debtor.analisaBisnis!.keteranganOmzet.toString()),
                    textUmur(omzetPenjualan),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('31'),
                    textUmurWide('Harga Bersaing'),
                    textUmurWide(debtor.analisaBisnis!.keteranganHargaBersaing
                        .toString()),
                    textUmurWide(hargaBersaing),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('32'),
                    textUmurWide('Persaingan'),
                    textUmurWide(
                        debtor.analisaBisnis!.keteranganPersaingan.toString()),
                    textUmurWide(persainganPasar),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('33'),
                    textUmurWide('Lokasi'),
                    textUmurWide(
                        debtor.analisaBisnis!.keteranganLokasiUsaha.toString()),
                    textUmurWide(lokasiUsaha),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('34'),
                    textUmurWide('Produktivitas thd kapasitas terpasang'),
                    textUmurWide(debtor.analisaBisnis!.keteranganProduktivitas
                        .toString()),
                    textUmurWide(kapasitasTerpasang),
                  ],
                ),
                TableRow(
                  children: [
                    textUmurWide('35'),
                    textUmurWide('Kwalitas'),
                    textUmurWide(
                        debtor.analisaBisnis!.keteranganKualitas.toString()),
                    textUmurWide(kualitas),
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
                    textUmur('Deskripsi bisnis pemohon'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('${debtor.analisaBisnis!.deskripsiBisnis}'),
                  ],
                ),
              ],
            ),
            // Syarat Lain
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
                    textUmur('36'),
                    textUmur('SYARAT LAIN'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            // Iterate Syarat
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
                    textUmur(''),
                    ListView.builder(
                      itemCount: syaratList!.length,
                      itemBuilder: (context, index) => Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUmur(
                                '${index + 1}. ${syaratList[index].keterangan}')
                          ],
                        ),
                      ),
                    ),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
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
                    textUmurBoldLeft('Hasil Kesimpulan'),
                    textUmur(''),
                    textUmurBoldLeft(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('ROE (min 10%)'),
                    textUmurR(debtor.analisaKeuangan!.persenRoeYad.toString()),
                    textUmur(debtor.analisaKeuangan!.keteranganRoe.toString()),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('ROA (min 8%)'),
                    textUmurR(debtor.analisaKeuangan!.persenRoaYad.toString()),
                    textUmur(debtor.analisaKeuangan!.keteranganRoa.toString()),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('DER (max 200%)'),
                    textUmurR(debtor.analisaKeuangan!.persenDerYad.toString()),
                    textUmur(debtor.analisaKeuangan!.keteranganDer
                        .toString()
                        .toUpperCase()),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('DSC (min 1,3 kali)'),
                    textUmurR(debtor.analisaKeuangan!.persenDscYad.toString()),
                    textUmur(debtor.analisaKeuangan!.keteranganDsc
                        .toString()
                        .toUpperCase()),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    debtor.inputKeuangan!.digunakanUntuk == 'Investasi'
                        ? textUmur('Maximum kebutuhan investasi')
                        : textUmur('Maximum kebutuhan modal kerja'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(debtor
                          .analisaKeuangan!.kebutuhanInvestasi
                          .toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Maximum kredit yang diberikan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.analisaKeuangan!.pinjamanMaksimal.toString()),
                    ).text),
                    debtor.analisaKeuangan!.kreditDisetujuin == true
                        ? textUmur('OK')
                        : textUmur('NAY'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
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
                    textUmur('Penghasilan Bersih'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputRugiLaba!.sisaPenghasilan.toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Angsuran / Bulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.angsuranRp.toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Ttl Angsuran / Bulan'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.inputKeuangan!.angsuranRp.toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
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
                    debtor.inputKeuangan!.digunakanUntuk == 'Investasi'
                        ? textUmur('Keb Investasi')
                        : textUmur('Keb Modal Kerja'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(debtor
                          .analisaKeuangan!.kebutuhanInvestasi
                          .toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Keb Kredit'),
                    textUmurR(MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      leftSymbol: 'Rp. ',
                      precision: 0,
                      initialValue: double.parse(
                          debtor.analisaKeuangan!.kebutuhanKredit.toString()),
                    ).text),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            // Data Bank
            SizedBox(height: 15),
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
                    textUmurBoldLeft('Data Bank'),
                    textUmur(''),
                    textUmurBoldLeft(''),
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
                4: const FlexColumnWidth(0.24),
              },
              tableWidth: TableWidth.min,
              children: [
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Pemutus'),
                    // textUmur(debtor.pengajuan![0].user?.length == 3
                    //     ? debtor.pengajuan![0].user![2].displayName!
                    //     : '-'),
                    debtor.pengajuan!.isEmpty
                        ? textUmur('')
                        : debtor.pengajuan![0].user!.isEmpty
                            ? textUmur('')
                            : debtor.pengajuan![0].user!.length != 3
                                ? textUmur('')
                                : textUmur(
                                    debtor.pengajuan![0].user![2].displayName!),
                    textUmur('Pemimpin Cabang Pembantu'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Analis'),
                    debtor.pengajuan!.isEmpty
                        ? textUmur('')
                        : debtor.pengajuan![0].user!.isEmpty
                            ? textUmur('')
                            : debtor.pengajuan![0].user![0].displayName == null
                                ? textUmur('')
                                : textUmur(
                                    debtor.pengajuan![0].user![0].displayName!),
                    textUmur('Analis Kredit Mikro'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Komite'),
                    debtor.pengajuan!.isEmpty
                        ? textUmur('')
                        : debtor.pengajuan![0].user!.isEmpty
                            ? textUmur('')
                            : debtor.pengajuan![0].user![1].displayName == null
                                ? textUmur('')
                                : textUmur(
                                    debtor.pengajuan![0].user![1].displayName!),
                    // textUmur(''),
                    textUmur('Leader Kredit Mikro'),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Cabang'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Kota'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                // TableRow(
                //   children: [
                //     textUmur(''),
                //     textUmur('Tgl Pembahasan'),
                //     textUmur(DateFormat('dd MMMM yyyy').format(
                //         DateTime.parse(DateTime.now().toIso8601String()))),
                //     textUmur(''),
                //   ],
                // ),
                // TableRow(
                //   children: [
                //     textUmur(''),
                //     textUmur('Tgl Komite'),
                //     textUmur(DateFormat('dd MMMM yyyy').format(
                //         DateTime.parse(DateTime.now().toIso8601String()))),
                //     textUmur(''),
                //   ],
                // ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('Kode Pos Lokasi Usaha'),
                    textUmur(''),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('No. Telp Peminjam'),
                    textUmur(debtor.noHp.toString()),
                    textUmur(''),
                  ],
                ),
                TableRow(
                  children: [
                    textUmur(''),
                    textUmur('NPWP'),
                    textUmur(debtor.npwp.toString()),
                    textUmur(''),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            // Iterate Detail Agunan
          ],
        ),
        formAgunanTanah != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formAgunanTanah.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formAgunanTanah[index].deskripsiPendek}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Atas Nama'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Bukti Kepemilikan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].buktiKepemilikan}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Luas'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].luasTanah} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Tanggal'),
                              textUmur(':'),
                              textUmurBoldLeft(DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(formAgunanTanah[index]
                                      .tanggal!
                                      .toIso8601String()))),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Bukti Lokasi'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].lokasi}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].pengikatan}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanah[index]
                                        .nilaiPengikatan!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pemilik'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Alamat'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].lokasi}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Table(
                        columnWidths: {0: const FlexColumnWidth(1)},
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmurBoldLeft(
                                  '${formAgunanTanah[index].deskripsiPanjang}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        formAgunanTanahBangunan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formAgunanTanahBangunan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formAgunanTanahBangunan[index].deskripsiPendek}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Atas Nama'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Bukti Kepemilikan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].buktiKepemilikan}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Luas'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].luasTanah} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Tanggal'),
                              textUmur(':'),
                              textUmurBoldLeft(DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(formAgunanTanahBangunan[index]
                                      .tanggal!
                                      .toIso8601String()))),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Bukti Lokasi'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].lokasi}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].pengikatan}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formAgunanTanahBangunan[index]
                                        .nilaiPengikatan!
                                        .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pemilik'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Alamat'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].lokasi}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Table(
                        columnWidths: {0: const FlexColumnWidth(1)},
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmurBoldLeft(
                                  '${formAgunanTanahBangunan[index].deskripsiPanjang}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        formKendaraan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formKendaraan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(formKendaraan[index].jenis ==
                                            'Spd Motor'
                                        ? 'Kendaraan Roda 2 (Dua)'
                                        : 'Kendaraan Roda 4 (Empat)'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Jenis'),
                              textUmur(':'),
                              textUmurBoldLeft('${formKendaraan[index].jenis}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Merk'),
                              textUmur(':'),
                              textUmurBoldLeft('${formKendaraan[index].merk}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Type'),
                              textUmur(':'),
                              textUmurBoldLeft('${formKendaraan[index].type}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Warna'),
                              textUmur(':'),
                              textUmurBoldLeft('${formKendaraan[index].warna}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Tahun'),
                              textUmur(':'),
                              textUmurBoldLeft('${formKendaraan[index].tahun}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('No. Polisi'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].noPolisi}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('No. Rangka'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].noRangka}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('No. Mesin'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].noMesin}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('No. BPKB'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].noBpkb}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Atas Nama'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Keadaan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].kondisi}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formKendaraan[index]
                                    .nilaiPengikatan!
                                    .toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pemilik'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formKendaraan[index].namaPemilik}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Table(
                        columnWidths: {0: const FlexColumnWidth(1)},
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmurBoldLeft(
                                  '${formKendaraan[index].deskripsiPanjang}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        formPeralatan != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formPeralatan.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formPeralatan[index].deskripsiPanjang}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formPeralatan[index]
                                    .nilaiPengikatan!
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
        SizedBox(
          height: 10,
        ),
        formCash != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formCash.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formCash[index].deskripsiPanjang}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(formCash[index]
                                    .nilaiPengikatan!
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
        SizedBox(
          height: 10,
        ),
        formLos != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formLos.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formLos[index].deskripsiPendek}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Atas Nama'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Tempat, Tgl Lahir'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].tempatLahir}, ${DateFormat('dd MMMM yyyy').format(DateTime.parse(formLos[index].tanggalLahir!.toIso8601String()))}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Alamat'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].alamatPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Tempat Dasaran'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].tempatDasaran}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('No. Registrasi'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].noRegistrasi}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Luas'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].luasLos} m2'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Jenis Dagangan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].jenisDagangan}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Jam Buka'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${DateFormat('Hm').format(DateTime.parse('2021-01-01 ${formLos[index].waktuBuka}.000'))} - ${DateFormat('Hm').format(DateTime.parse('2021-01-01 ${formLos[index].waktuTutup}.000'))} WIB'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Berlaku Sampai'),
                              textUmur(':'),
                              textUmurBoldLeft(DateFormat('EEEE, dd MMMM, yyyy')
                                  .format(DateTime.parse(formLos[index]
                                      .berlakuSampai!
                                      .toIso8601String()))),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Komponen'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].komponen}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].pengikatan}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Lokasi Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].lokasiPasar}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Liquidasi'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
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
                              textUmurBoldLeft('Nilai Pengikatan'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formLos[index].nilaiPengikatan!.toString()),
                              ).text),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Pemilik'),
                              textUmur(':'),
                              textUmurBoldLeft('${formLos[index].namaPemilik}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Alamat'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLos[index].alamatPemilik}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Table(
                        columnWidths: {0: const FlexColumnWidth(1)},
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            children: [
                              textUmurBoldLeft(
                                  '${formLos[index].deskripsiPanjang}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        formLainnya != null
            ? ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemCount: formLainnya.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textUmurBold('DATA JAMINAN'),
                                    textUmurBold(
                                        '${formLainnya[index].deskripsiPanjang}'),
                                  ],
                                ),
                              ),
                              textUmur(''),
                              textUmur(''),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        color: PdfColors.grey,
                      ),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.22),
                          1: const FlexColumnWidth(0.02),
                          2: const FlexColumnWidth(0.26),
                        },
                        tableWidth: TableWidth.min,
                        children: [
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nama Perusahaan'),
                              textUmur(':'),
                              textUmurBoldLeft(
                                  '${formLainnya[index].namaAsuransiPenjamin}'),
                            ],
                          ),
                          TableRow(
                            decoration: const BoxDecoration(
                              color: PdfColors.grey,
                            ),
                            children: [
                              textUmurBoldLeft('Nilai Pasar'),
                              textUmur(':'),
                              textUmurBoldLeft(MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                leftSymbol: 'Rp. ',
                                precision: 0,
                                initialValue: double.parse(
                                    formLainnya[index].nilaiPasar!.toString()),
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
        SizedBox(
          height: 10,
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

Widget textUmurWide(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );

Widget textUmurBoldLeft(
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
