// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';

// 🌎 Project imports:

class PerkiraanLabaRugi extends StatelessWidget {
  PerkiraanLabaRugi({super.key});

  final controller = Get.put(RugiLabaController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Perkiraan Laba / Rugi'),
      children: [
        SizedBox(
          height: 690,
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
                      controller: controller.omzetPerBulan,
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
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
                      name: 'persen_hpp',
                      textAlign: TextAlign.right,
                      controller: controller.persentaseHpp,
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.max(100,
                              errorText: 'Maksimal 100%'),
                        ],
                      ),
                      decoration: const InputDecoration(
                        suffix: Text('%'),
                        hintText: 'Input disini',
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
                      enabled: false,
                      name: 'harga_pokok_penjualan',
                      controller: controller.hargaPokokPenjualan,
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
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba Kotor')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_kotor',
                      readOnly: true,
                      controller: controller.labaKotor,
                      validator: FormBuilderValidators.required(),
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
                        if (controller
                                    .formKey
                                    .currentState
                                    ?.fields['omzet_penjualan_rata_rata']
                                    ?.value !=
                                '' &&
                            controller.formKey.currentState
                                    ?.fields['persen_hpp']?.value !=
                                '') {
                          controller.hitungHpp();
                          controller.sumLabaKotor();
                          GFToast.showToast(
                            'Laba Kotor Berhasil Dihitung',
                            context,
                            toastPosition: GFToastPosition.TOP,
                            textStyle: const TextStyle(
                                fontSize: 16, color: GFColors.WHITE),
                            backgroundColor: GFColors.DARK,
                          );
                        } else {
                          Get.snackbar(
                            'Peringatan',
                            'Mohon isi semua field',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: GFColors.DANGER,
                            colorText: GFColors.WHITE,
                          );
                        }
                      },
                      color: primaryColor,
                      fullWidthButton: true,
                      text: 'Hitung',
                    ),
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
                      controller: controller.biayaTenagaKerja,
                      validator: FormBuilderValidators.required(),
                      keyboardType: TextInputType.number,
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
                      controller: controller.biayaOperasional,
                      validator: FormBuilderValidators.required(),
                      keyboardType: TextInputType.number,
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
                      controller: controller.biayaLainnya,
                      validator: FormBuilderValidators.required(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                        prefixText: 'Rp. ',
                      ),
                    ),
                  ),
                  DataCell(
                    GFButton(
                        onPressed: () {
                          if (controller.formKey.currentState
                                      ?.fields['biaya_tenaga_kerja']?.value !=
                                  '' &&
                              controller.formKey.currentState
                                      ?.fields['biaya_operasional']?.value !=
                                  '' &&
                              controller.formKey.currentState
                                      ?.fields['biaya_lainnya']?.value !=
                                  '') {
                            GFToast.showToast(
                              'Perkiraan Laba Berhasil Dihitung',
                              context,
                              toastPosition: GFToastPosition.TOP,
                              textStyle: const TextStyle(
                                  fontSize: 16, color: GFColors.WHITE),
                              backgroundColor: GFColors.DARK,
                            );
                            controller.perkiraanLaba();
                          } else {
                            Get.snackbar(
                              'Peringatan',
                              'Mohon isi semua field',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: GFColors.DANGER,
                              colorText: GFColors.WHITE,
                            );
                          }
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
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                      controller: controller.totalBiaya,
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
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                      readOnly: true,
                      controller: controller.labaSebelumPajak,
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
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                      readOnly: true,
                      controller: controller.perkiraanPajak,
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
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                      readOnly: true,
                      controller: controller.labaSetelahPajak,
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
