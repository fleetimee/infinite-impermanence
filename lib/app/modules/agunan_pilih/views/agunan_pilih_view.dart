import 'package:akm/app/models/agunan/agunan_input.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

import '../controllers/agunan_pilih_controller.dart';

class AgunanPilihView extends GetView<AgunanPilihController> {
  const AgunanPilihView({Key? key}) : super(key: key);

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgunanPilihView'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderCheckboxGroup<Map<String, dynamic>>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration:
                  const InputDecoration(labelText: 'The language of my people'),
              name: 'languages',
              onChanged: _onChanged,

              // initialValue: const ['Dart'],
              options: [
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 1,
                    jenisAgunan: 'Tanah',
                    isTanah: true,
                    isKendaraan: false,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Tanah'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 2,
                    jenisAgunan: 'Tanah dan Bangunan',
                    isTanah: true,
                    isKendaraan: false,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Tanah dan Bangunan'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 3,
                    jenisAgunan: 'Kendaraan',
                    isTanah: false,
                    isKendaraan: true,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Kendaraan'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 4,
                    jenisAgunan: 'Mesin dan Peralatan',
                    isTanah: false,
                    isKendaraan: false,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Mesin dan Peralatan'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 5,
                    jenisAgunan: 'Cash Collateral',
                    isTanah: false,
                    isKendaraan: false,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Cash Collateral'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 6,
                    jenisAgunan: 'Kios Pasar',
                    isTanah: false,
                    isKendaraan: false,
                    isLos: true,
                  ).toJson(),
                  child: const Text('Kios Pasar'),
                ),
                FormBuilderFieldOption(
                  value: Bulk(
                    kodeAgunan: 7,
                    jenisAgunan: 'Lainnya',
                    isTanah: false,
                    isKendaraan: false,
                    isLos: false,
                  ).toJson(),
                  child: const Text('Lainnya'),
                ),
              ],
              separator: const VerticalDivider(
                width: 10,
                thickness: 5,
                color: Colors.red,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
                        controller.saveMultipleAgunan();
                        Get.back();
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                      } else {
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.formKey.currentState?.reset();
                    },
                    // color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
