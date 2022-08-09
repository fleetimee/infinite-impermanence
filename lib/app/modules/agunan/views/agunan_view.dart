import 'package:akm/app/common/style.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

import '../controllers/agunan_controller.dart';

class AgunanView extends GetView<AgunanController> {
  const AgunanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Agunan'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: FormBuilder(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GifView.asset(
                      'assets/images/agunan/header.gif',
                      frameRate: 30,
                      fit: BoxFit.cover,
                      loop: false,
                      height: 400,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Divider(
                        thickness: 1,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Input Agunan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Isikan barang agunan yang dimiliki debitur beserta nilainya, jelaskan juga keterangannya secara rinci dan detail.',
                      style: TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.fade,
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderSearchableDropdown<String>(
                      popupProps: const PopupProps.menu(showSearchBox: true),
                      name: 'searchable_dropdown_online',
                      onChanged: _onChanged,
                      asyncItems: (filter) async {
                        await Future.delayed(const Duration(seconds: 1));
                        return allDebiturs
                            .where((element) => element
                                .toLowerCase()
                                .contains(filter.toLowerCase()))
                            .toList();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Pilih Debitur / No Pengajuan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'Asuransi',
                      decoration: const InputDecoration(
                        labelText: 'Asuransi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'Barang Agunan',
                      decoration: const InputDecoration(
                        labelText: 'Barang Agunan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ExpansionTile(
                      subtitle: const Text(
                        'Jelaskan keterangan barang agunan yang dimiliki debitur secara rinci dan detail serta berikan juga harga dan bukti kepemilikannya.',
                        style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.fade,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      title: const Text('Nilai Agunan'),
                      trailing: controller.isExpanded.value
                          ? const Icon(Icons.arrow_drop_down_circle)
                          : const Icon(Icons.arrow_drop_down),
                      onExpansionChanged: (isExpanded) {
                        controller.isExpanded.value = isExpanded;
                      },
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Checkbox(
                                value: controller.isCheckedTanah.value,
                                onChanged: (value) {
                                  controller.isCheckedTanah.value = value!;

                                  // clear the form if the checkbox is unchecked
                                  if (!value) {
                                    controller.tanahKey.currentState?.reset();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 12,
                              child: FormBuilderTextField(
                                controller: controller.tanahInput,
                                enabled: controller.isCheckedTanah.value
                                    ? true
                                    : false,
                                name: 'Tanah',
                                decoration: const InputDecoration(
                                  labelText: 'Tanah',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                          child: FormBuilderTextField(
                            enabled:
                                controller.isCheckedTanah.value ? true : false,
                            name: 'Bukti Kepemilikan Tanah',
                            decoration: const InputDecoration(
                              labelText: 'Bukti Kepemilikan Tanah',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Checkbox(
                                value:
                                    controller.isCheckedTanahAndBangunan.value,
                                onChanged: (value) {
                                  controller.isCheckedTanahAndBangunan.value =
                                      value!;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 12,
                              child: FormBuilderTextField(
                                controller: controller.tanahAndBangunanInput,
                                enabled:
                                    controller.isCheckedTanahAndBangunan.value
                                        ? true
                                        : false,
                                name: 'Tanah Dan Bangunan',
                                decoration: const InputDecoration(
                                  labelText: 'Tanah dan Bangunan',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                          child: FormBuilderTextField(
                            enabled: controller.isCheckedTanahAndBangunan.value
                                ? true
                                : false,
                            name: 'Bukti Kepemisilan Tanah dan Bangunan',
                            decoration: const InputDecoration(
                              labelText: 'Bukti Kepemisilan Tanah dan Bangunan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Checkbox(
                                value:
                                    controller.isCheckedMesinAndPeralatan.value,
                                onChanged: (value) {
                                  controller.isCheckedMesinAndPeralatan.value =
                                      value!;
                                  // Reset value of input text field
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 12,
                              child: FormBuilderTextField(
                                controller: controller.mesinAndPeralatanInput,
                                enabled:
                                    controller.isCheckedMesinAndPeralatan.value
                                        ? true
                                        : false,
                                name: 'Mesin dan Peralatan',
                                decoration: const InputDecoration(
                                  labelText: 'Mesin dan Peralatan',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                          child: FormBuilderTextField(
                            enabled: controller.isCheckedMesinAndPeralatan.value
                                ? true
                                : false,
                            name: 'Bukti Kepemisilan Mesin dan Peralatan',
                            decoration: const InputDecoration(
                              labelText:
                                  'Bukti Kepemisilan Mesin dan Peralatan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Checkbox(
                                value: controller.isCheckedKendaraan.value,
                                onChanged: (value) {
                                  controller.isCheckedKendaraan.value = value!;
                                  // Reset value of input text field
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 12,
                              child: FormBuilderTextField(
                                controller: controller.kendaraanInput,
                                enabled: controller.isCheckedKendaraan.value
                                    ? true
                                    : false,
                                name: 'Kendaraan',
                                decoration: const InputDecoration(
                                  labelText: 'Kendaraan',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                          child: FormBuilderTextField(
                            enabled: controller.isCheckedKendaraan.value
                                ? true
                                : false,
                            name: 'Bukti Kepemisilan Kendaraan',
                            decoration: const InputDecoration(
                              labelText: 'Bukti Kepemisilan Kendaraan',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'Nilai Agunan',
                      decoration: const InputDecoration(
                        labelText: 'Total Nilai Agunan',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'Asuransi',
                      decoration: const InputDecoration(
                        labelText: 'Asuransi',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormBuilderTextField(
                      name: 'Deskripsi Agunan',
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi Agunan',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      keyboardType: TextInputType.number,
                      maxLines: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    colorButton(
                      context,
                      'Submit',
                      () => AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Success',
                        desc: 'Data berhasil ditambahkan',
                      ).show(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _onChanged(dynamic val) => debugPrint(val.toString());

const allDebiturs = [
  'Novian Andika',
  'Sonia Eka P',
  'Lussy Ika',
  'Meliya Aja',
  'Monkey D Luffy',
];
