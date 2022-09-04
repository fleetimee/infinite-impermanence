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
              const DataCell(
                Text('1'),
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
              const DataCell(
                SizedBox.shrink(),
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
                Text('2'),
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
