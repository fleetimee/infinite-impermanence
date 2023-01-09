// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/input_neraca_controller.dart';

class LihatneracaView extends GetView<InputNeracaController> {
  LihatneracaView({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Keterangan Neraca'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       deleteNeraca(context);
        //     },
        //     icon: const FaIcon(
        //       FontAwesomeIcons.solidTrashCan,
        //     ),
        //   ),
        // ],
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      title: 'Konfirmasi',
                      bodyHeaderDistance: 25,
                      desc: 'Apakah yakin untuk menghapus item ini ?',
                      btnOkOnPress: () {
                        controller.deleteNeraca(data.inputNeraca.id);
                        // controller.purgeProgressBar(data.id);
                        Get.back();
                      },
                      btnOkText: 'Oke sip',
                      btnCancelText: 'Affa iyh',
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidTrashCan,
            ),
          )
        ],
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
                        enabled: false,

                        initialValue: data.inputNeraca.tanggalInput,
                        // onChanged: (value) {
                        //   controller.tanggalInput.value = value!;
                        //   debugPrint(value.toString());
                        // },
                        // onSaved: (value) {
                        //   controller.tanggalInput.value = value!;
                        //   debugPrint(value.toString());
                        // },
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
                            enabled: false,
                            controller: controller.cashOnHand =
                                MoneyMaskedTextController(
                              initialValue:
                                  double.parse(data.inputNeraca.kasOnHand),
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
                          const DataCell(Text('Tabungan')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'tabungan',
                              enabled: false,
                              decoration: const InputDecoration(
                                hintText: 'Input disini',
                                prefixText: 'Rp. ',
                              ),
                              controller: controller.tabungan =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.inputNeraca.tabungan),
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
                                enabled: false,
                                controller: controller.jumlahKasDanBank =
                                    MoneyMaskedTextController(
                                  initialValue: double.parse(
                                      data.inputNeraca.jumlahKasDanTabungan),
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Hasil Disini',
                                  prefixText: 'Rp. ',
                                )),
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
                              initialValue:
                                  double.parse(data.inputNeraca.jumlahPiutang),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            enabled: false,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                              prefixText: 'Rp. ',
                            ),
                          ),
                        ),
                      ]),
                      DataRow2(cells: [
                        const DataCell(Text('Jumlah')),
                        DataCell(
                          FormBuilderTextField(
                            name: 'jumlah_piutang',
                            enabled: false,
                            controller: controller.piutangLainnya =
                                MoneyMaskedTextController(
                              initialValue:
                                  double.parse(data.inputNeraca.jumlahPiutang),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Hasil disini',
                              prefixText: 'Rp. ',
                            ),
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
                      'Perkiraan ini menunjukkan jumlah persediaan bahan baku, barang dagangan yang berhubungan usaha,  sebagai berikut :',
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
                              initialValue: double.parse(
                                  data.inputNeraca.jumlahPersediaan),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            enabled: false,
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
                            decoration: const InputDecoration(
                              hintText: 'Input disini',
                              prefixText: 'Rp. ',
                            ),
                            controller: controller.hutangUsaha =
                                MoneyMaskedTextController(
                              initialValue:
                                  double.parse(data.inputNeraca.hutangUsaha),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            enabled: false,
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
                              initialValue:
                                  double.parse(data.inputNeraca.hutangBank),
                              thousandSeparator: '.',
                              decimalSeparator: '',
                              precision: 0,
                            ),
                            enabled: false,
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
                              enabled: false,
                              controller: controller.peralatan =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.inputNeraca.peralatan),
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
                              enabled: false,
                              controller: controller.kendaraan =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.inputNeraca.kendaraan),
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
                              enabled: false,
                              controller: controller.tanahDanBangunan =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(
                                    data.inputNeraca.tanahDanBangunan),
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
                              enabled: false,
                              controller: controller.aktivaTetap =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.inputNeraca.aktivaTetap),
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
                  height: 35.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pinjaman Lain (Bank / Non Bank)', style: heading1),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Perkiraan ini tidak dimasukkan kedalam neraca, tetapi akan menjadi parameter perhitungan pada Analisa Keungan nanti (Isi 0 jika tidak ada)',
                      style: heading2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
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
                          const DataCell(
                              Text('Total Pinjaman Lain (Bank / Non Bank)')),
                          DataCell(
                            FormBuilderTextField(
                              name: 'total_pinjaman_lain',
                              enabled: false,
                              controller: controller.pinjamanLain =
                                  MoneyMaskedTextController(
                                initialValue:
                                    double.parse(data.inputNeraca.pinjamanLain),
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
                              enabled: false,
                              validator: FormBuilderValidators.required(),
                              controller: controller.angsuranPinjamanLain =
                                  MoneyMaskedTextController(
                                initialValue: double.parse(
                                    data.inputNeraca.angsuranPinjamanLain),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
