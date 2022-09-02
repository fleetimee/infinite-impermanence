import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/porsekot_table_controller.dart';

class PorsekotTableView extends GetView<PorsekotTableController> {
  const PorsekotTableView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PorsekotTableView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FormBuilder(
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'metode_bunga',
                  decoration: const InputDecoration(),
                )
              ],
            ),
          ),
          Expanded(
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text('No'),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Text('Tanggal'),
                  size: ColumnSize.M,
                  
                ),
                DataColumn(
                  label: Text('Column C'),
                ),
                DataColumn(
                  label: Text('Column D'),
                ),
                DataColumn(
                  label: Text('Column NUMBERS'),
                  numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                20,
                (index) => DataRow(
                  cells: [
                    // Iterate date from 1/1/2020 to 1/1/2021
                    DataCell(
                      // Iterate from 1 to 10
                      Text(
                        '${index + 1}',
                      ),
                    ),
                    DataCell(
                      Text(
                        DateFormat('dd/MM/yyyy').format(
                          DateTime.now().add(
                            Duration(days: index),
                          ),
                        ),
                      ),
                    ),

                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(
                      Text(((index + 0.1) * 25.4).toString()),
                    ),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
