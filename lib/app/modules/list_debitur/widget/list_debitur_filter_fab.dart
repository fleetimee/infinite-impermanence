// 🐦 Flutter imports:
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
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilder(
                      key: controller.filterKey,
                      skipDisabled: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Umur',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller.isFilterUmurPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterUmurPressed.value =
                                        value!;
                                    if (controller.isFilterUmurPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['umur']
                                          ?.reset();
                                      controller.filterUmurInput.clear();
                                      umur = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'umur',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,

                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.numeric(),
                                      FormBuilderValidators.min(18),
                                      FormBuilderValidators.max(80),
                                      if (controller
                                              .isFilterUmurPressed.value ==
                                          true)
                                        FormBuilderValidators.required()
                                    ]),
                                    keyboardType: TextInputType.number,
                                    controller: controller.filterUmurInput,
                                    decoration: const InputDecoration(
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.odnoklassniki),
                                      hintText: 'Filter berdasarkan Umur',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    enabled:
                                        controller.isFilterUmurPressed.value,

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
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Domisili',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller.isFilterAsalPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterAsalPressed.value =
                                        value!;

                                    if (controller.isFilterAsalPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['domisili']
                                          ?.reset();
                                      controller.filterDomisiliInput.clear();
                                      asal = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderSearchableDropdown<String>(
                                    name: 'domisili',
                                    enabled:
                                        controller.isFilterAsalPressed.value,

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
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      hintText: 'Search',
                                      labelText: 'Search',
                                    ),
                                    filterFn: (provinsi, filter) => provinsi
                                        .toLowerCase()
                                        .contains(filter.toLowerCase()),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18),
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.addressBook),
                                      hintText: 'Filter berdasarkan Domisili',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Tanggal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value:
                                      controller.isFilterTanggalPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterTanggalPressed.value =
                                        value!;

                                    if (controller
                                            .isFilterTanggalPressed.value ==
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
                                    currentDate: DateTime.now(),
                                    format: DateFormat('dd MMMM yyyy'),
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
                                    enabled:
                                        controller.isFilterTanggalPressed.value,
                                    decoration: const InputDecoration(
                                      hintText: 'Filter berdasarkan Tanggal',
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.calendar),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Jenis Usaha',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller
                                      .isFilterJenisUsahaPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterJenisUsahaPressed.value =
                                        value!;

                                    if (controller
                                            .isFilterJenisUsahaPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['jenis_usaha']
                                          ?.reset();
                                      controller.filterJenisUsaha.clear();
                                      jenisUsaha = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderSearchableDropdown<String>(
                                    name: 'jenis_usaha',
                                    enabled: controller
                                        .isFilterJenisUsahaPressed.value,
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
                                    items: jenisUsahaList,
                                    popupProps: const PopupProps.menu(
                                        showSearchBox: true),
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      hintText: 'Search',
                                      labelText: 'Search',
                                    ),
                                    filterFn: (jenisUsaha, filter) => jenisUsaha
                                        .toLowerCase()
                                        .contains(filter.toLowerCase()),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18),
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.tractor),
                                      hintText:
                                          'Filter berdasarkan Jenis Usaha',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Plafond',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
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
                                        controller.isFilterPlafondPressed
                                            .value = value!;

                                        if (controller
                                                .isFilterPlafondPressed.value ==
                                            false) {
                                          controller.filterKey.currentState!
                                              .fields['plafond']
                                              ?.reset();
                                          controller.filterPlafondInput.clear();
                                          plafond = '';
                                        }
                                        // umur = '${'&filter'}=umur||${'eq'}||$value';
                                        debugPrint(value.toString());
                                      },
                                    ),
                                    Expanded(
                                      // child: FormBuilderDateRangePicker(
                                      //   name: 'date',
                                      //   // valueTransformer: (value) {
                                      //   //   if (value != null) {
                                      //   //     tanggal =
                                      //   //         '${'&filter'}=tanggal||${'eq'}||${value.start.toIso8601String()}||${'and'}||${'tanggal'}||${'eq'}||${value.end.toIso8601String()}';
                                      //   //   }
                                      //   // },
                                      //   currentDate: DateTime.now(),
                                      //   format: DateFormat('dd MMMM yyyy'),
                                      //   firstDate: DateTime(1970),
                                      //   lastDate: DateTime(2050),
                                      //   onChanged: (value) {
                                      //     debugPrint(value.toString());
                                      //   },
                                      //   onSaved: (value) {
                                      //     if (value != null) {
                                      //       tanggal =
                                      //           '${'&filter'}=tgl_sekarang||${'between'}||${value.start.toIso8601String()},${value.end.toIso8601String()}';
                                      //     }
                                      //   },
                                      //   enableInteractiveSelection: true,
                                      //   enabled: controller
                                      //       .isFilterTanggalPressed.value,
                                      //   decoration: const InputDecoration(
                                      //     hintText:
                                      //         'Filter berdasarkan Tanggal',
                                      //     prefixIcon:
                                      //         Icon(FontAwesomeIcons.calendar),
                                      //     border: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(10),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // child: FormBuilderRangeSlider(
                                      //   name: 'plafond',
                                      //   min: 0.0,
                                      //   max: 100.0,
                                      //   enabled:
                                      //       controller.isFilterPlafondPressed.value,
                                      //   divisions: 100,
                                      //   onChanged: (value) {
                                      //     debugPrint(value.toString());
                                      //   },
                                      //   onSaved: (value) {
                                      //     // if (value != null) {
                                      //     //   plafond =
                                      //     //       '${'&filter'}=plafond||${'between'}||${value.start},${value.end}';
                                      //     // }
                                      //   },
                                      //   decoration: const InputDecoration(
                                      //     hintText: 'Filter berdasarkan Plafond',
                                      //     prefixIcon:
                                      //         Icon(FontAwesomeIcons.moneyBill),
                                      //     border: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(10),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      child: FormBuilderRangeSlider(
                                        name: 'plafond',
                                        enabled: controller
                                            .isFilterPlafondPressed.value,
                                        // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                                        // onChanged: _onChanged,
                                        initialValue: const RangeValues(0, 100),

                                        min: 0.0,
                                        max: 1000000000.0,
                                        displayValues: DisplayValues.current,
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
                                        activeColor: primaryColor,

                                        inactiveColor: Colors.pink[100],
                                        onSaved: (value) {
                                          if (value ==
                                              const RangeValues(0, 100)) {
                                            plafond = '';
                                          } else {
                                            plafond =
                                                '${'&filter'}=inputKeuangan.kredit_diusulkan||${'between'}||${value?.start.toStringAsFixed(0)},${value?.end.toStringAsFixed(0)}';
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Range Plafond',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GFButton(
                          onPressed: () {
                            if (controller.filterKey.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              controller.filter(1.toString(), 'id,ASC', umur,
                                  asal, tanggal, plafond, jenisUsaha);
                              Get.back();
                              debugPrint(controller
                                  .filterKey.currentState?.value
                                  .toString());
                            } else {
                              debugPrint(controller
                                  .filterKey.currentState?.value
                                  .toString());
                            }
                          },
                          fullWidthButton: true,
                          color: primaryColor,
                          text: 'Filter',
                          size: GFSize.LARGE,
                          shape: GFButtonShape.pills,
                        ),
                        GFButton(
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
                          size: GFSize.LARGE,
                          shape: GFButtonShape.pills,
                          type: GFButtonType.outline,
                          fullWidthButton: true,
                        ),
                      ],
                    ),
                  ],
                ),
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
