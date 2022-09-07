// 🐦 Flutter imports:
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:get/get.dart';

class PerkiraanNeracaTabel extends StatelessWidget {
  PerkiraanNeracaTabel({super.key});

  final controller = Get.put(RugiLabaController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Perkiraan Neraca'),
      children: [
        SizedBox(
          height: 700,
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 900,
            border: TableBorder.lerp(
              TableBorder.all(color: const Color(0xffE0E0E0), width: 1),
              TableBorder.all(color: const Color(0xffE0E0E0), width: 1),
              0.5,
            ),
            columns: const [
              DataColumn2(
                  label: Text(
                    'AKTIVA',
                    style: subtitle2,
                  ),
                  size: ColumnSize.L),
              DataColumn2(
                label: Text(''),
              ),
              DataColumn2(label: Text(''), size: ColumnSize.L),
              DataColumn2(
                  label: Text(
                    'PASIVA',
                    style: subtitle2,
                  ),
                  size: ColumnSize.L),
            ],
            rows: [
              const DataRow2(
                cells: [
                  DataCell(
                    Text('Aktiva Lancar', style: heading2),
                  ),
                  DataCell(
                    SizedBox.shrink(),
                  ),
                  DataCell(
                    Text('Hutang'),
                  ),
                  DataCell(
                    SizedBox.shrink(),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('1. Kas'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_kas',
                      controller: controller.aktivaLancarKas,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text(
                      '1. Hutang Usaha',
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'hutang_usaha',
                      controller: controller.hutangUsaha,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Bank')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_bank',
                      controller: controller.aktivaBank,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(Text('2. Hutang Bank')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'hutang_bank',
                      controller: controller.hutangBank,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('3. Piutang Usaha'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_piutang_usaha',
                      controller: controller.aktivaPiutangUsaha,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(Text('3. Hutang lainnya')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'hutang_lainnya',
                      controller: controller.hutangLainnya,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('4. Persediaan'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_persediaan',
                      controller: controller.aktivaPersediaan,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              emptyRow(),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('Jumlah Aktiva Lancar'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'jumlah_aktiva_lancar',
                      controller: controller.jumlahAktivaLancar,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text('Jumlah Hutang'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'jumlah_hutang',
                      controller: controller.jumlahHutang,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              emptyRow(),
              DataRow2(
                cells: [
                  const DataCell(
                    Text(
                      'Aktiva Tetap',
                      style: heading2,
                    ),
                  ),
                  const DataCell(
                    SizedBox.shrink(),
                  ),
                  const DataCell(
                    Text(
                      'Modal',
                      style: heading2,
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'modal',
                      controller: controller.modal,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              emptyRow(),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('Jumlah Aktiva Tetap'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'jumlah_aktiva_tetap',
                      controller: controller.jumlahAktivaTetap,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text('Jumlah Modal'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'modal_result',
                      controller: controller.modal,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text(
                      'JUMLAH AKTIVA',
                      style: subtitle2,
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      controller: controller.jumlahAktiva,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text(
                      'JUMLAH PASIVA',
                      style: subtitle2,
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'jumlah_pasiva',
                      controller: controller.jumlahPasiva,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  DataRow2 emptyRow() {
    return const DataRow2(
      cells: [
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
      ],
    );
  }
}
