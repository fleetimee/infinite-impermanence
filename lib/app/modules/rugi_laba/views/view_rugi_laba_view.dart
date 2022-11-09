// 🎯 Dart imports:
import 'dart:developer';

// 🐦 Flutter imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/rugi_laba/views/components/view_mode/perkiraan_neraca_view.dart';
import 'package:akm/app/modules/rugi_laba/views/components/view_mode/perkiraan_rugi_laba_view.dart';
import '../../../common/style.dart';
import '../controllers/rugi_laba_controller.dart';

// 🌎 Project imports:

class LihatRugiLabaView extends GetView<RugiLabaController> {
  LihatRugiLabaView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Rugi / Laba'),
        centerTitle: true,
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
                        controller.deleteRugiLaba(data.inputRugiLaba.id);
                        controller.purgeProgressBar(data.id);
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
            onChanged: () {
              controller.formKey.currentState!.save();
              // debugPrint(controller.formKey.currentState!.value.toString());
              log(controller.formKey.currentState!.value.toString());
            },
            key: controller.formKey,
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
                PerkiraanNeracaTabelView(),
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
                    'Periode bulan : ${DateFormat('MMMM yyyy').format(data.inputNeraca.tanggalInput)}',
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
                PerkiraanLabaRugiView(),
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
                                controller: controller.labaSetelahPajak =
                                    MoneyMaskedTextController(
                                  decimalSeparator: '',
                                  thousandSeparator: '.',
                                  initialValue: double.parse(
                                      data.inputRugiLaba.labaSetelahPajak),
                                  precision: 0,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Input disini',
                                  prefix: Text('Rp. '),
                                )),
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
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: controller.biayaHidupRataRata =
                                    MoneyMaskedTextController(
                                  decimalSeparator: '',
                                  thousandSeparator: '.',
                                  initialValue: double.parse(
                                      data.inputRugiLaba.biayaHidup),
                                  precision: 0,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Input disini',
                                  prefix: Text('Rp. '),
                                )),
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
                                controller: controller.sisaPenghasilanBersih =
                                    MoneyMaskedTextController(
                                  decimalSeparator: '',
                                  thousandSeparator: '.',
                                  initialValue: double.parse(
                                      data.inputRugiLaba.sisaPenghasilan),
                                  precision: 0,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Input disini',
                                  prefix: Text('Rp. '),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
