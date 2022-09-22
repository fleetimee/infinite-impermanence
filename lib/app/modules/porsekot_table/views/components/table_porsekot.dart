// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../controllers/porsekot_table_controller.dart';

class TabelPorsekot extends StatelessWidget {
  TabelPorsekot({super.key});

  final controller = Get.put(PorsekotTableController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: const Text('Porsekot Detail'), children: [
      SizedBox(
        height: 2500,
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
                DataCell(
                  FormBuilderTextField(
                    name: 'bulan7',
                    readOnly: true,
                    controller: controller.bulan7,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl7',
                    readOnly: true,
                    controller: controller.tanggal7,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok7',
                    readOnly: true,
                    controller: controller.angsuranPokok7,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga7',
                    readOnly: true,
                    controller: controller.angsuranBunga7,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran7',
                    controller: controller.jmlAngsuran7,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo7',
                    readOnly: true,
                    controller: controller.saldo7,
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
                    name: 'bulan8',
                    readOnly: true,
                    controller: controller.bulan8,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl8',
                    readOnly: true,
                    controller: controller.tanggal8,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok8',
                    readOnly: true,
                    controller: controller.angsuranPokok8,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga8',
                    readOnly: true,
                    controller: controller.angsuranBunga8,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran8',
                    controller: controller.jmlAngsuran8,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo8',
                    readOnly: true,
                    controller: controller.saldo8,
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
                    name: 'bulan9',
                    readOnly: true,
                    controller: controller.bulan9,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl9',
                    readOnly: true,
                    controller: controller.tanggal9,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok9',
                    readOnly: true,
                    controller: controller.angsuranPokok9,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga9',
                    readOnly: true,
                    controller: controller.angsuranBunga9,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran9',
                    controller: controller.jmlAngsuran9,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo9',
                    readOnly: true,
                    controller: controller.saldo9,
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
                    name: 'bulan10',
                    readOnly: true,
                    controller: controller.bulan10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl10',
                    readOnly: true,
                    controller: controller.tanggal10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok10',
                    readOnly: true,
                    controller: controller.angsuranPokok10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga10',
                    readOnly: true,
                    controller: controller.angsuranBunga10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran10',
                    controller: controller.jmlAngsuran10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo10',
                    readOnly: true,
                    controller: controller.saldo10,
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
                    name: 'bulan11',
                    readOnly: true,
                    controller: controller.bulan11,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl11',
                    readOnly: true,
                    controller: controller.tanggal11,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok11',
                    readOnly: true,
                    controller: controller.angsuranPokok11,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga11',
                    readOnly: true,
                    controller: controller.angsuranBunga11,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran11',
                    controller: controller.jmlAngsuran11,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo11',
                    readOnly: true,
                    controller: controller.saldo11,
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
                    name: 'bulan12',
                    readOnly: true,
                    controller: controller.bulan12,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl12',
                    readOnly: true,
                    controller: controller.tanggal12,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok12',
                    readOnly: true,
                    controller: controller.angsuranPokok12,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga12',
                    readOnly: true,
                    controller: controller.angsuranBunga12,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran12',
                    controller: controller.jmlAngsuran12,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo12',
                    readOnly: true,
                    controller: controller.saldo12,
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
                    name: 'bulan13',
                    readOnly: true,
                    controller: controller.bulan13,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl13',
                    readOnly: true,
                    controller: controller.tanggal13,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok13',
                    readOnly: true,
                    controller: controller.angsuranPokok13,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga13',
                    readOnly: true,
                    controller: controller.angsuranBunga13,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran13',
                    controller: controller.jmlAngsuran13,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo13',
                    readOnly: true,
                    controller: controller.saldo13,
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
                    name: 'bulan14',
                    readOnly: true,
                    controller: controller.bulan14,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl14',
                    readOnly: true,
                    controller: controller.tanggal14,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok14',
                    readOnly: true,
                    controller: controller.angsuranPokok14,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga14',
                    readOnly: true,
                    controller: controller.angsuranBunga14,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran14',
                    controller: controller.jmlAngsuran14,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo14',
                    readOnly: true,
                    controller: controller.saldo14,
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
                    name: 'bulan15',
                    readOnly: true,
                    controller: controller.bulan15,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl15',
                    readOnly: true,
                    controller: controller.tanggal15,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok15',
                    readOnly: true,
                    controller: controller.angsuranPokok15,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga15',
                    readOnly: true,
                    controller: controller.angsuranBunga15,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran15',
                    controller: controller.jmlAngsuran15,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo15',
                    readOnly: true,
                    controller: controller.saldo15,
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
                    name: 'bulan16',
                    readOnly: true,
                    controller: controller.bulan16,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl16',
                    readOnly: true,
                    controller: controller.tanggal16,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok16',
                    readOnly: true,
                    controller: controller.angsuranPokok16,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga16',
                    readOnly: true,
                    controller: controller.angsuranBunga16,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran16',
                    controller: controller.jmlAngsuran16,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo16',
                    readOnly: true,
                    controller: controller.saldo16,
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
                    name: 'bulan17',
                    readOnly: true,
                    controller: controller.bulan17,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl17',
                    readOnly: true,
                    controller: controller.tanggal17,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok17',
                    readOnly: true,
                    controller: controller.angsuranPokok17,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga17',
                    readOnly: true,
                    controller: controller.angsuranBunga17,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran17',
                    controller: controller.jmlAngsuran17,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo17',
                    readOnly: true,
                    controller: controller.saldo17,
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
                    name: 'bulan18',
                    readOnly: true,
                    controller: controller.bulan18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl18',
                    readOnly: true,
                    controller: controller.tanggal18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok18',
                    readOnly: true,
                    controller: controller.angsuranPokok18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga18',
                    readOnly: true,
                    controller: controller.angsuranBunga18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran18',
                    controller: controller.jmlAngsuran18,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo18',
                    readOnly: true,
                    controller: controller.saldo18,
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
                    name: 'bulan19',
                    readOnly: true,
                    controller: controller.bulan19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl19',
                    readOnly: true,
                    controller: controller.tanggal19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok19',
                    readOnly: true,
                    controller: controller.angsuranPokok19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga19',
                    readOnly: true,
                    controller: controller.angsuranBunga19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran19',
                    controller: controller.jmlAngsuran19,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo19',
                    readOnly: true,
                    controller: controller.saldo19,
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
                    name: 'bulan20',
                    readOnly: true,
                    controller: controller.bulan20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl20',
                    readOnly: true,
                    controller: controller.tanggal20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok20',
                    readOnly: true,
                    controller: controller.angsuranPokok20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga20',
                    readOnly: true,
                    controller: controller.angsuranBunga20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran20',
                    controller: controller.jmlAngsuran20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo20',
                    readOnly: true,
                    controller: controller.saldo20,
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
                    name: 'bulan21',
                    readOnly: true,
                    controller: controller.bulan21,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl21',
                    readOnly: true,
                    controller: controller.tanggal21,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok21',
                    readOnly: true,
                    controller: controller.angsuranPokok21,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga21',
                    readOnly: true,
                    controller: controller.angsuranBunga21,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran21',
                    controller: controller.jmlAngsuran21,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo21',
                    readOnly: true,
                    controller: controller.saldo21,
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
                    name: 'bulan22',
                    readOnly: true,
                    controller: controller.bulan22,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl22',
                    readOnly: true,
                    controller: controller.tanggal22,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok22',
                    readOnly: true,
                    controller: controller.angsuranPokok22,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga22',
                    readOnly: true,
                    controller: controller.angsuranBunga22,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran22',
                    controller: controller.jmlAngsuran22,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo22',
                    readOnly: true,
                    controller: controller.saldo22,
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
                    name: 'bulan23',
                    readOnly: true,
                    controller: controller.bulan23,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl23',
                    readOnly: true,
                    controller: controller.tanggal23,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok23',
                    readOnly: true,
                    controller: controller.angsuranPokok23,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga23',
                    readOnly: true,
                    controller: controller.angsuranBunga23,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran23',
                    controller: controller.jmlAngsuran23,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo23',
                    readOnly: true,
                    controller: controller.saldo23,
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
                    name: 'bulan24',
                    readOnly: true,
                    controller: controller.bulan24,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl24',
                    readOnly: true,
                    controller: controller.tanggal24,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok24',
                    readOnly: true,
                    controller: controller.angsuranPokok24,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga24',
                    readOnly: true,
                    controller: controller.angsuranBunga24,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran24',
                    controller: controller.jmlAngsuran24,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo24',
                    readOnly: true,
                    controller: controller.saldo24,
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
                    name: 'bulan25',
                    readOnly: true,
                    controller: controller.bulan25,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl25',
                    readOnly: true,
                    controller: controller.tanggal25,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok25',
                    readOnly: true,
                    controller: controller.angsuranPokok25,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga25',
                    readOnly: true,
                    controller: controller.angsuranBunga25,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran25',
                    controller: controller.jmlAngsuran25,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo25',
                    readOnly: true,
                    controller: controller.saldo25,
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
                    name: 'bulan26',
                    readOnly: true,
                    controller: controller.bulan26,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl26',
                    readOnly: true,
                    controller: controller.tanggal26,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok26',
                    readOnly: true,
                    controller: controller.angsuranPokok26,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga26',
                    readOnly: true,
                    controller: controller.angsuranBunga26,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran26',
                    controller: controller.jmlAngsuran26,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo26',
                    readOnly: true,
                    controller: controller.saldo26,
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
                    name: 'bulan27',
                    readOnly: true,
                    controller: controller.bulan27,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl27',
                    readOnly: true,
                    controller: controller.tanggal27,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok27',
                    readOnly: true,
                    controller: controller.angsuranPokok27,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga27',
                    readOnly: true,
                    controller: controller.angsuranBunga27,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran27',
                    controller: controller.jmlAngsuran27,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo27',
                    readOnly: true,
                    controller: controller.saldo27,
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
                    name: 'bulan28',
                    readOnly: true,
                    controller: controller.bulan28,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl28',
                    readOnly: true,
                    controller: controller.tanggal28,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok28',
                    readOnly: true,
                    controller: controller.angsuranPokok28,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga28',
                    readOnly: true,
                    controller: controller.angsuranBunga28,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran28',
                    controller: controller.jmlAngsuran28,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo28',
                    readOnly: true,
                    controller: controller.saldo28,
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
                    name: 'bulan29',
                    readOnly: true,
                    controller: controller.bulan29,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl29',
                    readOnly: true,
                    controller: controller.tanggal29,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok29',
                    readOnly: true,
                    controller: controller.angsuranPokok29,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga29',
                    readOnly: true,
                    controller: controller.angsuranBunga29,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran29',
                    controller: controller.jmlAngsuran29,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo29',
                    readOnly: true,
                    controller: controller.saldo29,
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
                    name: 'bulan30',
                    readOnly: true,
                    controller: controller.bulan30,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl30',
                    readOnly: true,
                    controller: controller.tanggal30,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok30',
                    readOnly: true,
                    controller: controller.angsuranPokok30,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga30',
                    readOnly: true,
                    controller: controller.angsuranBunga30,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran30',
                    controller: controller.jmlAngsuran30,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo30',
                    readOnly: true,
                    controller: controller.saldo30,
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
                    name: 'bulan31',
                    readOnly: true,
                    controller: controller.bulan31,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl31',
                    readOnly: true,
                    controller: controller.tanggal31,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok31',
                    readOnly: true,
                    controller: controller.angsuranPokok31,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga31',
                    readOnly: true,
                    controller: controller.angsuranBunga31,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran31',
                    controller: controller.jmlAngsuran31,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo31',
                    readOnly: true,
                    controller: controller.saldo31,
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
                    name: 'bulan32',
                    readOnly: true,
                    controller: controller.bulan32,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl32',
                    readOnly: true,
                    controller: controller.tanggal32,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok32',
                    readOnly: true,
                    controller: controller.angsuranPokok32,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga32',
                    readOnly: true,
                    controller: controller.angsuranBunga32,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran32',
                    controller: controller.jmlAngsuran32,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo32',
                    readOnly: true,
                    controller: controller.saldo32,
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
                    name: 'bulan33',
                    readOnly: true,
                    controller: controller.bulan33,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl33',
                    readOnly: true,
                    controller: controller.tanggal33,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok33',
                    readOnly: true,
                    controller: controller.angsuranPokok33,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga33',
                    readOnly: true,
                    controller: controller.angsuranBunga33,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran33',
                    controller: controller.jmlAngsuran33,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo33',
                    readOnly: true,
                    controller: controller.saldo33,
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
                    name: 'bulan34',
                    readOnly: true,
                    controller: controller.bulan34,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl34',
                    readOnly: true,
                    controller: controller.tanggal34,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok34',
                    readOnly: true,
                    controller: controller.angsuranPokok34,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga34',
                    readOnly: true,
                    controller: controller.angsuranBunga34,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran34',
                    controller: controller.jmlAngsuran34,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo34',
                    readOnly: true,
                    controller: controller.saldo34,
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
                    name: 'bulan35',
                    readOnly: true,
                    controller: controller.bulan35,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl35',
                    readOnly: true,
                    controller: controller.tanggal35,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok35',
                    readOnly: true,
                    controller: controller.angsuranPokok35,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga35',
                    readOnly: true,
                    controller: controller.angsuranBunga35,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran35',
                    controller: controller.jmlAngsuran35,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo35',
                    readOnly: true,
                    controller: controller.saldo35,
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
                    name: 'bulan36',
                    readOnly: true,
                    controller: controller.bulan36,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl36',
                    readOnly: true,
                    controller: controller.tanggal36,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok36',
                    readOnly: true,
                    controller: controller.angsuranPokok36,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga36',
                    readOnly: true,
                    controller: controller.angsuranBunga36,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran36',
                    controller: controller.jmlAngsuran36,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo36',
                    readOnly: true,
                    controller: controller.saldo36,
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
                    name: 'bulan37',
                    readOnly: true,
                    controller: controller.bulan37,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl37',
                    readOnly: true,
                    controller: controller.tanggal37,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok37',
                    readOnly: true,
                    controller: controller.angsuranPokok37,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga37',
                    readOnly: true,
                    controller: controller.angsuranBunga37,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran37',
                    controller: controller.jmlAngsuran37,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo37',
                    readOnly: true,
                    controller: controller.saldo37,
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
                    name: 'bulan38',
                    readOnly: true,
                    controller: controller.bulan38,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl38',
                    readOnly: true,
                    controller: controller.tanggal38,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok38',
                    readOnly: true,
                    controller: controller.angsuranPokok38,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga38',
                    readOnly: true,
                    controller: controller.angsuranBunga38,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran38',
                    controller: controller.jmlAngsuran38,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo38',
                    readOnly: true,
                    controller: controller.saldo38,
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
                    name: 'bulan39',
                    readOnly: true,
                    controller: controller.bulan39,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl39',
                    readOnly: true,
                    controller: controller.tanggal39,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok39',
                    readOnly: true,
                    controller: controller.angsuranPokok39,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga39',
                    readOnly: true,
                    controller: controller.angsuranBunga39,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran39',
                    controller: controller.jmlAngsuran39,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo39',
                    readOnly: true,
                    controller: controller.saldo39,
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
                    name: 'bulan40',
                    readOnly: true,
                    controller: controller.bulan40,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl40',
                    readOnly: true,
                    controller: controller.tanggal40,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok40',
                    readOnly: true,
                    controller: controller.angsuranPokok40,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga40',
                    readOnly: true,
                    controller: controller.angsuranBunga40,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran40',
                    controller: controller.jmlAngsuran40,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo40',
                    readOnly: true,
                    controller: controller.saldo40,
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
                    name: 'bulan41',
                    readOnly: true,
                    controller: controller.bulan41,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl41',
                    readOnly: true,
                    controller: controller.tanggal41,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok41',
                    readOnly: true,
                    controller: controller.angsuranPokok41,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga41',
                    readOnly: true,
                    controller: controller.angsuranBunga41,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran41',
                    controller: controller.jmlAngsuran41,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo41',
                    readOnly: true,
                    controller: controller.saldo41,
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
                    name: 'bulan42',
                    readOnly: true,
                    controller: controller.bulan42,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl42',
                    readOnly: true,
                    controller: controller.tanggal42,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok42',
                    readOnly: true,
                    controller: controller.angsuranPokok42,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga42',
                    readOnly: true,
                    controller: controller.angsuranBunga42,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran42',
                    controller: controller.jmlAngsuran42,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo42',
                    readOnly: true,
                    controller: controller.saldo42,
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
                    name: 'bulan43',
                    readOnly: true,
                    controller: controller.bulan43,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl43',
                    readOnly: true,
                    controller: controller.tanggal43,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok43',
                    readOnly: true,
                    controller: controller.angsuranPokok43,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga43',
                    readOnly: true,
                    controller: controller.angsuranBunga43,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran43',
                    controller: controller.jmlAngsuran43,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo43',
                    readOnly: true,
                    controller: controller.saldo43,
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
                    name: 'bulan44',
                    readOnly: true,
                    controller: controller.bulan44,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl44',
                    readOnly: true,
                    controller: controller.tanggal44,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok44',
                    readOnly: true,
                    controller: controller.angsuranPokok44,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga44',
                    readOnly: true,
                    controller: controller.angsuranBunga44,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran44',
                    controller: controller.jmlAngsuran44,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo44',
                    readOnly: true,
                    controller: controller.saldo44,
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
                    name: 'bulan45',
                    readOnly: true,
                    controller: controller.bulan45,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl45',
                    readOnly: true,
                    controller: controller.tanggal45,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok45',
                    readOnly: true,
                    controller: controller.angsuranPokok45,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga45',
                    readOnly: true,
                    controller: controller.angsuranBunga45,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran45',
                    controller: controller.jmlAngsuran45,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo45',
                    readOnly: true,
                    controller: controller.saldo45,
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
                    name: 'bulan46',
                    readOnly: true,
                    controller: controller.bulan46,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl46',
                    readOnly: true,
                    controller: controller.tanggal46,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok46',
                    readOnly: true,
                    controller: controller.angsuranPokok46,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga46',
                    readOnly: true,
                    controller: controller.angsuranBunga46,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran46',
                    controller: controller.jmlAngsuran46,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo46',
                    readOnly: true,
                    controller: controller.saldo46,
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
                    name: 'bulan47',
                    readOnly: true,
                    controller: controller.bulan47,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl47',
                    readOnly: true,
                    controller: controller.tanggal47,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok47',
                    readOnly: true,
                    controller: controller.angsuranPokok47,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga47',
                    readOnly: true,
                    controller: controller.angsuranBunga47,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran47',
                    controller: controller.jmlAngsuran47,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo47',
                    readOnly: true,
                    controller: controller.saldo47,
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
                    name: 'bulan48',
                    readOnly: true,
                    controller: controller.bulan48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'tgl48',
                    readOnly: true,
                    controller: controller.tanggal48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranPokok48',
                    readOnly: true,
                    controller: controller.angsuranPokok48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'angsuranBunga48',
                    readOnly: true,
                    controller: controller.angsuranBunga48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'jmlAngsuran48',
                    controller: controller.jmlAngsuran48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'saldo48',
                    readOnly: true,
                    controller: controller.saldo48,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
              ],
            ),
            const DataRow2(
              cells: [
                DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  SizedBox.shrink(),
                ),
              ],
            ),
            DataRow2(
              cells: [
                const DataCell(
                  SizedBox.shrink(),
                ),
                const DataCell(
                  SizedBox.shrink(),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'totalAngsuranPokok',
                    readOnly: true,
                    controller: controller.sumAngsuranPokok,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'totalAngsuranBunga',
                    readOnly: true,
                    controller: controller.sumAngsuranBunga,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                DataCell(
                  FormBuilderTextField(
                    name: 'totalJmlAngsuran',
                    readOnly: true,
                    controller: controller.sumAngsuranTotal,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(),
                  ),
                ),
                const DataCell(
                  SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
