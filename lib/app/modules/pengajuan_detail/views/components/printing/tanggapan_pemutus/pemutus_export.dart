import 'package:akm/app/models/pengajuan/pengajuan_detail.model.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';

Future<Uint8List> makePemutusPdf(PengajuanDetail pengajuan) async {
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
    title: 'Tanggapan Analis',
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
            Image(
              imageLogo,
              height: 25,
            ),
            Container(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'TANGGAPAN KOMITE KREDIT (PEMUTUS)',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(height: 10),
            Table(
              border: const TableBorder(
                horizontalInside: BorderSide.none,
                left: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                top: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                verticalInside: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.60),
                1: const FlexColumnWidth(0.40),
              },
              children: [
                TableRow(
                  children: [
                    // Left Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.30),
                        1: const FlexColumnWidth(0.70),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('Nama Pemohon'),
                            textKolomAtas(': ${pengajuan.debitur?.peminjam1}'),
                          ],
                        ),
                        TableRow(
                          children: [
                            textKolomAtas('Alamat'),
                            textKolomAtas(': ${pengajuan.debitur?.alamat1}'),
                          ],
                        ),
                      ],
                    ),
                    // Righ Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.60),
                        1: const FlexColumnWidth(0.40),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('Tgl Rapat Komite'),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            textKolomAtas('No MKK'),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Table(
              border: const TableBorder(
                left: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                verticalInside: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.60),
                1: const FlexColumnWidth(0.40),
              },
              children: [
                TableRow(
                  children: [
                    // Left Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.70),
                        1: const FlexColumnWidth(0.30),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('SETUJU / TOLAK'),
                          ],
                        ),
                      ],
                    ),
                    // Righ Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.70),
                        1: const FlexColumnWidth(0.30),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('Tanggal'),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Table(
              border: const TableBorder(
                left: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                verticalInside: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.60),
                1: const FlexColumnWidth(0.40),
              },
              children: [
                TableRow(
                  children: [
                    // Left Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.70),
                        1: const FlexColumnWidth(0.30),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('Bahasan :'),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            ListView.builder(
                              itemCount: pengajuan.bahasanPengutus?.length ?? 0,
                              itemBuilder: (context, index) {
                                final bahasan =
                                    pengajuan.bahasanPengutus![index];
                                return textKolomAtas(
                                  '${index + 1}. $bahasan',
                                  align: TextAlign.justify,
                                );
                              },
                            ),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                    // Righ Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.70),
                        1: const FlexColumnWidth(0.30),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas(''),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Table(
              border: const TableBorder(
                left: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                verticalInside: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.60),
                1: const FlexColumnWidth(0.40),
              },
              children: [
                TableRow(
                  children: [
                    // Left Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.70),
                        1: const FlexColumnWidth(0.30),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas(' '),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            textKolomAtas(' '),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                    // Righ Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.90),
                        1: const FlexColumnWidth(0.10),
                      },
                      children: [
                        TableRow(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: textKolomAtas(pengajuan.user!.isEmpty
                                  ? '-'
                                  : pengajuan.user![2].displayName!),
                            ),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: textKolomAtas('Pemimpin Cabang Pembantu'),
                            ),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Table(
              border: const TableBorder(
                left: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                top: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: PdfColors.black,
                  width: 0.5,
                ),
                verticalInside: BorderSide.none,
              ),
              columnWidths: {
                0: const FlexColumnWidth(0.60),
                1: const FlexColumnWidth(0.40),
              },
              children: [
                TableRow(
                  children: [
                    // Left Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.99),
                        1: const FlexColumnWidth(0.01),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas('1. Coret yang tidak perlu'),
                            textKolomAtas(''),
                          ],
                        ),
                        TableRow(
                          children: [
                            textKolomAtas(
                                '2. Ruang untuk tanggapan ,beri garis menyilang bila tidak perlu'),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            textKolomAtas(
                                '3. Isi tanggal, tanda tangan, nama jelas dan jabatan'),
                            textKolomAtas(' '),
                          ],
                        ),
                      ],
                    ),
                    // Righ Side
                    Table(
                      columnWidths: {
                        0: const FlexColumnWidth(0.90),
                        1: const FlexColumnWidth(0.10),
                      },
                      children: [
                        TableRow(
                          children: [
                            textKolomAtas(' '),
                            textKolomAtas(' '),
                          ],
                        ),
                        TableRow(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: textKolomAtas(''),
                            ),
                            textKolomAtas(' '),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
