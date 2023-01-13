// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import '../controllers/agunan_pilih_controller.dart';

class AgunanPilihView extends GetView<AgunanPilihController> {
  AgunanPilihView({Key? key}) : super(key: key);

  void _onChanged(dynamic val) => debugPrint(val.toString());
  final keuanganController = Get.put(InputKeuanganController());

  final data = Get.arguments;

  TextStyle checkboxStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Jenis Agunan'),
      ),
      body: FormBuilder(
        key: controller.formKey,
        skipDisabled: true,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Check plafon kredit if <= then go to agunan lainnya
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Animate(
                      child: const GFCard(
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    showOverlayImage: true,
                    imageOverlay: AssetImage('assets/images/home/bannerr.jpg'),
                    title: GFListTile(
                      // color: // White with opactity
                      //     Colors.white.withOpacity(0.5),
                      title: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                      'Rules: Jika Plafon Kredit <= 100 Jt, maka field agunan lainnya akan terbuka'),
                  const SizedBox(
                    height: 12.0,
                  ),
                  FormBuilderTextField(
                    name: 'plafon_kredit',
                    readOnly: true,
                    controller: controller.plafonKredit =
                        MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                        data.inputKeuangan.kreditDiusulkan,
                      ),
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Plafon Kredit',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jenis agunan untuk plafon diatas 100 juta : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      // Text(
                      //   int.parse(data.inputKeuangan.kreditDiusulkan) >
                      //           100000000
                      //       ? 'ENABLED'
                      //       : 'DISABLED',
                      //   style: const TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      //  int.parse(data.inputKeuangan.kreditDiusulkan) > 100000000 ? GFBadge(
                      //   color: Colors.green,
                      //   child: const Text(
                      //     'ENABLED',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   )
                      int.parse(data.inputKeuangan.kreditDiusulkan) > 100000000
                          ? GFButton(
                              onPressed: () {},
                              text: 'ENABLED',
                              color: Colors.green,
                            )
                          : GFButton(
                              onPressed: () {},
                              text: 'DISABLED',
                              color: GFColors.DANGER,
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_tanah',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.SUCCESS,
                          ),
                          title: Text(
                            'Tanah',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_tanah_bangunan',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.DANGER,
                          ),
                          title: Text(
                            'Tanah dan Bangunan',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_peralatan',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.ALT,
                          ),
                          title: Text(
                            'Mesin dan Peralatan',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_cash',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.FOCUS,
                          ),
                          title: Text(
                            'Cash Collateral',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_los',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.INFO,
                          ),
                          title: Text(
                            'Kios Pasar / Los',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_lainnya',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.WARNING,
                          ),
                          title: Text(
                            'Lainnya',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderCheckbox(
                          name: 'agunan_kendaraan',
                          activeColor: primaryColor,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: GFColors.SECONDARY,
                          ),
                          title: Text(
                            'Kendaraan',
                            style: checkboxStyle,
                          ),
                          initialValue: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(child: Container())
                    ],
                  ),

                  // FormBuilderCheckboxGroup<Map<String, dynamic>>(
                  //   // enabled some of the options
                  //   enabled: int.parse(data.inputKeuangan.kreditDiusulkan) >
                  //           100000000
                  //       ? true
                  //       : false,
                  //   wrapDirection: Axis.vertical,
                  //   checkColor: secondaryColor,
                  //   activeColor: primaryColor,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(8),
                  //       ),
                  //     ),
                  //   ),
                  //   name: 'languages',
                  //   onChanged: _onChanged,

                  //   options: [
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_tanah'),
                  //       value: Bulk(
                  //         kodeAgunan: 1,
                  //         jenisAgunan: 'Tanah',
                  //         isTanah: true,
                  //         isKendaraan: false,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Tanah'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_tanah_bangunan'),
                  //       value: Bulk(
                  //         kodeAgunan: 2,
                  //         jenisAgunan: 'Tanah dan Bangunan',
                  //         isTanah: true,
                  //         isKendaraan: false,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Tanah dan Bangunan'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_kendaraan'),
                  //       value: Bulk(
                  //         kodeAgunan: 3,
                  //         jenisAgunan: 'Kendaraan',
                  //         isTanah: false,
                  //         isKendaraan: true,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Kendaraan'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_peralatan'),
                  //       value: Bulk(
                  //         kodeAgunan: 4,
                  //         jenisAgunan: 'Mesin dan Peralatan',
                  //         isTanah: false,
                  //         isKendaraan: false,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Mesin dan Peralatan'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_cash'),
                  //       value: Bulk(
                  //         kodeAgunan: 5,
                  //         jenisAgunan: 'Cash Collateral',
                  //         isTanah: false,
                  //         isKendaraan: false,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Cash Collateral'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_los'),
                  //       value: Bulk(
                  //         kodeAgunan: 6,
                  //         jenisAgunan: 'Kios Pasar',
                  //         isTanah: false,
                  //         isKendaraan: false,
                  //         isLos: true,
                  //       ).toJson(),
                  //       child: const Text('Kios Pasar'),
                  //     ),
                  //   ],
                  //   separator: const VerticalDivider(
                  //     width: 10,
                  //     thickness: 5,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Jenis agunan untuk plafon <= 100 juta : ',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //     int.parse(data.inputKeuangan.kreditDiusulkan) <=
                  //             100000000
                  //         ? const GFButton(
                  //             onPressed: null,
                  //             text: 'ENABLED',
                  //             color: Colors.green,
                  //           )
                  //         : GFButton(
                  //             onPressed: () {},
                  //             text: 'INADVISABLE',
                  //             color: GFColors.DANGER,
                  //           ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  // FormBuilderCheckboxGroup<Map<String, dynamic>>(
                  //   // enabled some of the options
                  //   wrapDirection: Axis.vertical,
                  //   checkColor: secondaryColor,
                  //   activeColor: primaryColor,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(8),
                  //       ),
                  //     ),
                  //   ),
                  //   name: 'languages',
                  //   onChanged: _onChanged,
                  //   options: [
                  //     FormBuilderFieldOption(
                  //       key: const Key('key_lainnya'),
                  //       value: Bulk(
                  //         kodeAgunan: 7,
                  //         jenisAgunan: 'Lainnya',
                  //         isTanah: false,
                  //         isKendaraan: false,
                  //         isLos: false,
                  //       ).toJson(),
                  //       child: const Text('Lainnya'),
                  //     ),
                  //   ],
                  //   separator: const VerticalDivider(
                  //     width: 10,
                  //     thickness: 5,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState
                                ?.saveAndValidate() ??
                            false) {
                          controller.saveMultipleAgunan();
                          // controller.patchProgressBar(data.id);
                          Get.back();
                          debugPrint(controller.formKey.currentState?.value
                              .toString());
                        } else {
                          debugPrint(controller.formKey.currentState?.value
                              .toString());
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
      ),
    );
  }
}
