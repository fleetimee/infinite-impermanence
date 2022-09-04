import 'package:akm/app/modules/porsekot_table/controllers/porsekot_table_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class TabelPorsekot extends StatelessWidget {
  TabelPorsekot({super.key});

  final controller = Get.put(PorsekotTableController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1500,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 800,
        dividerThickness: 1,
        sortAscending: true,
        border: TableBorder.all(color: Colors.black),
        bottomMargin: 5,
        sortColumnIndex: 0,
        columns: const [
          DataColumn2(label: Text('Bulan ke'), size: ColumnSize.S),
          DataColumn2(label: Text('Tanggal')),
          DataColumn2(label: Text('Angs Pokok')),
          DataColumn2(label: Text('Angs Bunga')),
          DataColumn2(label: Text('Jml Angsuran')),
          DataColumn2(label: Text('Saldo')),
        ],
        rows: [
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan1',
                  readOnly: true,
                  controller: controller.bulan1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl1',
                  readOnly: true,
                  controller: controller.tanggal1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok1',
                  readOnly: true,
                  controller: controller.angsuranPokok1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga1',
                  readOnly: true,
                  controller: controller.angsuranBunga1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jumlahAngsuran1',
                  readOnly: true,
                  controller: controller.jmlAngsuran1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo1',
                  readOnly: true,
                  controller: controller.saldo1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan2',
                  readOnly: true,
                  controller: controller.bulan2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl2',
                  readOnly: true,
                  controller: controller.tanggal2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok2',
                  readOnly: true,
                  controller: controller.angsuranPokok2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga2',
                  readOnly: true,
                  controller: controller.angsuranBunga2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jmlAngsuran2',
                  controller: controller.jmlAngsuran2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo2',
                  readOnly: true,
                  controller: controller.saldo2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan3',
                  readOnly: true,
                  controller: controller.bulan3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl3',
                  readOnly: true,
                  controller: controller.tanggal3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok3',
                  readOnly: true,
                  controller: controller.angsuranPokok3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga3',
                  readOnly: true,
                  controller: controller.angsuranBunga3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jmlAngsuran3',
                  readOnly: true,
                  controller: controller.jmlAngsuran3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo3',
                  readOnly: true,
                  controller: controller.saldo3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan4',
                  readOnly: true,
                  controller: controller.bulan4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl4',
                  readOnly: true,
                  controller: controller.tanggal4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok4',
                  readOnly: true,
                  controller: controller.angsuranPokok4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga4',
                  readOnly: true,
                  controller: controller.angsuranBunga4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jmlAngsuran4',
                  controller: controller.jmlAngsuran4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo4',
                  readOnly: true,
                  controller: controller.saldo4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan5',
                  readOnly: true,
                  controller: controller.bulan5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl5',
                  readOnly: true,
                  controller: controller.tanggal5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok5',
                  readOnly: true,
                  controller: controller.angsuranPokok5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga5',
                  readOnly: true,
                  controller: controller.angsuranBunga5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jmlAngsuran5',
                  controller: controller.jmlAngsuran5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo5',
                  readOnly: true,
                  controller: controller.saldo5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(
                FormBuilderTextField(
                  name: 'bulan6',
                  readOnly: true,
                  controller: controller.bulan6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'tgl6',
                  readOnly: true,
                  controller: controller.tanggal6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranPokok6',
                  readOnly: true,
                  controller: controller.angsuranPokok6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'angsuranBunga6',
                  readOnly: true,
                  controller: controller.angsuranBunga6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'jmlAngsuran6',
                  controller: controller.jmlAngsuran6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'saldo6',
                  readOnly: true,
                  controller: controller.saldo6,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
          DataRow2(
            cells: [
              const DataCell(
                Text('1'),
              ),
              DataCell(
                FormBuilderTextField(
                  name: 'kas_on_hand',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Input disini',
                  ),
                ),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
              const DataCell(
                SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
