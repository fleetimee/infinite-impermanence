// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePkPdf(DebiturInsight debtor) async {
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
    title: 'Pk',
    author: 'fleetime',
    compress: true,
    creator: 'fleetime',
    pageMode: PdfPageMode.fullscreen,
    version: PdfVersion.pdf_1_5,
  );

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
              child: Text(
                '                 Pada hari ini ${DateFormat('EEEE', 'id_ID').format(DateTime.now())} tanggal ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())}  bertempat di Yogyakarta kami yang bertandatangan dibawah ini masing-masing:       ',
                style: const TextStyle(
                  fontSize: 12,
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
                      textKolomAtas(
                          'PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA berkedudukan di Yogyakarta, beralamat di Jalan Tentara Pelajar No. 7 Yogyakarta, dalam hal ini diwakili oleh ADI NUGRAHA, Pemimpin Cabang Pembantu PT. Bank Pembangunan Daerah Daerah Istimewa Yogyakarta Cabang Pembantu Prawirotaman, selaku Penerima Kuasa Substitusi Nomor : 1415/OM 0005 tanggal 10 Agustus 2022 dari SUROSO, Pemimpin PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA CABANG SENOPATI yang dalam jabatannya tersebut bertindak untuk dan atas nama PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA, berdasarkan Surat Keputusan Direksi PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA Nomor 0160/KP 1006 tanggal 9 Agustus 2022 dan Surat Kuasa Direksi PT. BANK PEMBANGUNAN DAERAH DAERAH ISTIMEWA YOGYAKARTA Nomor 387/OM 0005 tanggal 09 Agustus 2022 untuk selanjutnya disebut BANK. '),
                      textKolomAtasBold(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtasBold('II.'),
                      textKolomAtas(
                          'Avita Yulianingsih pekerjaan Mengurus Rumah Tangga beralamat di Kadipiro, RT. 005, RW. 000, Ngestiharjo, Kasihan, Bantul, berdasarkan Kartu Tanda Penduduk Kabupaten Bantul nomor 3312125707930004, Raden Daniel Cahya Prawira pekerjaan Wiraswasta beralamat di Kadipiro, RT. 005, RW.000, Ngestiharjo, Kasihan, Bantul, berdasarkan Kartu Tanda Penduduk Kabupaten Bantul nomor 3404062307920008, Dalam perjanjian ini bertindak untuk dan atas nama diri sendiri selanjutnya disebut DEBITUR '),
                      textKolomAtasBold(''),
                    ],
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: RichText(
                text: TextSpan(
                  text:
                      'adalah calon debitur/debitur di PT Bank BPD DIY Kantor Cabang pembantu Prawirotaman ',
                  style: const TextStyle(fontSize: 12, lineSpacing: 2.5),
                  children: [
                    TextSpan(
                      text: 'dengan nomor rekening :',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Text(
                'Dengan ini menyatakan bahwa :',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.80),
                  2: const FlexColumnWidth(0.15),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('a.'),
                      textBahwa(
                          'Telah membaca dan memahami seluruh persyaratan dan ketentuan yang berlaku untuk pemberian Fasilitas Kredit di PT Bank BPD DIY.'),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('b.'),
                      textBahwa(
                          'Memberikan kuasa kepada PT Bank BPD DIY untuk melaporkan terkait Fasilitas Kredit diantaranya data debitur, kredit, garansi bank, agunan, penjamin, pengurus/pemilik dan laporan keuangan sesuai ketentuan yang berlaku ke dalam Sistem Layanan Informasi Keuangan'),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('c.'),
                      textBahwa(
                          'Mengetahui dan menyetujui bahwa seluruh data dan laporan yang disampaikan kepada PT Bank BPD DIY akan diteruskan ke Otoritas Jasa Keuangan (OJK) ataupun regulator.'),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('d.'),
                      textBahwa(
                          'Sehubungan dengan hal tersebut maka seluruh data dan laporan yang disampaikan kepada PT Bank BPD DIY menjadi tanggung jawab debitur.'),
                      textKolomAtas(''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Text(
                'Demikian Surat Pernyataan ini dibuat dengan sebenarnya sesuai fakta, tanpa ada paksaan atau tekanan dari pihak manapun dan saya bersedia dituntut di Pengadilan apabila dikemudian hari ada pernyataan atau data yang tidak benar.',
                style: const TextStyle(
                  fontSize: 12,
                  lineSpacing: 2.5,
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Yogyakarta, _____________',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        'Yang Membuat Pernyataan',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        height: 100,
                      ),
                      Text(
                        '${debtor.peminjam1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
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
