import 'package:akm/app/common/style.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/asuransi_controller.dart';

class EditAsuransiView extends GetView<AsuransiController> {
  EditAsuransiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Premi & Asuransi'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Animate(
                      child: const GFCard(
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    showOverlayImage: true,
                    imageOverlay: AssetImage('assets/images/home/bi_fast.png'),
                    title: GFListTile(
                      title: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(
                              delay: 300.ms,
                              duration:
                                  600.ms) // runs after the above w/new duration
                      // inherits the delay & duration from move,
                      ),
                  FormBuilderTextField(
                      name: 'premi',
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        labelText: 'Premi',
                        suffixText: '%',
                        border: OutlineInputBorder(),
                        hintText: '3.14 (Decimal memakai Titik)',
                      ),
                      controller: controller.premi =
                          TextEditingController(text: data.asuransi.premi)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    readOnly: true,
                    name: 'plafonKredit',
                    controller: controller.plafonKredit =
                        MoneyMaskedTextController(
                            decimalSeparator: '',
                            thousandSeparator: '.',
                            precision: 0,
                            initialValue: double.parse(
                                data.inputKeuangan.kreditDiusulkan.toString())),
                    decoration: const InputDecoration(
                      labelText: 'Plafon Kredit',
                      prefixText: 'Rp. ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GFButton(
                      onPressed: () {
                        controller.hitungJumlahAsuransi();
                      },
                      text: 'Hitung Asuransi',
                      elevation: 10,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    readOnly: true,
                    name: 'jumlahAsuransi',
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Asuransi',
                      border: OutlineInputBorder(),
                      hintText: 'Hasil',
                      prefixText: 'Rp. ',
                    ),
                    controller: controller.jumlahAsuransi =
                        MoneyMaskedTextController(
                            decimalSeparator: '',
                            thousandSeparator: '.',
                            precision: 0,
                            initialValue:
                                double.parse(data.asuransi.totalAsuransi)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GFButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
                        controller.editAsuransi(data.id, data.asuransi.id);
                        Get.back();
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                      } else {
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                    text: 'Simpan',
                    color: primaryColor,
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
