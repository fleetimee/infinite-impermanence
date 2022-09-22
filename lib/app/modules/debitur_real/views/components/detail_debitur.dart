// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../../../../common/style.dart';
import '../../../../models/debtor.dart';
import '../../../../routes/app_pages.dart';
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
                      const ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          'C. JENIS USAHA',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [],
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
                  ExpansionTile(
                    title: const Text('Berkas untuk di print'),
                    leading: const Icon(
                      FontAwesomeIcons.print,
                    ),
                    children: [
                      ListTile(
                        title: const Text('Print Keuangan'),
                        onTap: () {
                          debtor.analisaKeuangan == null
                              ? Get.snackbar(
                                  'Gagal',
                                  'Data Analisa Keuangan Belum Lengkap',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                )
                              : Get.toNamed(
                                  Routes.KEUANGAN_PRINT,
                                  arguments: debtor,
                                );
                        },
                        trailing: debtor.analisaKeuangan == null
                            ? const Text('Not Ready 😭')
                            : const Text('Ready 👍'),
                      ),
                      ListTile(
                        title: const Text('Print Bisnis'),
                        onTap: () {
                          debtor.analisaBisnis == null
                              ? Get.snackbar(
                                  'Gagal',
                                  'Data Analisa Bisnis Belum Lengkap',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                )
                              : Get.toNamed(
                                  Routes.BISNIS_PRINT,
                                  arguments: debtor,
                                );
                        },
                        trailing: debtor.analisaKeuangan == null
                            ? const Text('Not Ready 😭')
                            : const Text('Ready 👍'),
                      ),
                      ListTile(
                        title: const Text('Print Karakter'),
                        onTap: () {
                          debtor.analisaKarakter == null
                              ? Get.snackbar(
                                  'Gagal',
                                  'Data Analisa Karakter Belum Lengkap',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                )
                              : Get.toNamed(
                                  Routes.KARAKTER_PRINT,
                                  arguments: debtor,
                                );
                        },
                        trailing: debtor.analisaKarakter == null
                            ? const Text('Not Ready 😭')
                            : const Text('Ready 👍'),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
