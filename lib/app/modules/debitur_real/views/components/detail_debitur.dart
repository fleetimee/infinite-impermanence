// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'jenis_usaha/jenis_usaha.dart';
import 'printing/printing_tile.dart';
import '../../../../common/style.dart';
import '../../../../models/debtor.dart';
import '../../controllers/debitur_real_controller.dart';
import 'bisnis/analisa_bisnis.dart';
import 'data_pribadi/data_pribadi.dart';
import 'karakter/analisa_karakter.dart';
import 'keuangan/analisa_keuangan.dart';
import 'keuangan/input_keuangan_fixed.dart';
import 'keuangan/neraca.dart';
import 'keuangan/rugi_laba.dart';

class DetailDebitur extends StatelessWidget {
  DetailDebitur({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  final controller = Get.put(DebiturRealController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      child: Obx(
        () => controller.loadingFetch.value
            ? const SizedBox()
            : ExpansionTile(
                backgroundColor: secondaryColor,
                initiallyExpanded: true,
                title: const Text('Detail Debitur'),
                children: [
                  // Detail Debitur
                  DataPribadi(debtor: debtor),
                  // Analisa Kuantitatif
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text('Analisa Kuantitatif'),
                    leading: const Icon(
                      FontAwesomeIcons.wallet,
                    ),
                    children: [
                      ExpansionTile(
                          initiallyExpanded: true,
                          title: const Text(
                            'A. KEUANGAN',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          children: [
                            Neraca(debtor: debtor),
                            RugiLaba(debtor: debtor),
                            InputKeuanganFixed(debtor: debtor),
                            AnalisaKeuanganTile(debtor: debtor),
                          ]),
                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text('Analisa Kualitatif'),
                    leading: const Icon(
                      FontAwesomeIcons.chartPie,
                    ),
                    children: [
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: const Text(
                          'A. KARAKTER',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [
                          AnalisaKarakterTile(debtor: debtor),
                        ],
                      ),
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: const Text(
                          'B. BISNIS',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [
                          AnalisaBisnisTile(debtor: debtor),
                        ],
                      ),
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: const Text(
                          'C. JENIS USAHA',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [
                          AnalisaJenisUsahaTile(debtor: debtor),
                        ],
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Analisa Agunan'),
                    leading: Icon(FontAwesomeIcons.vanShuttle),
                    initiallyExpanded: true,
                    children: [
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          'A. KENDARAAN',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [],
                      ),
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          'B. TANAH',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [],
                      ),
                      ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          'C. BANGUNAN',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [],
                      ),
                    ],
                  ),
                  PrintingTile(debtor: debtor),
                ],
              ),
      ),
    );
  }
}
