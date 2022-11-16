// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/input_neraca_controller.dart';

class InputNeracaView extends GetView<InputNeracaController> {
  InputNeracaView({Key? key}) : super(key: key);

  // initialize textStyle for textField

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keterangan Neraca'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            autoFocusOnValidationFailure: true,
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
                      child: Visibility(
                        visible: true,
                        child: FormBuilderTextField(
                          name: 'debitur_id',
                          readOnly: true,
                          controller: controller.debitur =
                              TextEditingController(
                            text: data.id.toString(),
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.person),
                            labelText: 'Debitur ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: FormBuilderDateTimePicker(
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
                          labelText: 'Pilih Tanggal',
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
                            validator: FormBuilderValidators.required(),
                            controller: controller.cashOnHand,
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
                              controller: controller.tabungan,
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
                              controller: controller.jumlahKasDanBank,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Hasil disini',
                                prefixText: 'Rp. ',
                              ),
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
                    const Text(
                      'Perkiraan ini menunjukkan jumlah piutang, sebagai berikut :',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // ! Piutang Table
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
                            validator: FormBuilderValidators.required(),
                            name: 'piutang',
                            controller: controller.piutangLainnya,
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
                              validator: FormBuilderValidators.required(),
                              name: 'jumlah_piutang',
                              enabled: false,
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
                            validator: FormBuilderValidators.required(),
                            controller: controller.persediaan,
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
                            validator: FormBuilderValidators.required(),
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                              prefixText: 'Rp. ',
                            ),
                            controller: controller.hutangUsaha,
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
                            validator: FormBuilderValidators.required(),
                            controller: controller.hutangBank,
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
                              controller: controller.peralatan,
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
                          const DataCell(Text('Kendaraan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'kendaraan',
                              validator: FormBuilderValidators.required(),
                              controller: controller.kendaraan,
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
                              controller: controller.tanahDanBangunan,
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
                              readOnly: true,
                              controller: controller.aktivaTetap,
                              validator: FormBuilderValidators.required(),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Hasil disini',
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
                            // OutlinedButton.icon(
                            //   icon: const Icon(Icons.calculate),
                            //   label: const Text(
                            //     "Hitung",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w500, fontSize: 20),
                            //   ),
                            //   style: OutlinedButton.styleFrom(
                            //       foregroundColor: secondaryColor,
                            //       backgroundColor: primaryColor,
                            //       shape: const StadiumBorder(),
                            //       maximumSize:
                            //           const Size.fromWidth(double.infinity),
                            //       fixedSize: const Size(500, 5)),
                            //   onPressed: () {
                            //     controller.hitungAktivaTetap();
                            //   },
                            // ),
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
                      controller.saveNeraca();
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
                  text: 'Simpan',
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
