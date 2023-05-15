// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makeSlikPdf(DebiturInsight debtor) async {
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
    title: 'Slik',
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
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SURAT PERNYATAAN',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    'Pelaporan Penyediaan Dana ke dalam Sistem Layanan Informasi Keuangan',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Text(
                'Yang bertanda tangan di bawah ini:',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.35),
                  1: const FlexColumnWidth(0.05),
                  2: const FlexColumnWidth(0.60),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('Nama'),
                      textKolomAtas(':'),
                      textKolomAtas(
                        '${debtor.peminjam1}',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('Tempat / Tanggal Lahir'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          '${debtor.tempatLahir}, ${DateFormat('dd MMMM yyyy').format(DateTime.parse(debtor.tanggalLahir.toString()))}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('No KTP / No NPWP'),
                      textKolomAtas(':'),
                      textKolomAtas(
                        '${debtor.noKtp1}',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('Alamat'),
                      textKolomAtas(':'),
                      textKolomAtas(
                        '${debtor.alamat1}',
                      ),
                    ],
                  ),
                ],
              ),
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
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          fontSize: 11,
        ),
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
