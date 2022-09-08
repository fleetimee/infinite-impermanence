// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/rugi_laba/views/components/perkiraan_neraca.dart';
import 'package:akm/app/modules/rugi_laba/views/components/perkiraan_rugi_laba.dart';
import '../controllers/rugi_laba_controller.dart';

class RugiLabaView extends GetView<RugiLabaController> {
  RugiLabaView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.result();
        },
        child: const Icon(Icons.calculate),
      ),
      appBar: AppBar(
        title: const Text('Rugi / Laba'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            // onChanged: () {
            //   debugPrint(controller.formKey.currentState!.value.toString());
            // },

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
                      children: [
                        const Expanded(
                          child: Text(
                            'Nama',
                            style: subtitle2,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data.peminjam1,
                            style: subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          child: Text(
                            'Alamat',
                            style: subtitle2,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data.alamat1,
                            style: subtitle2,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          child: Text(
                            'No SKPK',
                            style: subtitle2,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            ':',
                            style: subtitle2,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            data.noSkpk ?? 'Tidak Ada',
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
                    'Per tanggal : ${DateFormat('dd MMMM yyyy').format(data.inputNeraca.tanggalInput)}',
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
                PerkiraanNeracaTabel(),
                const SizedBox(height: 25),
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
                PerkiraanLabaRugi(),
                const SizedBox(
                  height: 25.0,
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
                  height: 200,
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 6,
                    minWidth: 350,
                    columns: const [
                      DataColumn2(label: SizedBox.shrink(), size: ColumnSize.S),
                      DataColumn2(label: SizedBox.shrink(), size: ColumnSize.S),
                    ],
                    rows: [
                      DataRow2(
                        cells: [
                          const DataCell(
                              Text('Penghasilan rata rata per bulan :')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'penghasilan',
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              controller: controller.labaSetelahPajak,
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(
                              Text('Biaya hidup rata rata perbulan :')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'biaya_hidup',
                              keyboardType: TextInputType.number,
                              controller: controller.biayaHidupRataRata,
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(
                            Text(
                              'Sisa penghasilan bersih per bulan :',
                            ),
                          ),
                          DataCell(
                            FormBuilderTextField(
                              name: 'sisa_penghasilan',
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              controller: controller.sisaPenghasilanBersih,
                              decoration: InputDecoration(
                                suffixIcon: ElevatedButton.icon(
                                  icon: const Icon(FontAwesomeIcons.calculator),
                                  label: const Text("Hit"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    controller.sumSisaPenghasilan();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Tanggal',
                      style: subtitle2,
                    )),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: FormBuilderDateTimePicker(
                        resetIcon: null,
                        onChanged: (value) {
                          // controller.tglMulaiKredit.value =
                          //     DateFormat('yyyy MM dd').format(value!);
                        },
                        onFieldSubmitted: (value) {
                          // controller.tglMulaiKredit.value =
                          //     DateFormat('dd MM yyyy').format(value!);
                          // debugPrint(value.toString());
                        },
                        onSaved: (value) {
                          // controller.tglMulaiKredit.value =
                          //     DateFormat('dd MM yyyy').format(value!);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Pilih Tanggal',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        inputType: InputType.date,
                        format: DateFormat('dd/MMMM/yyyy'),
                        validator: FormBuilderValidators.required(),
                        name: 'Tanggal',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
