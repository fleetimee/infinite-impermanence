import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan/views/components/hitung_agunan.dart';
import 'package:akm/app/modules/agunan/views/components/nilai_agunan.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
              child: Column(
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
                  NilaiAgunan(),
                  const SizedBox(
                    height: 30,
                  ),
                  FormBuilderTextField(
                    name: 'Nilai Agunan',
                    controller: controller.totalNilaiAgunan,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1,
                    ),
                    inputFormatters: <TextInputFormatter>[controller.formatter],
                    decoration: const InputDecoration(
                      labelText: 'Total Nilai Agunan',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  colorButton(
                    context,
                    'Submit',
                    () => showBarModalBottomSheet(
                      backgroundColor: secondaryColor,
                      bounce: true,
                      context: context,
                      builder: (context) {
                        controller.hitungRatio();
                        return HitungCrrAgunan();
                      },
                    ),
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
