// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/asuransi_controller.dart';

class AsuransiView extends GetView<AsuransiController> {
  AsuransiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premi & Asuransi'),
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
                      name: 'nama_perusahaan',
                      validator: FormBuilderValidators.required(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.business),
                        labelText: 'Nama Perusahaan Asuransi',
                        border: OutlineInputBorder(),
                        hintText: 'JAMKRINDO, ASKRINDO, dll',
                      ),
                      controller: controller.namaPerusahaan),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                      name: 'premi',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(100),
                        FormBuilderValidators.min(0),
                      ]),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.money),
                        labelText: 'Premi',
                        suffixText: '%',
                        border: OutlineInputBorder(),
                        hintText: '3.14 (Decimal memakai Titik)',
                      ),
                      controller: controller.premi),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    readOnly: true,
                    name: 'plafonKredit',
                    keyboardType: TextInputType.number,
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
                        if (controller
                                .formKey.currentState?.fields['premi']?.value !=
                            "") {
                          controller.hitungJumlahAsuransi();
                        } else {
                          Get.snackbar(
                            'Error',
                            'Premi tidak boleh kosong',
                            icon: const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
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
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Asuransi',
                      border: OutlineInputBorder(),
                      hintText: 'Hasil',
                      prefixText: 'Rp. ',
                    ),
                    controller: controller.jumlahAsuransi,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GFButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
                        controller.saveAsuransi(data.id);
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
