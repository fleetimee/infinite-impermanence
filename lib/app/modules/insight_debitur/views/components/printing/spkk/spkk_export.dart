// 🐦 Flutter imports:
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

Future<Uint8List> makeSpkkPdf(DebiturInsight debtor) async {
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Table(
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
                        textKolomAtas('Lampiran'),
                        textKolomAtas(':'),
                        textKolomAtas(
                          '__ Lembar',
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        textKolomAtas('Kepada'),
                        textKolomAtas(''),
                        textKolomAtas(
                          '',
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: textKolomAtas('Yogyakarta, ________________'),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  textKolomBold('Yth ${debtor.peminjam1}'),
                  textKolomBold('${debtor.alamat1}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 35),
              child: RichText(
                text: const TextSpan(
                  text: 'Perihal:',
                  style: TextStyle(fontSize: 11, lineSpacing: 2.5),
                  children: [
                    TextSpan(
                      text: ' Surat Pemberitahuan Persetujuan Kredit (SPKK)',
                      style: TextStyle(
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            textGeneral(
              '           Dengan ini kami beritahukan bahwa PT. Bank Pembangunan Daerah  Daerah Istimewa Yogyakarta dapat menyetujui permohonan kredit Kur Mikro yang tercantum dalam surat permohonan kredit Saudara tanggal  07 Januari 2023  dengan ketentuan dan syarat sebagai berikut :',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.30),
                  2: const FlexColumnWidth(0.02),
                  3: const FlexColumnWidth(0.63),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('1.'),
                      textKolomAtas('Plafond Kredit'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          'Rp ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString())).text} ( ${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()))} Rupiah )'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('2.'),
                      textKolomAtas('Peminjam'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          '1. ${debtor.peminjam1} ${debtor.peminjam2 == "" ? '' : '2. ${debtor.peminjam2}'}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('3.'),
                      textKolomAtas('Jenis Kredit'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          'UMKM/${double.parse(debtor.inputRugiLaba!.omzet.toString()) <= 100000000 ? "Mikro" : "Kecil"}/Angsuran Tetap/${double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) > 0 && double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) <= 10000000 ? "KUR Super Mikro" : double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) > 10000000 && double.parse(debtor.inputKeuangan!.kreditDiusulkan.toString()) <= 100000000 ? 'KUR Mikro' : 'KUR Kecil'}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('4.'),
                      textKolomAtas('Tujuan Penggunaan'),
                      textKolomAtas(':'),
                      textKolomAtas('${debtor.inputKeuangan!.digunakanUntuk}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('5.'),
                      textKolomAtas('Jangka Waktu'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          '${debtor.inputKeuangan!.angsuran.toString()} (${Terbilang().terbilang(double.parse(debtor.inputKeuangan!.angsuran.toString()))}) Bulan'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('6.'),
                      textKolomAtas('Pembayaran Kembali'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          'Rp. ${MoneyMaskedTextController(decimalSeparator: '', thousandSeparator: '.', precision: 0, initialValue: double.parse(debtor.inputKeuangan!.angsuranRp!.toString())).text}'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('7.'),
                      textKolomAtas('Bunga'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          '${debtor.inputKeuangan!.bungaPerTahun.toString()}% efektif floating rate per tahun'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('8.'),
                      textKolomAtas('Denda'),
                      textKolomAtas(':'),
                      textKolomAtas('50 % dari tingkat suku bunga pinjaman'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('9.'),
                      textKolomAtas('Biaya - biaya'),
                      textKolomAtas(''),
                      textKolomAtas(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtas(' - Materai'),
                      textKolomAtas(':'),
                      textKolomAtas('Sesuai ketentuan'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtas(' - Lain-lain'),
                      textKolomAtas(':'),
                      textKolomAtas(
                          'Asuransi Penjaminan Kredit di tanggung oleh Bank'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('10.'),
                      textKolomAtas('Asuransi Penjaminan'),
                      textKolomAtas(':'),
                      textKolomAtas(MoneyMaskedTextController(
                              decimalSeparator: '',
                              thousandSeparator: '.',
                              leftSymbol: 'Rp. ',
                              precision: 0,
                              initialValue: double.parse(
                                  debtor.asuransi!.totalAsuransi.toString()))
                          .text),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('11.'),
                      textKolomAtas('Jaminan Kredit'),
                      textKolomAtas(':'),
                      textKolomAtas('1. Placeholdr'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas(''),
                      textKolomAtas(''),
                      textKolomAtas(''),
                      textKolomAtas('2. Placeholdr'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('12.'),
                      textKolomAtas('Pengikatan Jaminan'),
                      textKolomAtas(':'),
                      textKolomAtas('Placheholder'),
                    ],
                  ),
                  TableRow(
                    children: [
                      textKolomAtas('13.'),
                      textKolomAtas('Syarat-syarat penandatanganan kredit '),
                      textKolomAtas(':'),
                      textKolomAtas(''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.95),
              }, children: [
                TableRow(
                  children: [
                    textKolomAtas(''),
                    textKolomAtas(
                        'a. Telah menandatangani SPPK ini sebagai tanda persetujuan'),
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.30),
                  2: const FlexColumnWidth(0.02),
                  3: const FlexColumnWidth(0.63),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('14.'),
                      textKolomAtas('Syarat-syarat Penarikan kredit '),
                      textKolomAtas(':'),
                      textKolomAtas(''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.95),
              }, children: [
                TableRow(
                  children: [
                    textKolomAtas(''),
                    textKolomAtas(
                        'a. Telah menandatangani Perjanjian Kredit dan Akta Pengikatan Jaminan serta melunasi semua biaya yang menjadi beban debitur.'),
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(
                columnWidths: {
                  0: const FlexColumnWidth(0.05),
                  1: const FlexColumnWidth(0.30),
                  2: const FlexColumnWidth(0.02),
                  3: const FlexColumnWidth(0.63),
                },
                children: [
                  TableRow(
                    children: [
                      textKolomAtas('15.'),
                      textKolomAtas('Syarat-syarat lain'),
                      textKolomAtas(':'),
                      textKolomAtas(''),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Table(columnWidths: {
                0: const FlexColumnWidth(0.05),
                1: const FlexColumnWidth(0.95),
              }, children: [
                TableRow(
                  children: [
                    textKolomAtas(''),
                    textKolomAtas(
                        'a. Telah menandatangani Perjanjian Kredit dan Akta Pengikatan J'),
                  ],
                ),
                TableRow(
                  children: [
                    textKolomAtas(''),
                    textKolomAtas('b. Telah menandatangani Perjanjian Kredit'),
                  ],
                ),
                TableRow(
                  children: [
                    textKolomAtas(''),
                    textKolomAtas(
                        'c. Telah menandatangani Perjanjian Kredit d'),
                  ],
                ),
              ]),
            ),
            textGeneral(
                'Persetujuan dengan ketentuan-ketentuan tersebut akan dituangkan dalam Perjanjian Kredit yang ditandatangani bersama antara Bank dengan Saudara.'),
            textGeneral(
                'Demikian surat pernyataan persetujuan ini dibuat dengan sebenarnya dan dapat dipergunakan sebagaimana mestinya.'),
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

Widget textGeneral(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(fontSize: 11, lineSpacing: 1.5),
      ),
    );

Widget textKolomBold(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.1),
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
