// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/input_neraca_controller.dart';

class EditNeracaView extends GetView<InputNeracaController> {
  EditNeracaView({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Keterangan Neraca'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Penjelasan Pos Neraca :',
                      style: title,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Penjelasan mengenai pos neraca adalah menunjukkan besarnya pos neraca posisi :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                    Text(
                      'Perkiraan ini menunjukkan jumlah kas dan saldo simpanan di bank (isi 0 jika tidak ada), sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                            validator: FormBuilderValidators.required(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                              prefixText: 'Rp. ',
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
                              validator: FormBuilderValidators.required(),
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
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
                              validator: FormBuilderValidators.required(),
                              enabled: false,
                              decoration: const InputDecoration(
                                hintText: 'Hasil disini',
                                prefixText: 'Rp. ',
                              ),
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
                      DataRow2(
                        cells: [
                          const DataCell(Text('')),
                          DataCell(
                            GFButton(
                              onPressed: () {
                                controller.hitungKasDanBank();
                              },
                              text: 'Hitung',
                              fullWidthButton: true,
                              type: GFButtonType.solid,
                              size: GFSize.LARGE,
                              color: primaryColor,
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
                    Text(
                      'Perkiraan ini menunjukkan jumlah piutang (isi 0 jika tidak ada), sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                            validator: FormBuilderValidators.required(),
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
                              prefixText: 'Rp. ',
                            ),
                          ),
                        ),
                      ]),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Jumlah')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'jumlah_piutang',
                              validator: FormBuilderValidators.required(),
                              controller: controller.piutangLainnya,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Hasil disini',
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    Text(
                      'Perkiraan ini menunjukkan jumlah persediaan bahan baku, barang dagangan yang berhubungan usaha (isi 0 jika tidak ada),  sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                            validator: FormBuilderValidators.required(),
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
                              prefixText: 'Rp. ',
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
                    Text(
                      'Perkiraan ini menunjukkan jumlah hutang usaha, sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                            validator: FormBuilderValidators.required(),
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                              prefixText: 'Rp. ',
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
                    Text('Hutang Bank Lain (Bank / Non Bank)', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Perkiraan ini menunjukkan jumlah hutang bank lain (bisa bank atau platform pinjaman online seperti SPinjam, SPaylater dan sejenisnya (isi 0 di kedua field jika tidak ada), sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Pinjaman Lain Table
                SizedBox(
                  height: 180,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(
                        cells: [
                          const DataCell(
                              Text('Total Pinjaman Lain (Bank / Non Bank)')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'total_pinjaman_lain',
                              controller: controller.pinjamanLain =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(data.pinjamanLain),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              validator: FormBuilderValidators.required(),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Angsuran per Bulan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'angsuranPinjamanLain',
                              validator: FormBuilderValidators.required(),
                              controller: controller.angsuranPinjamanLain =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.angsuranPinjamanLain),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hutang Lainnya', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Perkiraan ini menunjukkan jumlah hutang lainnya (isi 0 jika tidak ada), sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
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
                            validator: FormBuilderValidators.required(),
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
                              prefixText: 'Rp. ',
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
                    Text(
                      'Perkiraan ini menunjukkan jumlah nilai buku aktiva yang dimiliki (isi 0 jika tidak ada), sebagai berikut :',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.merge(const TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // ! Aktiva Tetap Table
                SizedBox(
                  height: 300,
                  child: DataTable2(
                    border: TableBorder.all(color: Colors.black),
                    columns: const [
                      DataColumn2(label: Text('Keterangan')),
                      DataColumn2(label: Text('Nilai (Rp)')),
                    ],
                    rows: [
                      DataRow2(
                        cells: [
                          const DataCell(Text('Peralatan / Mesin')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'peralatan_mesin',
                              validator: FormBuilderValidators.required(),
                              controller: controller.peralatan =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(data.peralatan),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Kendaraan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'kendaraan',
                              validator: FormBuilderValidators.required(),
                              controller: controller.kendaraan =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(data.kendaraan),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Tanah dan Bangunan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'tanah_bangunan',
                              validator: FormBuilderValidators.required(),
                              controller: controller.tanahDanBangunan =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.tanahDanBangunan),
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(Text('Jumlah')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'aktiva_tetap',
                              validator: FormBuilderValidators.required(),
                              enabled: false,
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
                                prefixText: 'Rp. ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow2(
                        cells: [
                          const DataCell(SizedBox.shrink()),
                          DataCell(
                            GFButton(
                              onPressed: () {
                                controller.hitungAktivaTetap();
                              },
                              text: 'Hitung',
                              type: GFButtonType.solid,
                              size: GFSize.LARGE,
                              color: primaryColor,
                              fullWidthButton: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),

                GFButton(
                  onPressed: () {
                    if (controller.formKey.currentState?.saveAndValidate() ??
                        false) {
                      controller.updateNeraca(data.id.toString());
                      Get.back();
                    } else {
                      GFToast.showToast(
                        'Mohon isi semua form',
                        context,
                        backgroundColor: Colors.red,
                        toastPosition: GFToastPosition.TOP,
                        trailing: const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        toastDuration: 3,
                      );
                    }
                  },
                  text: 'Update',
                  type: GFButtonType.solid,
                  size: GFSize.LARGE,
                  color: primaryColor,
                  fullWidthButton: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
