// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/views/components/printing/spkk/spkk_export.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

Future<Uint8List> makePkPdf(debtor) async {
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load('assets/fonts/times-new-roman.ttf')),
    bold: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold.ttf')),
    boldItalic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-bold-italic.ttf')),
    italic: Font.ttf(
        await rootBundle.load('assets/fonts/times-new-roman-italic.ttf')),
  );

  final DebiturInsight debtorInsight = debtor[0];
  final Map<dynamic, dynamic> formData = debtor[1] as Map<dynamic, dynamic>;

  TextStyle normalStyle = const TextStyle(
    fontSize: 11,
    lineSpacing: 1.5,
  );

  TextStyle boldStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    lineSpacing: 1.5,
  );

  TextStyle boldStyleItalic = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    lineSpacing: 1.5,
  );

  final pdf = Document(
    theme: myTheme,
    title: 'Pk',
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
            Container(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PERJANJIAN KREDIT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'No .....................................................................',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
              // child: Text(
              //   '                 Pada hari ini ${DateFormat('EEEE', 'id_ID').format(DateTime.now())} tanggal ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())}  bertempat di Yogyakarta kami yang bertandatangan dibawah ini masing-masing:       ',
              //   style: const TextStyle(
              //     fontSize: 11,
              //     lineSpacing: 1.5,
              //   ),
              // ),
              child: RichText(
                text: TextSpan(
                  style: normalStyle,
                  children: [
                    const TextSpan(
                      text: '                 Pada hari ini ',
                    ),
                    TextSpan(
                      text: DateFormat('EEEE', 'id_ID').format(DateTime.now()),
                      style: boldStyle,
                    ),
                    const TextSpan(
                      text: ' tanggal ',
                    ),
                    TextSpan(
                      text: DateFormat('dd MMMM yyyy', 'id_ID')
                          .format(DateTime.now()),
                      style: boldStyle,
                    ),
                    const TextSpan(
                      text:
                          '  bertempat di Yogyakarta kami yang bertandatangan dibawah ini masing-masing:       ',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtasBold('I.'),
                      textKolomAtasBank(
                          'PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA berkedudukan di Yogyakarta, beralamat di Jalan Tentara Pelajar No. 7 Yogyakarta, dalam hal ini diwakili oleh ${formData['pemimpin_kantor']}, Pemimpin Cabang Pembantu PT. Bank Pembangunan Daerah Daerah Istimewa Yogyakarta ${debtor[2]}, selaku Penerima Kuasa Substitusi Nomor : ${formData['no_subtitusi']} dari ${formData['pemimpin_cabut']}, Pemimpin PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA ${debtor[3]} yang dalam jabatannya tersebut bertindak untuk dan atas nama PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA, berdasarkan Surat Keputusan Direksi PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA Nomor 0160/KP 1006 tanggal 9 Agustus 2022 dan Surat Kuasa Direksi PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA Nomor 387/OM 0005 tanggal 09 Agustus 2022 untuk selanjutnya disebut BANK. '),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtasBold('II.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${debtorInsight.peminjam1}',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text: ' pekerjaan ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: '${debtorInsight.pekerjaan1}',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text: ' beralamat di ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: '${debtorInsight.alamat1}',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text: ', berdasarkan Kartu Tanda Penduduk ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: 'Kabupaten / Kota ${debtorInsight.ktp1}',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text: ' nomor ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: '${debtorInsight.noKtp1}',
                                style: boldStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  debtorInsight.statusKeluarga == 'Kawin'
                      ? TableRow(
                          children: [
                            textKolomAtasBold(''),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${debtorInsight.peminjam2}',
                                      style: boldStyle,
                                    ),
                                    TextSpan(
                                      text: ' pekerjaan ',
                                      style: normalStyle,
                                    ),
                                    TextSpan(
                                      text: '${debtorInsight.pekerjaan2}',
                                      style: boldStyle,
                                    ),
                                    const TextSpan(
                                      text: ' beralamat di ',
                                      style: TextStyle(
                                        fontSize: 11,
                                        lineSpacing: 1.5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${debtorInsight.alamat2}',
                                      style: boldStyle,
                                    ),
                                    TextSpan(
                                      text:
                                          ', berdasarkan Kartu Tanda Penduduk ',
                                      style: normalStyle,
                                    ),
                                    TextSpan(
                                      text:
                                          'Kabupaten / Kota ${debtorInsight.ktp2}',
                                      style: boldStyle,
                                    ),
                                    TextSpan(
                                      text: ' nomor ',
                                      style: normalStyle,
                                    ),
                                    TextSpan(
                                      text: '${debtorInsight.noKtp2}',
                                      style: boldStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            textKolomAtasBold(''),
                          ],
                        )
                      : TableRow(
                          children: [
                            textKolomAtasBold(''),
                            textKolomAtas(''),
                            textKolomAtasBold(''),
                          ],
                        ),
                  TableRow(
                    children: [
                      textKolomAtasBold(''),
                      // textKolomAtas(
                      //     'Dalam perjanjian ini bertindak untuk dan atas nama diri sendiri selanjutnya disebut DEBITUR'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Dalam perjanjian ini bertindak untuk dan atas nama diri sendiri selanjutnya disebut ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: 'DEBITUR',
                                style: boldStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtas(''),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
              child: Text(
                'Para pihak tersebut di atas terlebih dahulu menerangkan sebagai berikut : ',
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Bahwa atas permohonan DEBITUR, BANK telah memutuskan menyetujui untuk memberikan kredit kepada DEBITUR.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Bahwa persetujuan BANK tersebut telah diberitahukan kepada DEBITUR antara lain mengenai besarnya plafon kredit, jangka waktu, suku bunga, biaya-biaya, denda dan termasuk segala persyaratan yang ditentukan. Pemberitahuan tersebut telah diterima dan disetujui DEBITUR yang dibuktikan dengan telah ditandatangani dan diserahkan kembali kepada BANK Surat Pemberitahuan Persetujuan Kredit (SPPK) Nomor: /KR 0100 tanggal 17 Februari 2023.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'DEBITUR menyatakan telah menerima informasi mengenai Suku Bunga Dasar Kredit yang berlaku.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
              child: textKolomAtas(
                  'Berdasarkan keterangan-keterangan di atas, kedua belah pihak sepakat membuat dan menandatangani Perjanjian Kredit ini dengan ketentuan dan syarat-syarat sebagai berikut:'),
            ),
            Container(
              height: 80,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'DEFINISI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
              child: Text(
                'Dalam Perjanjian Kredit ini yang dimaksud dengan :',
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      boldText(
                          'Jaminan adalah jaminan yang bersifat materiil dan immateriil untuk mendukung keyakinan BANK atas kemampuan dan kesanggupan DEBITUR untuk melunasi kredit.',
                          'Jaminan'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      boldText(
                          'Angsuran adalah sejumlah uang yang dibayar setiap periode oleh DEBITUR kepada BANK sebagai pembayaran kewajiban atas pemberian kredit.',
                          'Angsuran'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      boldFirstAndSecondWord(
                          'Baki Debet adalah jumlah fasilitas kredit yang telah ditarik dan belum dibayar kembali oleh DEBITUR kepada BANK',
                          'Baki',
                          'Debet'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      boldText(
                        'Bunga adalah bunga kredit yaitu sejumlah uang yang wajib dibayar secara berkala oleh DEBITUR kepada BANK atas penggunaan fasilitas kredit.',
                        'Bunga',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('5.'),
                      boldText(
                        'Efektif adalah perhitungan bunga berdasarkan sisa pokok utang atau sisa saldo pinjaman.',
                        'Efektif',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('6.'),
                      italicBoldFirstAndSecondWord(
                          'Floating  Rate adalah bunga mengambang atau bunga berjalan.',
                          'Floating',
                          'Rate'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('7.'),
                      boldText(
                        'Denda adalah sejumlah uang yang harus dibayar oleh DEBITUR kepada BANK karena tidak dipenuhinya kewajiban DEBITUR berdasarkan Perjanjian Kredit.',
                        'Denda',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('8.'),
                      boldFirstAndSecondWord(
                        'Hari Kerja adalah hari-hari dimana BANK beroperasi untuk menjalankan usahanya (berdasarkan ketetapan Bank Indonesia atau lembaga negara/pemerintahan lainnya).',
                        'Hari',
                        'Kerja',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('9.'),
                      boldText(
                        'Kredit adalah penyediaan uang atau tagihan yang dapat dipersamakan dengan itu, berdasarkan Perjanjian Kredit antara BANK dengan DEBITUR yang menimbulkan utang dan kewajiban DEBITUR untuk melunasi utangnya setelah jangka waktu tertentu dengan pemberian bunga.',
                        'Kredit',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('10.'),
                      boldFirstAndSecondWord(
                          'Perjanjian Kredit adalah kesepakatan antara bank dengan debitur yang berisi syarat-syarat dan ketentuan pemberian fasilitas kredit yang telah disetujui kedua belah pihak.',
                          'Perjanjian',
                          'Kredit'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('11.'),
                      boldFirstAndSecondWord(
                          'Sifat  Kredit : ', 'Sifat', 'Kredit'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: italicBoldFirstAndSecondWord(
                              'Non  Revolving yaitu penarikan dana dilakukan satu kali sekaligus.',
                              'Non',
                              'Revolving')),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: italicBoldFirstAndSecondWord(
                              'Revolving yaitu penarikan dana dapat dilakukan setiap saat dan berkali-kali, sesuai ketentuan BANK yang berlaku.',
                              'Revolving',
                              '')),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('12.'),
                      boldFirstAndSecondWord(
                        'Suku Bunga adalah persentase dari pokok utang yang dibayarkan sebagai imbal jasa (bunga) dalam suatu periode tertentu.',
                        'Suku',
                        'Bunga',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('13.'),
                      boldText(
                        'Subrogasi adalah pengalihan hak tagih dari BANK kepada Perusahaan Asuransi setelah BANK menerima pembayaran klaim dari Perusahaan Asuransi',
                        'Subrogasi',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('14.'),
                      boldFirstAndSecondWord(
                        'Premi Asuransi adalah sejumlah uang yang harus dibayar oleh DEBITUR kepada Perusahaan Asuransi sehubungan dengan adanya Perjanjian Kredit',
                        'Premi',
                        'Asuransi',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('15.'),
                      boldFirstAndSecondWord(
                        'Biaya  Provisi adalah biaya yang dikenakan kepada debitur sebesar persentase tertentu dari jumlah pinjaman',
                        'Biaya',
                        'Provisi',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('16.'),
                      boldFirstAndSecondWord(
                        'Biaya Administrasi adalah biaya yang dikenakan kepada debitur sebesar jumlah tertentu terkait kegiatan administrasi bank untuk pemrosesan kredit',
                        'Biaya',
                        'Administrasi',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('17.'),
                      boldFirstAndSecondWord(
                        'Banker`s Clause adalah klausula yang memberikan hak kepada bank terlebih dahulu untuk menerima hak atau manfaat dari klaim asuransi.',
                        'Banker`s',
                        'Clause',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('18.'),
                      boldText(
                        'Restitusi adalah pengembalian pembayaran atas kelebihan pembayaran sebelumnya',
                        'Restitusi',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('19.'),
                      boldFirstAndSecondWord(
                        'Perjanjian Accessoir adalah suatu perjanjian yang timbul karena mengikuti perjanjian induk/pokok',
                        'Perjanjian',
                        'Accessoir',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('20.'),
                      boldText(
                        'LTV adalah pengukuran penilaian risiko dalam penyaluran kredit property dengan cara membandingkan jumlah pinjaman dengan nilai propertinya.',
                        'LTV',
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 2',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PLAFON, SIFAT DAN TUJUAN KREDIT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'BANK memberikan kredit kepada DEBITUR dengan plafond kredit sebesar ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: MoneyMaskedTextController(
                                  initialValue: double.parse(debtorInsight
                                      .inputKeuangan!.kreditDiusulkan!),
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                  leftSymbol: 'Rp ',
                                ).text,
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    ' (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.kreditDiusulkan!))} Rupiah)',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    'dan diakui sebagai hutang DEBITUR kepada BANK.',
                                style: normalStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sifat kredit adalah',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: ' Non Revolving.',
                                style: boldStyleItalic,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Kredit diberikan oleh BANK kepada DEBITUR untuk tujuan ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text:
                                    '${debtorInsight.inputKeuangan!.digunakanUntuk}',
                                style: boldStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 3',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'JANGKA WAKTU KREDIT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      // textKolomAtas(
                      //     'Jangka waktu kredit selama ${debtorInsight.inputKeuangan!.angsuran} (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.angsuran.toString()))}) bulan, terhitung sejak tanggal penandatanganan  Perjanjian Kredit ini.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jangka waktu kredit selama ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text:
                                    '${debtorInsight.inputKeuangan!.angsuran} (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.angsuran.toString()))}) bulan',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    ', terhitung sejak tanggal tanggal penandatanganan Perjanjian Kredit ini.',
                                style: normalStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'DEBITUR wajib melunasi seluruh kredit yang belum terpenuhi pada tanggal jatuh tempo. Dalam hal tanggal jatuh tempo kredit telah terlewati, maka hal tersebut tidak akan menghapuskan kewajiban-kewajiban DEBITUR yang belum dipenuhi berdasarkan Perjanjian Kredit, dokumen terkait dengan jaminan, dan dokumen lain yang terkait dengan Perjanjian Kredit ini.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 4',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'SUKU BUNGA',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Suku bunga kredit ditetapkan sebesar ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text:
                                    '${debtorInsight.inputKeuangan!.bungaPerTahun} % (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.bungaPerTahun.toString()))} Persen)',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    ' pertahun yang dihitung dari saldo pokok kredit secara efektif/floating rate.',
                                style: normalStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'DEBITUR menyetujui suku bunga pada ayat (1) pasal ini sewaktu – waktu dapat diubah oleh BANK karena sebab apapun yang sah dan perubahan suku bunga tersebut mengikat DEBITUR.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Perubahan pada ayat (2) pasal ini akan diinformasikan kepada DEBITUR.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 5',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'BIAYA – BIAYA DAN DENDA',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'DEBITUR wajib membayar biaya-biaya sebagai berikut : '),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'a. Biaya provisi tidak dikenakan',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'b. Biaya Administrasi tidak dikenakan.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'c. Biaya Premi Asuransi Jiwa dan PHK (Subrogasi), Asuransi Barang Jaminan sesuai tagihan perusahaan asuransi.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'd. Biaya meterai sesuai ketentuan yang berlaku.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Setelah penandatanganan Perjanjian Kredit, biaya-biaya pada ayat (1) pasal ini yang telah dibayar oleh DEBITUR kepada atau melalui BANK tidak dapat ditarik kembali oleh DEBITUR dengan alasan apapun juga, termasuk  tidak terbatas pada alasan atau sebab berupa pembatalan atau dibatalkannya pemberian kredit berdasarkan Perjanjian Kredit.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Dalam hal DEBITUR tidak melaksanakan kewajiban pembayaran angsuran kredit pada waktunya, maka BANK akan mengenakan denda sebesar 50 % (lima puluh persen) dari suku bunga pertahun dan dihitung dari besarnya kewajiban angsuran pokok yang tertunggak.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      textKolomAtas(
                          'Bunga dan Denda tetap dihitung dan/atau tetap dikenakan oleh BANK kepada DEBITUR,  meskipun jangka waktu kredit telah berakhir atau kredit telah dinyatakan “jatuh waktu seketika” apabila DEBITUR belum melunasi seluruh kewajiban kreditnya kepada BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 6',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PENGEMBALIAN PREMI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'DEBITUR dengan perpanjangan masa pertanggungan sebelum pertanggungan lama berakhir akan diberikan pengembalian premi (restitusi).'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Restitusi sebagaimana dimaksud dalam ayat (1) pasal ini dapat dilaksanakan apabila DEBITUR melunasi kreditnya sebelum tanggal jatuh tempo dan mengajukan kredit kembali.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Pengembalian premi (restitusi) tidak berlaku apabila DEBITUR melunasi kreditnya tetapi tidak mengajukan kredit kembali.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      textKolomAtas(
                          'Pengembalian premi (restitusi) tidak berlaku bagi DEBITUR yang pembayaran Imbal Jasa Penjaminan (IJP) dibayarkan oleh BANK atau pihak lain'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 7',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PERSYARATAN PENARIKAN KREDIT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Text(
                'Penarikan kredit dapat dilakukan oleh DEBITUR setelah DEBITUR memenuhi semua persyaratan dan ketentuan yang ditetapkan BANK,  sebagai berikut : ',
                style: const TextStyle(
                  fontSize: 11,
                  lineSpacing: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'DEBITUR telah menyerahkan dan menandatangani berkas – berkas administrasi  dan menyerahkan dokumen lainnya sesuai yang dipersyaratkanoleh BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'DEBITUR telah melunasi semua biaya sebagaimana diatur pada Pasal 5 ayat (1) Perjanjian Kredit ini.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Penarikan Kredit harus melalui Tabungan  DEBITUR di BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 8',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PEMBAYARAN KEMBALI KREDIT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      // textKolomAtas(
                      //     'DEBITUR wajib membayar kembali kredit kepada BANK dengan cara angsuran pokok dan bunga diangsur setiap bulan dengan jumlah angsuran yang sama besarnya dalam 23 (Dua puluh tiga) kali angsuran sebesar Rp. 2.216.030,00 (Dua juta dua ratus enam belas ribu tiga puluh rupiah) dan 1 (Satu) kali angsuran sebesar Rp. 2.216.075,00 (Dua juta dua ratus enam belas ribu tujuh puluh lima rupiah),  yang untuk pertama kali dibayar pada bulan berikutnya setelah ditandatangani perjanjian kredit ini hingga lunas selambat-lambatnya pada tanggal 17 Februari 2025 dengan ketentuan apabila tanggal kewajiban pembayaran tersebut jatuh pada hari libur (bukan hari kerja BANK), maka tanggal kewajiban pembayaran dimaksud diberlakukan 1 (satu) hari kerja BANK sebelumnya.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'DEBITUR wajib membayar kembali kredit kepada BANK dengan cara angsuran pokok dan bunga diangsur setiap bulan dengan jumlah angsuran yang sama besarnya dalam ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text:
                                    '${debtorInsight.inputKeuangan!.angsuran} (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.angsuran.toString()))})',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text: ' kali angsuran sebesar ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: MoneyMaskedTextController(
                                  initialValue: double.parse(
                                      debtorInsight.inputKeuangan!.angsuranRp!),
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                  leftSymbol: 'Rp ',
                                ).text,
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    ' (${Terbilang().terbilang(double.parse(debtorInsight.inputKeuangan!.angsuranRp.toString()))} Rupiah), ',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    'yang untuk pertama kali dibayar pada bulan berikutnya setelah ditandatangani perjanjian kredit ini hingga lunas selambat-lambatnya pada tanggal ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text: '...................................',
                                style: boldStyle,
                              ),
                              TextSpan(
                                text:
                                    ' dengan ketentuan apabila tanggal kewajiban pembayaran tersebut jatuh pada hari libur (bukan hari kerja BANK), maka tanggal kewajiban pembayaran dimaksud diberlakukan 1 (satu) hari kerja BANK sebelumnya.',
                                style: normalStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Besarnya jumlah angsuran sebagaimana tersebut pada ayat (1) Pasal ini, dapat langsung diubah oleh BANK apabila terjadi perubahan suku bunga kredit, dan akan diinformasikan  oleh BANK kepada DEBITUR.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Setoran-setoran uang oleh DEBITUR atau pihak lainnya ke dalam rekening DEBITUR di BANK dianggap sebagai pembayaran sebagian atau seluruh kewajiban kredit DEBITUR kepada BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      textKolomAtas(
                          'Guna pembayaran sejumlah kewajiban DEBITUR yang harus dibayarkan kepada BANK berdasarkan Perjanjian Kredit ini, dengan ini DEBITUR memberi kuasa kepada BANK untuk melakukan pemblokiran/pendebetan dari rekening tabungan nomor ………………....……. dan/ atau perubahannya serta rekening simpanan lainnya yang diyakini BANK milik DEBITUR pada BANK. Kuasa tersebut tidak dapat dicabut atau ditarik kembali oleh DEBITUR sampai kredit tersebut dinyatakan lunas oleh BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('5.'),
                      textKolomAtas(
                          'Semua pembayaran DEBITUR akan dicatat dalam pembukuan BANK. Pembukuan dan catatan di BANK merupakan bukti satu-satunya yang sah dari seluruh jumlah kewajiban DEBITUR kepada BANK berdasarkan perjanjian kredit ini yang wajib ditaati dan mengikat DEBITUR.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('6.'),
                      textKolomAtas(
                          'Apabila terjadi perbedaan pencatatan antara BANK dengan DEBITUR maka DEBITUR diberikan hak untuk meminta informasi dan klarifikasi terkait hal tersebut kepada BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 9',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'JAMINAN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'ntuk menjamin dipenuhinya kewajiban Debitur kepada BANK, dilakukan penjaminan kredit oleh ',
                                style: normalStyle,
                              ),
                              TextSpan(
                                text:
                                    '${debtorInsight.asuransi?.namaPerusahaan}.',
                                style: boldStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Imbal jasa penjaminan menjadi beban BANK dan dibayar sekaligus/seluruhnya dengan tarif imbal jasa penjaminan sesuai ketentuan yang berlaku.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Penjaminan kredit dilakukan tidak membebaskan Debitur dari kewajiban untuk melunasi kredit apabila terjadi klaim, melainkan dialihkan dari BANK kepada Perusahaan Penjamin dengan subrogasi.	'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 10',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'STATUS KUASA',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'DEBITUR menerangkan dengan ini memberi kuasa kepada  BANK untuk dan atas nama DEBITUR melakukan pendebetan rekening DEBITUR di BANK sampai kredit tersebut dinyatakan lunas, guna membayar kewajiban angsuran kredit, provisi dan biaya-biaya yang timbul dari Perjanjian Kredit ini.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Kuasa tersebut di dalam perjanjian ini diberikan kepada BANK dengan syarat tidak dapat dicabut kembali dan dengan pelepasan dari semua sebab-sebab yang oleh hukum Adat maupun pasal 1813 Kitab Undang-Undang Hukum Perdata dijadikan syarat berhentinya kuasa. '),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Kuasa di dalam Perjanjian Kredit ini menjadi bagian yang tidak dapat dipisahkan. '),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 11',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PERUBAHAN SYARAT – SYARAT PERJANJIAN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'BANK dapat melakukan perubahan ketentuan dan syarat-syarat dalam perjanjian ini apabila terjadi perubahan atas peraturan perundang-undangan yang berlaku dan/atau karena terbitnya peraturan perundang-undangan baru oleh Pemerintah termasuk Bank Indonesia.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Perubahan ketentuan dan syarat perjanjian tersebut meliputi juga perubahan atas perjanjian  accesoir-nya atau dokumen – dokumen lainnya yang berkaitan dan tidak dapat dipisahkan dengan  Perjanjian Kredit ini.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Perubahan pada ayat (1) dan ayat (2) pasal ini akan di informasikan kepada DEBITUR melalui telepon atau surat atau email ataupun saluran komunikasi lainnya paling lambat 30 (tiga puluh) hari kerja sebelum berlakunya perubahan dimaksud.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 12',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'MASA BERLAKU DAN BERAKHIRNYA PERJANJIAN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Perjanjian Kredit ini dinyatakan efektif berlaku dan mengikat kedua belah pihak setelah Perjanjian Kredit ini ditandatangani oleh BANK dan DEBITUR dan berakhir pada saat kredit lunas.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Menyimpang dari ketentuan Pasal 3 dan Pasal 12 ayat (1) di atas, BANK berhak   mengakhiri perjanjian ini dan menyatakan jatuh tempo seketika perjanjian ini dan DEBITUR wajib melunasi seketika seluruh kewajibannya berdasarkan perjanjian ini, apabila terjadi salah satu hal dari keadaan sebagai mana tersebut di bawah ini :'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'a. Menurut penilaian BANK, DEBITUR tidak sanggup memenuhi atau telah  melalaikan  kewajibannya berdasarkan perjanjian ini.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'b.	Menurut penilaian BANK, DEBITUR telah menunjukkan karakter yang tidak baik  dengan sengaja tidak memenuhi kewajibannya berdasarkan perjanjian ini.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textKolomAtas(
                            'c.	Menurut penilaian BANK, DEBITUR telah melakukan kesalahan dan/atau kelalaian sehingga kehilangan dan/atau berkurangnya penghasilan yang menjadi sumber utama angsuran kredit berdasarkan perjanjian ini.',
                          )),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 13',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'SYARAT-SYARAT LAIN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Text(
                'Selama hubungan kredit masih berlangsung dan belum lunas, DEBITUR wajib memenuhi dan mentaati hal-hal sebagai berikut :',
                style: const TextStyle(
                  fontSize: 11,
                  lineSpacing: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Harus selalu bersikap terbuka dan kooperatif kepada BANK dan Kuasanya.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Menjaga hubungan kemitraan dengan BANK sebaik-baiknya, antara lain dengan memenuhi pembayaran kewajiban kreditnya selalu tepat waktu sesuai dengan ketentuan yang berlaku.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Tidak melakukan tindakan yang dapat merugikan BANK.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 14',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PENGALIHAN KREDIT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Text(
                'BANK dapat mengalihkan kredit berdasarkan Perjanjian ini kepada pihak lain, dan akan dilakukan pemberitahuan terlebih dahulu kepada DEBITUR.',
                style: const TextStyle(
                  fontSize: 11,
                  lineSpacing: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 15',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'KOMUNIKASI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Semua komunikasi sehubungan Perjanjian Kredit ini akan dilakukan secara tertulis dapat melalui surat, email, telepon, atau faksimili dengan menggunakan alamat-alamat di bawah ini: '),
                      textKolomAtasBold('')
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtas(
                          'Dalam hal terjadi perubahan alamat sebagaimana tersebut di atas, perubahan tersebut harus diberitahukan secara tertulis kepada pihak lainnya dalam Perjanjian Kredit ini selambat-lambatnya 7 (tujuh) hari kerja sebelum perubahan alamat tersebut berlaku efektif. '),
                      textKolomAtasBold('')
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtasBold('Untuk DEBITUR'),
                      textKolomAtasBold('')
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.30),
                          1: const FlexColumnWidth(0.05),
                          2: const FlexColumnWidth(0.60),
                          3: const FlexColumnWidth(0.05)
                        },
                        children: [
                          TableRow(
                            children: [
                              textKolomAtas('Alamat Surat'),
                              textKolomAtas(':'),
                              textKolomBold('${debtorInsight.alamat1}'),
                              textKolomAtas(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textKolomAtas('Telepon/HP'),
                              textKolomAtas(':'),
                              textKolomBold(
                                  '...................................................................................'),
                              textKolomAtas(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textKolomAtas('Faksimili/Email'),
                              textKolomAtas(':'),
                              textKolomBold(
                                  '...................................................................................'),
                              textKolomAtas(''),
                            ],
                          )
                        ],
                      ),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtasBold('Untuk BANK'),
                      textKolomAtasBold('')
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      Table(
                        columnWidths: {
                          0: const FlexColumnWidth(0.30),
                          1: const FlexColumnWidth(0.05),
                          2: const FlexColumnWidth(0.60),
                          3: const FlexColumnWidth(0.05)
                        },
                        children: [
                          TableRow(
                            children: [
                              textKolomAtas('Alamat Surat'),
                              textKolomAtas(':'),
                              textKolomBold(
                                  'PT BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA ${debtor[2]} ${formData['alamat_kantor']}'),
                              textKolomAtas(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textKolomAtas('Telepon/HP'),
                              textKolomAtas(':'),
                              textKolomBold('${formData['telp_kantor']}'),
                              textKolomAtas(''),
                            ],
                          ),
                          TableRow(
                            children: [
                              textKolomAtas('Faksimili/Email'),
                              textKolomAtas(':'),
                              textKolomBold('${formData['fax_kantor']}'),
                              textKolomAtas(''),
                            ],
                          )
                        ],
                      ),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Jika perubahan alamat tersebut tidak diberitahukan, maka surat menyurat atau pemberitahuan-pemberitahuan berdasarkan Perjanjian Kredit ini dianggap telah diberikan semestinya dengan cara sebagaimana diatur dalam ayat (1) pasal ini.'),
                      textKolomAtasBold('')
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 16',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'KEADAAN KAHAR (FORCE MAJEURE)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Keadaan kahar adalah suatu kejadian atau keadaan yang terjadi karena hal-hal diluar kemampuan Para Pihak untuk mencegahnya yaitu yang disebabkan oleh pelaksanaan undang-undang, peraturan-peraturan atau instruksi-instruksi yang dikeluarkan oleh Pemerintah Republik Indonesia, kebakaran, ledakan, banjir, gempa bumi, topan/badai, hujan yang luar biasa, peperangan, huru-hara, keributan, blokade, perselisihan perburuhan, pemogokan massal dan wabah penyakit, yang secara langsung ada hubungannya dengan Perjanjian ini.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Dalam hal timbulnya keadaan kahar, pihak  yang mengalami keadaan kahar wajib memberitahukan kepada Pihak lainnya secara tertulis dalam kurun waktu selambat-lambatnya 7 X 24 jam (tujuh kali dua puluh empat jam) setelah terjadinya keadaan kahar tersebut dengan disertai bukti yang dapat diterima oleh pihak  yang tidak mengalami keadaan kahar, dan bilamana perlu harus menyertakan bukti-bukti yang sah dan asli dari instansi atau badan yang berwenang untuk itu.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas(
                          'Atas pemberitahuan pihak  yang mengalami keadaan kahar, maka pihak  yang tidak mengalami keadaan kahar dapat menyetujui atau menolak keadaan kahar tersebut secara tertulis dalam kurun waktu selambat-lambatnya 7 X 24 jam (tujuh kali dua puluh empat jam) setelah diterimanya pemberitahuan dari pihak  yang mengalami keadaan kahar.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      textKolomAtas(
                          'Apabila keadaan kahar ditolak oleh pihak yang tidak mengalami keadaan kahar, maka syarat-syarat dan ketentuan-ketentuan dalam Perjanjian Kredit ini tetap berlaku dan mengikat kedua belah Pihak.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasal 17',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    'PENYELESAIAN PERSELISIHAN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.88),
                  2: const FlexColumnWidth(0.07),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas(
                          'Apabila terjadi perselisihan di antara kedua belah pihak, maka kedua belah pihak sepakat untuk menyelesaikan secara kekeluargaan atau musyawarah mufakat. '),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas(
                          'Apabila tidak terjadi kesepakatan penyelesaian, maka kedua belah pihak sepakat untuk menyelesaikan secara hukum melalui Lembaga Alternatif Penyelesaian Sengketa (LAPS) atau  Pengadilan Negeri Yogyakarta.'),
                      textKolomAtasBold(''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Text(
                'Perjanjian ini telah disesuaikan dengan ketentuan peraturan perundang-undangan termasuk ketentuan Peraturan Otoritas Jasa Keuangan.',
                style: const TextStyle(
                  fontSize: 11,
                  lineSpacing: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Text(
                'Demikian Perjanjian ini dibuat dan ditandatangani oleh kedua belah pihak dalam keadaan sehat jasmani dan rohani yang bermeterai cukup, serta berlaku sejak tanggal penandatanganan perjanjian ini.',
                style: const TextStyle(
                  fontSize: 11,
                  lineSpacing: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DEBITUR',
                            style: boldStyle,
                          ),
                          SizedBox(height: 100),
                          Text(
                            '( ${debtorInsight.peminjam1} )',
                            style: normalStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BANK',
                            style: boldStyle,
                          ),
                          SizedBox(height: 100),
                          Text(
                            '( ${formData['pemimpin_kantor']} )',
                            style: normalStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  debtorInsight.peminjam2 != '' ||
                          debtorInsight.peminjam2 != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '',
                                  style: boldStyle,
                                ),
                                SizedBox(height: 100),
                                Text(
                                  '( ${debtorInsight.peminjam2} )',
                                  style: normalStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '',
                                  style: boldStyle,
                                ),
                                SizedBox(height: 100),
                                Text(
                                  '',
                                  style: normalStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );

  return pdf.save();
}

Widget textKolomAtas(
  final String text, {
  final TextAlign align = TextAlign.justify,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 11,
          lineSpacing: 1.5,
        ),
      ),
    );

Widget textKolomAtasBank(
  final String text, {
  final TextAlign align = TextAlign.justify,
}) {
  final int lastBankIndex = text.lastIndexOf('BANK');
  final String beforeBank = text.substring(0, lastBankIndex);
  final String bank = text.substring(lastBankIndex, lastBankIndex + 4);
  final String afterBank = text.substring(lastBankIndex + 4);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: RichText(
      textAlign: align,
      text: TextSpan(
        children: [
          TextSpan(
            text: beforeBank,
            style: const TextStyle(
              fontSize: 11,
              lineSpacing: 1.5,
            ),
          ),
          TextSpan(
            text: bank,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              lineSpacing: 1.5,
            ),
          ),
          TextSpan(
            text: afterBank,
            style: const TextStyle(
              fontSize: 11,
              lineSpacing: 1.5,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget textKolomAtasBold(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );

Widget textBahwa(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(fontSize: 11, lineSpacing: 2.5),
      ),
    );

Widget boldText(
  final String text,
  final String boldWord, {
  final TextAlign align = TextAlign.justify,
}) {
  final List<String> words = text.split(' ');
  final int boldIndex = words.indexOf(boldWord);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: RichText(
        textAlign: align,
        text: TextSpan(
          children: [
            for (int i = 0; i < words.length; i++)
              if (i == boldIndex)
                TextSpan(
                  text: words[i],
                  style: TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                TextSpan(
                  text: ' ${words[i]}',
                  style: const TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                  ),
                ),
          ],
        ),
      ));
}

Widget boldFirstAndSecondWord(
  final String text,
  final String boldWord1,
  final String boldWord2, {
  final TextAlign align = TextAlign.justify,
}) {
  final List<String> words = text.split(' ');
  final int boldIndex1 = words.indexOf(boldWord1);
  final int boldIndex2 = words.indexOf(boldWord2);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: RichText(
        textAlign: align,
        text: TextSpan(
          children: [
            for (int i = 0; i < words.length; i++)
              if (i == boldIndex1 || i == boldIndex2)
                TextSpan(
                  text: words[i],
                  style: TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                TextSpan(
                  text: ' ${words[i]}',
                  style: const TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                  ),
                ),
          ],
        ),
      ));
}

Widget italicBoldFirstAndSecondWord(
  final String text,
  final String boldWord1,
  final String boldWord2, {
  final TextAlign align = TextAlign.justify,
}) {
  final List<String> words = text.split(' ');
  final int boldIndex1 = words.indexOf(boldWord1);
  final int boldIndex2 = words.indexOf(boldWord2);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: RichText(
        textAlign: align,
        text: TextSpan(
          children: [
            for (int i = 0; i < words.length; i++)
              if (i == boldIndex1 || i == boldIndex2)
                TextSpan(
                  text: words[i],
                  style: TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              else
                TextSpan(
                  text: ' ${words[i]}',
                  style: const TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                  ),
                ),
          ],
        ),
      ));
}

Widget italicRestitusi(
  final String text,
  final String boldWord, {
  final TextAlign align = TextAlign.justify,
}) {
  final List<String> words = text.split(' ');
  final int boldIndex = words.indexOf(boldWord);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: RichText(
        textAlign: align,
        text: TextSpan(
          children: [
            for (int i = 0; i < words.length; i++)
              if (i == boldIndex)
                TextSpan(
                  text: words[i],
                  style: TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              else
                TextSpan(
                  text: ' ${words[i]}',
                  style: const TextStyle(
                    lineSpacing: 1.5,
                    fontSize: 11,
                  ),
                ),
          ],
        ),
      ));
}
