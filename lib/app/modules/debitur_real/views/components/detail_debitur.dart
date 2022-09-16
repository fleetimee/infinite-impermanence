// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:akm/app/modules/debitur_real/views/components/keuangan/analisa_keuangan.dart';
import 'package:akm/app/modules/debitur_real/views/components/bisnis/analisa_bisnis.dart';
import 'package:akm/app/modules/debitur_real/views/components/keuangan/input_keuangan_fixed.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/modules/debitur_real/views/components/data_pribadi/data_pribadi.dart';
import 'package:akm/app/modules/debitur_real/views/components/keuangan/neraca.dart';
import 'package:akm/app/modules/debitur_real/views/components/keuangan/rugi_laba.dart';

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
                      const ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(
                          'A. KARAKTER',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        children: [],
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
                                  'Data Analisa Kuantitatif Belum Lengkap',
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
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
