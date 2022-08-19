// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

// ignore: must_be_immutable
class Tutorial extends StatelessWidget {
  Tutorial({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

  String mdContent =
      """

# Tutorial

1. Input Jumlah Equity / Modal & Pinjaman pada section Data Keuangan.
  
2. Kemudian inputkan kredit yang diminta, jangan langsung verifikasi kredit !
  
3. Lalu Klik Tombol "HItung Total Asset + Kredit yang diminta".
  
4. Lalu pada tab Angsuran isikan sesuai dengan inputan debitur kemudian Klik Hitung Flat / Efektif.
  
5. Dan juga Hitung Total Flat / Efektif.
  
6. Scroll sampai bawah kemudian Hitung Total Angsuran kredit.
  
7. Masuk ke tab Asumsi Keuangan Inputkan sesuai dengan data di debitur kemudian klik tombol "Dapatkan Persentase".
  
8. Kemudian "Hitung Total Laba" dan "HItung Prosestase Laba".
  
9. Lalu pada tab Analisa Ratio tekan tombol satu persatu untuk menghitung analisa.
  
10. Lalu ke tab Summary untuk melihat hasil.
""";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Markdown(
          data: mdContent,
          padding: const EdgeInsets.all(32),
          styleSheet: // GoogleFonts
              MarkdownStyleSheet(
            h1: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
            h2: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            h3: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            h4: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            h5: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            h6: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            p: GoogleFonts.andika(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            a: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}
