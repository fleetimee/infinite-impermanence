import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/input_neraca/controllers/input_neraca_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditNeracaView extends GetView<InputNeracaController> {
  EditNeracaView({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Neraca'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            autovalidateMode: AutovalidateMode.disabled,
            key: controller.formKey,
            onChanged: () {
              controller.formKey.currentState!.save();
              debugPrint(controller.formKey.currentState!.value.toString());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'Penjelasan Pos Neraca :',
                      style: title,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Penjelasan mengenai pos neraca adalah menunjukkan besarnya pos neraca posisi :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        initialValue: data.tanggalInput,
                        onChanged: (value) {
                          controller.tanggalInput.value = value!;
                          debugPrint(value.toString());
                        },
                        onSaved: (value) {
                          controller.tanggalInput.value = value!;
                          debugPrint(value.toString());
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal Penginputan',
                          labelStyle: subtitle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        validator: FormBuilderValidators.required(),
                        name: 'Tanggal',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kas dan Bank', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah kas dan saldo simpanan di bank, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // ! Kas dan Bank Table
                SizedBox(
                  height: 285,
                  child: DataTable2(
                    dividerThickness: 1,
                    sortAscending: true,
                    border: TableBorder.all(color: Colors.black),
                    bottomMargin: 5,
                    sortColumnIndex: 0,
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(cells: [
                        const DataCell(Text('Kas On Hand')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'kas_on_hand',
                            controller: controller.cashOnHand =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.kasOnHand),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                            ),
                          ),
                        ),
                      ]),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Tabungan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'tabungan',
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                              ),
                              controller: controller.tabungan =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(data.tabungan),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Jumlah')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'jumlah_kas_bank',
                              controller: controller.jumlahKasDanBank =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.jumlahKasDanTabungan),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Piutang', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah piutang, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // // ! Piutang Table
                SizedBox(
                  height: 185,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(cells: [
                        const DataCell(Text('Piutang')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'piutang',
                            controller: controller.piutangLainnya =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.jumlahPiutang),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                            ),
                          ),
                        ),
                      ]),
                      DataRow2(cells: [
                        const DataCell(Text('Jumlah')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'jumlah_piutang',
                            controller: controller.piutangLainnya =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.jumlahPiutang),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Hasil disini'),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Persediaan', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah persediaan bahan baku yang berhubungan usaha,  sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Persediaan Table
                SizedBox(
                  height: 150,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(cells: [
                        const DataCell(Text('Jumlah')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'jumlah_persediaan',
                            controller: controller.persediaan =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.jumlahPersediaan),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hutang Usaha', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah aktiva tetap, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Hutang Usaha Table
                SizedBox(
                  height: 150,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(cells: [
                        const DataCell(Text('Jumlah')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'jumlah_hutang_usaha',
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                            ),
                            controller: controller.hutangUsaha =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.hutangUsaha),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hutang Bank', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah hutang bank, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Hutang Bank Table
                SizedBox(
                  height: 150,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(cells: [
                        const DataCell(Text('Jumlah')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'hutang_bank',
                            controller: controller.hutangBank =
                                MoneyMaskedTextController(
                              initialValue: double.parse(data.hutangBank),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aktiva Tetap', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini menunjukkan jumlah nilai buku aktiva yang dimiliki, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Aktiva Tetap Table
                SizedBox(
                  height: 150,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(
                        cells: [
                          const DataCell(Text('Jumlah')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'aktiva_tetap',
                              controller: controller.aktivaTetap =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(data.aktivaTetap),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
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
                const SizedBox(
                  height: 8.0,
                ),
                OutlinedButton.icon(
                  icon: const Icon(FontAwesomeIcons.pencil),
                  label: const Text(
                    "Update",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: secondaryColor,
                      backgroundColor: primaryColor,
                      shape: const StadiumBorder(),
                      maximumSize: const Size.fromWidth(double.infinity),
                      fixedSize: const Size(500, 50)),
                  onPressed: () {
                    if (controller.formKey.currentState?.saveAndValidate() ??
                        false) {
                      debugPrint(
                          controller.formKey.currentState?.value.toString());
                      // controller.updateNeraca();
                      controller.updateNeraca(data.id.toString());
                    } else {
                      debugPrint(
                          controller.formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
