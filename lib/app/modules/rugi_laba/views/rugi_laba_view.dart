// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/rugi_laba/views/components/perkiraan_neraca.dart';
import 'package:akm/app/modules/rugi_laba/views/components/perkiraan_rugi_laba.dart';
import '../controllers/rugi_laba_controller.dart';

class RugiLabaView extends GetView<RugiLabaController> {
  const RugiLabaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rugi / Laba'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'LAPORAN KEUANGAN',
                    style: title,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: Text(
                            'Nama Debitur',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Novian Andika',
                            style: subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: Text(
                            'Alamat',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Jl. Raya Cisarua No.1 RT.01/RW.01 Cisarua, Cisarua, Kota Bandung, Jawa Barat 40286',
                            style: subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: Text(
                            'No SKPK',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '44444444444444',
                            style: subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Center(
                  child: Text(
                    'PERKIRAAN NERACA',
                    style: title,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Per tanggal : ${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
                    style: subtitle2,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    '(Tabel di bawah ini bisa di scroll secara horizontal)',
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const PerkiraanNeracaTabel(),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'PERKIRAAN LABA / RUGI',
                    style: title,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Periode bulan : ${DateFormat('MMMM yyyy').format(DateTime.now())}',
                    style: subtitle2,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Center(
                  child: Text(
                    '(Tabel di bawah ini bisa di scroll secara horizontal)',
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const PerkiraanLabaRugi(),
                const SizedBox(
                  height: 16.0,
                ),
                const Center(
                  child: Text(
                    'PERKIRAAN PENGHASILAN BERSIH PER BULAN',
                    style: title,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    '(Tabel di bawah ini bisa di scroll secara horizontal)',
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                SizedBox(
                  height: 400,
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 800,
                    columns: const [
                      DataColumn2(
                        label: Text(
                          'Penghasilan rata rata per bulan',
                        ),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: SizedBox.shrink(),
                      ),
                      DataColumn2(
                        label: SizedBox.shrink(),
                      ),
                      DataColumn2(
                        label: SizedBox.shrink(),
                      ),
                    ],
                    rows: const [
                      DataRow2(
                        cells: [
                          DataCell(Text('Omzet penjualan rata - rata :')),
                          DataCell(SizedBox.shrink()),
                          DataCell(SizedBox.shrink()),
                          DataCell(Text('Rp. 1.000.000')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
