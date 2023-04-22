// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/widget/components/list_debitur_filter_fab/label_text.dart';
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/common/style.dart';
import '../controllers/list_debitur_controller.dart';

class ListDebiturFilterFab extends StatelessWidget {
  final ListDebiturController controller;

  const ListDebiturFilterFab({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var umur = '';
    var asal = '';
    var tanggal = '';
    var plafond = '';
    var jenisUsaha = '';

    return FloatingActionButton.extended(
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Advanced Filter'),
                leading: const SizedBox.shrink(),
                actions: [
                  Container(
                    height: 10,
                    padding: const EdgeInsets.all(8),
                    child: GFButton(
                      onPressed: () {
                        controller.getAllDebitur(1.toString(), 'id,ASC');
                        controller.isFilterAsalPressed(false);
                        controller.isFilterUmurPressed(false);
                        controller.isFilterTanggalPressed(false);
                        controller.isFilterPlafondPressed(false);
                        controller.isFilterJenisUsahaPressed(false);

                        Get.back();
                      },
                      text: 'Reset',
                      color: secondaryColor,
                      shape: GFButtonShape.pills,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              body: Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BootstrapAlert(
                      text:
                          'Berikut adalah beberapa field yang dapat anda gunakan untuk melakukan filter data debitur, silahkan di tekan checkbox untuk mengaktifkan filter',
                      isDismissible: true,
                      visible: true,
                      leadingIcon: Icons.info_outline,
                      status: AlertStatus.info,
                    ),
                    const BootstrapAlert(
                      text:
                          'Tekan tombol filter dibawah untuk melihat hasil filter, jika ingin menghapus filter silahkan tekan tombol reset',
                      isDismissible: true,
                      visible: true,
                      leadingIcon: Icons.info_outline,
                      status: AlertStatus.warning,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FormBuilder(
                              key: controller.filterKey,
                              skipDisabled: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FilterLabel(
                                      text: 'Filter berdasarkan Umur'),
                                  const SizedBox(height: 16),
                                  Obx(
                                    () => Row(
                                      children: [
                                        Checkbox(
                                          value: controller
                                              .isFilterUmurPressed.value,
                                          onChanged: (value) {
                                            controller.isFilterUmurPressed
                                                .value = value!;
                                            if (controller.isFilterUmurPressed
                                                    .value ==
                                                false) {
                                              controller.filterKey.currentState!
                                                  .fields['umur']
                                                  ?.reset();
                                              controller.filterUmurInput
                                                  .clear();
                                              umur = '';
                                            }
                                            // umur = '${'&filter'}=umur||${'eq'}||$value';
                                            debugPrint(value.toString());
                                          },
                                        ),
                                        Expanded(
                                          child: FormBuilderTextField(
                                            name: 'umur',
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,

                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.numeric(),
                                              FormBuilderValidators.min(18),
                                              FormBuilderValidators.max(80),
                                              if (controller.isFilterUmurPressed
                                                      .value ==
                                                  true)
                                                FormBuilderValidators.required()
                                            ]),
                                            keyboardType: TextInputType.number,
                                            controller:
                                                controller.filterUmurInput,
                                            decoration: InputDecoration(
                                              hintText: 'Masukkan umur',
                                              filled: true,
                                              suffixText: 'Tahun',
                                              suffixStyle: const TextStyle(
                                                fontSize: 16,
                                              ),
                                              fillColor: Colors.grey.shade400,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            enabled: controller
                                                .isFilterUmurPressed.value,

                                            onSaved: (value) {
                                              if (value != '') {
                                                umur =
                                                    '${'&filter'}=umur||${'eq'}||$value';
                                              }
                                            },

                                            // onSubmitted: (value) {
                                            //   umur =
                                            //       '${'&filter'}=umur||${'eq'}||$value';
                                            // },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const FilterLabel(
                                      text: 'Filter berdasarkan Domisili'),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Row(
                                      children: [
                                        Checkbox(
                                          value: controller
                                              .isFilterAsalPressed.value,
                                          onChanged: (value) {
                                            controller.isFilterAsalPressed
                                                .value = value!;

                                            if (controller.isFilterAsalPressed
                                                    .value ==
                                                false) {
                                              controller.filterKey.currentState!
                                                  .fields['domisili']
                                                  ?.reset();
                                              controller.filterDomisiliInput
                                                  .clear();
                                              asal = '';
                                            }
                                            // umur = '${'&filter'}=umur||${'eq'}||$value';
                                            debugPrint(value.toString());
                                          },
                                        ),
                                        Expanded(
                                          child: FormBuilderSearchableDropdown<
                                              String>(
                                            name: 'domisili',
                                            enabled: controller
                                                .isFilterAsalPressed.value,

                                            onSaved: (value) {
                                              if (value != null) {
                                                asal =
                                                    '${'&filter'}=ktp1||${'eq'}||$value';
                                              }
                                            },
                                            // onChanged: (value) {
                                            //   asal =
                                            //       '${'&filter'}=ktp1||${'eq'}||$value';
                                            // },

                                            items: allProvinsi,
                                            popupProps: const PopupProps.menu(
                                                showSearchBox: true),
                                            dropdownSearchTextStyle:
                                                const TextStyle(
                                              fontSize: 16,
                                            ),
                                            filterFn: (provinsi, filter) =>
                                                provinsi.toLowerCase().contains(
                                                    filter.toLowerCase()),
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Pilih domisili / provinsi',
                                              hintStyle: const TextStyle(
                                                fontSize: 16,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey.shade400,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const FilterLabel(
                                      text:
                                          'Filter berdasarkan Jarak Tanggal Penginputan'),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Row(
                                      children: [
                                        Checkbox(
                                          value: controller
                                              .isFilterTanggalPressed.value,
                                          onChanged: (value) {
                                            controller.isFilterTanggalPressed
                                                .value = value!;

                                            if (controller
                                                    .isFilterTanggalPressed
                                                    .value ==
                                                false) {
                                              controller.filterKey.currentState!
                                                  .fields['date']
                                                  ?.reset();
                                              controller.filterRangeTanggalInput
                                                  .clear();
                                              tanggal = '';
                                            }
                                            // umur = '${'&filter'}=umur||${'eq'}||$value';
                                            debugPrint(value.toString());
                                          },
                                        ),
                                        Expanded(
                                          child: FormBuilderDateRangePicker(
                                            name: 'date',
                                            // valueTransformer: (value) {
                                            //   if (value != null) {
                                            //     tanggal =
                                            //         '${'&filter'}=tanggal||${'eq'}||${value.start.toIso8601String()}||${'and'}||${'tanggal'}||${'eq'}||${value.end.toIso8601String()}';
                                            //   }
                                            // },
                                            locale: const Locale('id', 'ID'),
                                            currentDate: DateTime.now(),
                                            format: DateFormat(
                                                'EEEE dd MMMM yyyy', 'id_ID'),
                                            firstDate: DateTime(1970),
                                            lastDate: DateTime(2050),
                                            onChanged: (value) {
                                              debugPrint(value.toString());
                                            },
                                            onSaved: (value) {
                                              if (value != null) {
                                                tanggal =
                                                    '${'&filter'}=tgl_sekarang||${'between'}||${value.start.toIso8601String()},${value.end.toIso8601String()}';
                                              }
                                            },
                                            enableInteractiveSelection: true,
                                            enabled: controller
                                                .isFilterTanggalPressed.value,
                                            decoration: InputDecoration(
                                              hintText: 'Pilih tanggal',
                                              hintStyle: const TextStyle(
                                                fontSize: 16,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey.shade400,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const FilterLabel(
                                      text: 'Filter berdasarkan Jenis Usaha'),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Row(
                                      children: [
                                        Checkbox(
                                          value: controller
                                              .isFilterJenisUsahaPressed.value,
                                          onChanged: (value) {
                                            controller.isFilterJenisUsahaPressed
                                                .value = value!;

                                            if (controller
                                                    .isFilterJenisUsahaPressed
                                                    .value ==
                                                false) {
                                              controller.filterKey.currentState!
                                                  .fields['jenis_usaha']
                                                  ?.reset();
                                              controller.filterJenisUsaha
                                                  .clear();
                                              jenisUsaha = '';
                                            }
                                            // umur = '${'&filter'}=umur||${'eq'}||$value';
                                            debugPrint(value.toString());
                                          },
                                        ),
                                        Expanded(
                                          child: FormBuilderSearchableDropdown<
                                              String>(
                                            name: 'jenis_usaha',
                                            enabled: controller
                                                .isFilterJenisUsahaPressed
                                                .value,
                                            onSaved: (value) {
                                              if (value != null) {
                                                jenisUsaha =
                                                    '${'&filter'}=jenis_usaha||${'eq'}||$value';
                                              }
                                            },
                                            // onChanged: (value) {
                                            //   jenisUsaha =
                                            //       '${'&filter'}=jenis_usaha||${'eq'}||$value';
                                            // },
                                            dropdownSearchTextStyle:
                                                const TextStyle(
                                              fontSize: 16,
                                            ),
                                            items: jenisUsahaList,
                                            popupProps: const PopupProps.menu(
                                                showSearchBox: true),
                                            dropdownSearchDecoration:
                                                const InputDecoration(
                                              hintText: 'Search',
                                              labelText: 'Search',
                                            ),
                                            filterFn: (jenisUsaha, filter) =>
                                                jenisUsaha
                                                    .toLowerCase()
                                                    .contains(
                                                        filter.toLowerCase()),
                                            decoration: InputDecoration(
                                              hintText: 'Pilih Jenis Usaha',
                                              hintStyle: const TextStyle(
                                                fontSize: 16,
                                              ),
                                              filled: true,
                                              fillColor: Colors.grey.shade400,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const FilterLabel(
                                      text: 'Filter berdasarkan Plafond'),
                                  const SizedBox(height: 10),
                                  Obx(
                                    () => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: controller
                                                  .isFilterPlafondPressed.value,
                                              onChanged: (value) {
                                                controller
                                                    .isFilterPlafondPressed
                                                    .value = value!;

                                                if (controller
                                                        .isFilterPlafondPressed
                                                        .value ==
                                                    false) {
                                                  controller
                                                      .filterKey
                                                      .currentState!
                                                      .fields['plafond']
                                                      ?.reset();
                                                  controller.filterPlafondInput
                                                      .clear();
                                                  plafond = '';
                                                }
                                                // umur = '${'&filter'}=umur||${'eq'}||$value';
                                                debugPrint(value.toString());
                                              },
                                            ),
                                            Expanded(
                                              child: FormBuilderRangeSlider(
                                                name: 'plafond',
                                                enabled: controller
                                                    .isFilterPlafondPressed
                                                    .value,
                                                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                                                // onChanged: _onChanged,
                                                initialValue:
                                                    const RangeValues(0, 100),
                                                min: 0.0,
                                                max: 1000000000.0,
                                                displayValues:
                                                    DisplayValues.current,
                                                divisions: 200,
                                                onChanged: (value) {
                                                  debugPrint(value.toString());
                                                },
                                                numberFormat:
                                                    NumberFormat.simpleCurrency(
                                                  locale: 'id',
                                                  decimalDigits: 0,
                                                  name: 'Rp. ',
                                                ),
                                                textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                activeColor: primaryColor,
                                                inactiveColor: Colors.pink[100],
                                                onSaved: (value) {
                                                  if (value ==
                                                      const RangeValues(
                                                          0, 100)) {
                                                    plafond = '';
                                                  } else {
                                                    plafond =
                                                        '${'&filter'}=inputKeuangan.kredit_diusulkan||${'between'}||${value?.start.toStringAsFixed(0)},${value?.end.toStringAsFixed(0)}';
                                                  }
                                                },

                                                decoration: InputDecoration(
                                                  hintText: 'Pilih tanggal',
                                                  hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      Colors.grey.shade400,
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavBarButton(
                text: 'Filter',
                icon: FontAwesomeIcons.filter,
                onPressed: () {
                  if (controller.filterKey.currentState?.saveAndValidate() ??
                      false) {
                    controller.filter(1.toString(), 'id,ASC', umur, asal,
                        tanggal, plafond, jenisUsaha);
                    Get.back();
                    debugPrint(
                        controller.filterKey.currentState?.value.toString());
                  } else {
                    debugPrint(
                        controller.filterKey.currentState?.value.toString());
                  }
                },
              ),
            );
          },
        );
      },
      label: const Text('Filter'),
      icon: const Icon(FontAwesomeIcons.filter),
      backgroundColor: primaryColor,
      elevation: 10,
      clipBehavior: Clip.antiAlias,
    );
  }
}
