// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';

class PerkiraanLabaRugi extends StatelessWidget {
  const PerkiraanLabaRugi({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Perkiraan Laba / Rugi'),
      children: [
        SizedBox(
          height: 600,
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 800,
            columns: const [
              DataColumn2(
                label: Text(
                  'Perkiraan penjualan :',
                  style: subtitle2,
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
              DataRow2(
                cells: [
                  DataCell(Text('Harga pokok penjualan')),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Rp. 0')),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Laba Kotor')),
                  DataCell(Text('Rp. 0')),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(Text('Biaya :')),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(Text('1. Biaya Tenaga Kerja')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('100000')),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(Text('2. Biaya Operasional')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(Text('2. Biaya Lainnya')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Total Biaya')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Laba sebelum pajak (EBIT)')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Perkiraan Pajak')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                ],
              ),
              DataRow2(
                cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('Laba setelah pajak')),
                  DataCell(SizedBox.shrink()),
                  DataCell(Text('1000000')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
