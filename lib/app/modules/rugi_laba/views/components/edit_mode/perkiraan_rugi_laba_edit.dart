// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import '../../../../../common/style.dart';
import '../../../controllers/rugi_laba_controller.dart';

class EditPerkiraanLabaRugiView extends StatelessWidget {
  EditPerkiraanLabaRugiView({super.key});

  final controller = Get.put(RugiLabaController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Perkiraan Laba / Rugi'),
      children: [
        SizedBox(
          height: 700,
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 800,
            columns: const [
              DataColumn2(
                label: Text(
                  'Perkiraan penjualan :',
                  style: subtitle2,
                ),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
            ],
            rows: [
              DataRow2(
                cells: [
                  const DataCell(Text('Omzet penjualan rata - rata :')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'omzet_penjualan_rata_rata',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                      controller: controller.omzetPerBulan =
                          MoneyMaskedTextController(
                        initialValue: double.parse(data.inputRugiLaba.omzet),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
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
                  const DataCell(Text('Persen harga pokok penjualan :')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      textAlign: TextAlign.right,
                      name: 'persen_hpp',
                      controller: controller.persentaseHpp,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                        suffixText: '%',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('Harga pokok penjualan')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'harga_pokok_penjualan',
                      readOnly: true,
                      validator: FormBuilderValidators.required(),
                      controller: controller.hargaPokokPenjualan =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.hargaPokok),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
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
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba Kotor')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_kotor',
                      readOnly: true,
                      controller: controller.labaKotor =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.labaKotor),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    GFButton(
                        onPressed: () {
                          GFToast.showToast(
                            'Laba Kotor Berhasil Dihitung',
                            context,
                            toastPosition: GFToastPosition.TOP,
                            textStyle: const TextStyle(
                                fontSize: 16, color: GFColors.WHITE),
                            backgroundColor: GFColors.DARK,
                          );
                          controller.hitungHpp();
                          controller.sumLabaKotor();
                        },
                        color: primaryColor,
                        fullWidthButton: true,
                        text: 'Hitung'),
                  ),
                ],
              ),
              const DataRow2(
                cells: [
                  DataCell(Text('Biaya :')),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('1. Biaya Tenaga Kerja')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_tenaga_kerja',
                      validator: FormBuilderValidators.required(),
                      keyboardType: TextInputType.number,
                      controller: controller.biayaTenagaKerja =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.biayaTenagaKerja),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Biaya Operasional')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_operasional',
                      keyboardType: TextInputType.number,
                      controller: controller.biayaOperasional =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.biayaOperasional),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Biaya Lainnya')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_lainnya',
                      keyboardType: TextInputType.number,
                      controller: controller.biayaLainnya =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.biayaLainnya),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                  DataCell(
                    GFButton(
                        onPressed: () {
                          GFToast.showToast(
                            'Perkiraan Laba Berhasil Dihitung',
                            context,
                            toastPosition: GFToastPosition.TOP,
                            textStyle: const TextStyle(
                                fontSize: 16, color: GFColors.WHITE),
                            backgroundColor: GFColors.DARK,
                          );
                          controller.perkiraanLaba();
                        },
                        color: primaryColor,
                        fullWidthButton: true,
                        text: 'Hitung'),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Total Biaya')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'total_biaya',
                      readOnly: true,
                      controller: controller.totalBiaya =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.totalBiaya),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba sebelum pajak (EBIT)')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_sebelum_pajak',
                      readOnly: true,
                      controller: controller.labaSebelumPajak =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.labaSebelumPajak),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Perkiraan Pajak')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'perkiraan_pajak',
                      readOnly: true,
                      controller: controller.perkiraanPajak =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.perkiraanPajak),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba setelah pajak')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_setelah_pajak',
                      readOnly: true,
                      controller: controller.labaSetelahPajak =
                          MoneyMaskedTextController(
                        initialValue:
                            double.parse(data.inputRugiLaba.labaSetelahPajak),
                        decimalSeparator: '',
                        thousandSeparator: '.',
                        precision: 0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
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
    );
  }
}
