// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final debiturCtrl = Get.put(InsightDebiturController());

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
                        child: Slidable(
                          enabled: controller.debiturController.insightDebitur
                                      .value.agunan
                                      ?.where(
                                          (element) => element.kodeAgunan == 1)
                                      .isEmpty ==
                                  true
                              ? false
                              : true,
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.all(10),
                                spacing: 10,
                                onPressed: ((context) => {
                                      AwesomeDialog(
                                              context: Get.context!,
                                              dialogType: DialogType.question,
                                              animType: AnimType.bottomSlide,
                                              dialogBackgroundColor:
                                                  primaryColor,
                                              titleTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              descTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              title: 'Konfirmasi',
                                              bodyHeaderDistance: 25,
                                              desc:
                                                  'Apakah yakin untuk menghapus item ini ?',
                                              btnOkOnPress: () {
                                                controller.deleteFirstAgunan(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere((element) =>
                                                            element
                                                                .kodeAgunan ==
                                                            1)
                                                        .id!,
                                                    'agunan_tanah');
                                              },
                                              btnOkText: 'Oke sip',
                                              btnCancelText: 'Affa iyh',
                                              btnCancelOnPress: () {})
                                          .show()
                                    }),
                                backgroundColor: GFColors.DANGER,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trash,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child: Obx(() => controller
                                  .isAgunanInputProcessing.value
                              ? const Center(child: CircularProgressIndicator())
                              : FormBuilderCheckbox(
                                  name: 'agunan_tanah',
                                  enabled: controller.debiturController
                                              .insightDebitur.value.agunan
                                              ?.where((element) =>
                                                  element.kodeAgunan == 1)
                                              .isEmpty ==
                                          true
                                      ? true
                                      : false,
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
                                  initialValue: controller.debiturController
                                              .insightDebitur.value.agunan
                                              ?.where((element) =>
                                                  element.kodeAgunan == 1)
                                              .isEmpty ==
                                          true
                                      ? false
                                      : controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.contains(
                                                controller
                                                    .debiturController
                                                    .insightDebitur
                                                    .value
                                                    .agunan!
                                                    .firstWhere(
                                                  (element) =>
                                                      element.kodeAgunan == 1,
                                                ),
                                              ) ==
                                              true
                                          ? true
                                          : false,
                                )),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Slidable(
                          enabled: controller.debiturController.insightDebitur
                                      .value.agunan
                                      ?.where(
                                          (element) => element.kodeAgunan == 2)
                                      .isEmpty ==
                                  true
                              ? false
                              : true,
                          startActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.all(10),
                                spacing: 10,
                                onPressed: ((context) => {
                                      AwesomeDialog(
                                              context: Get.context!,
                                              dialogType: DialogType.question,
                                              animType: AnimType.bottomSlide,
                                              dialogBackgroundColor:
                                                  primaryColor,
                                              titleTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              descTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              title: 'Konfirmasi',
                                              bodyHeaderDistance: 25,
                                              desc:
                                                  'Apakah yakin untuk menghapus item ini ?',
                                              btnOkOnPress: () {
                                                controller.deleteFirstAgunan(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere((element) =>
                                                            element
                                                                .kodeAgunan ==
                                                            2)
                                                        .id!,
                                                    'agunan_tanah');
                                              },
                                              btnOkText: 'Oke sip',
                                              btnCancelText: 'Affa iyh',
                                              btnCancelOnPress: () {})
                                          .show()
                                    }),
                                backgroundColor: GFColors.DANGER,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trash,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child: Obx(() => controller
                                  .isAgunanInputProcessing.value
                              ? const Center(child: CircularProgressIndicator())
                              : FormBuilderCheckbox(
                                  name: 'agunan_tanah_bangunan',
                                  activeColor: primaryColor,
                                  enabled: controller.debiturController
                                              .insightDebitur.value.agunan
                                              ?.where((element) =>
                                                  element.kodeAgunan == 2)
                                              .isEmpty ==
                                          true
                                      ? true
                                      : false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: GFColors.DANGER,
                                  ),
                                  title: Text(
                                    'Tanah dan Bangunan',
                                    style: checkboxStyle,
                                  ),
                                  initialValue: controller.debiturController
                                              .insightDebitur.value.agunan
                                              ?.where((element) =>
                                                  element.kodeAgunan == 2)
                                              .isEmpty ==
                                          true
                                      ? false
                                      : controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.contains(
                                                controller
                                                    .debiturController
                                                    .insightDebitur
                                                    .value
                                                    .agunan!
                                                    .firstWhere(
                                                  (element) =>
                                                      element.kodeAgunan == 2,
                                                ),
                                              ) ==
                                              true
                                          ? true
                                          : false,
                                )),
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
                        child: Slidable(
                          enabled: controller.debiturController.insightDebitur
                                      .value.agunan
                                      ?.where(
                                          (element) => element.kodeAgunan == 4)
                                      .isEmpty ==
                                  true
                              ? false
                              : true,
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.all(10),
                                spacing: 10,
                                onPressed: ((context) => {
                                      AwesomeDialog(
                                              context: Get.context!,
                                              dialogType: DialogType.question,
                                              animType: AnimType.bottomSlide,
                                              dialogBackgroundColor:
                                                  primaryColor,
                                              titleTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              descTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              title: 'Konfirmasi',
                                              bodyHeaderDistance: 25,
                                              desc:
                                                  'Apakah yakin untuk menghapus item ini ?',
                                              btnOkOnPress: () {
                                                controller.deleteFirstAgunan(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere((element) =>
                                                            element
                                                                .kodeAgunan ==
                                                            4)
                                                        .id!,
                                                    'agunan_peralatan');
                                              },
                                              btnOkText: 'Oke sip',
                                              btnCancelText: 'Affa iyh',
                                              btnCancelOnPress: () {})
                                          .show()
                                    }),
                                backgroundColor: GFColors.DANGER,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trash,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child: Obx(
                            () => controller.isAgunanInputProcessing.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : FormBuilderCheckbox(
                                    name: 'agunan_peralatan',
                                    enabled: controller.debiturController
                                                .insightDebitur.value.agunan
                                                ?.where((element) =>
                                                    element.kodeAgunan == 4)
                                                .isEmpty ==
                                            true
                                        ? true
                                        : false,
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
                                    initialValue: controller.debiturController
                                                .insightDebitur.value.agunan
                                                ?.where((element) =>
                                                    element.kodeAgunan == 4)
                                                .isEmpty ==
                                            true
                                        ? false
                                        : controller.debiturController
                                                    .insightDebitur.value.agunan
                                                    ?.contains(
                                                  controller
                                                      .debiturController
                                                      .insightDebitur
                                                      .value
                                                      .agunan!
                                                      .firstWhere(
                                                    (element) =>
                                                        element.kodeAgunan == 4,
                                                  ),
                                                ) ==
                                                true
                                            ? true
                                            : false,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Slidable(
                          enabled: controller.debiturController.insightDebitur
                                      .value.agunan
                                      ?.where(
                                          (element) => element.kodeAgunan == 5)
                                      .isEmpty ==
                                  true
                              ? false
                              : true,
                          startActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.all(10),
                                spacing: 10,
                                onPressed: ((context) => {
                                      AwesomeDialog(
                                              context: Get.context!,
                                              dialogType: DialogType.question,
                                              animType: AnimType.bottomSlide,
                                              dialogBackgroundColor:
                                                  primaryColor,
                                              titleTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              descTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              title: 'Konfirmasi',
                                              bodyHeaderDistance: 25,
                                              desc:
                                                  'Apakah yakin untuk menghapus item ini ?',
                                              btnOkOnPress: () {
                                                controller.deleteFirstAgunan(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere((element) =>
                                                            element
                                                                .kodeAgunan ==
                                                            5)
                                                        .id!,
                                                    'agunan_cash');
                                              },
                                              btnOkText: 'Oke sip',
                                              btnCancelText: 'Affa iyh',
                                              btnCancelOnPress: () {})
                                          .show()
                                    }),
                                backgroundColor: GFColors.DANGER,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trash,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child: Obx(
                            () => controller.isAgunanInputProcessing.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : FormBuilderCheckbox(
                                    name: 'agunan_cash',
                                    enabled: controller.debiturController
                                                .insightDebitur.value.agunan
                                                ?.where((element) =>
                                                    element.kodeAgunan == 5)
                                                .isEmpty ==
                                            true
                                        ? true
                                        : false,
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
                                    initialValue: controller.debiturController
                                                .insightDebitur.value.agunan
                                                ?.where((element) =>
                                                    element.kodeAgunan == 5)
                                                .isEmpty ==
                                            true
                                        ? false
                                        : controller.debiturController
                                                    .insightDebitur.value.agunan
                                                    ?.contains(
                                                  controller
                                                      .debiturController
                                                      .insightDebitur
                                                      .value
                                                      .agunan!
                                                      .firstWhere(
                                                    (element) =>
                                                        element.kodeAgunan == 5,
                                                  ),
                                                ) ==
                                                true
                                            ? true
                                            : false,
                                  ),
                          ),
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
                        child: Slidable(
                          enabled: controller.debiturController.insightDebitur
                                      .value.agunan
                                      ?.where(
                                          (element) => element.kodeAgunan == 6)
                                      .isEmpty ==
                                  true
                              ? false
                              : true,
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.all(10),
                                spacing: 10,
                                onPressed: ((context) => {
                                      AwesomeDialog(
                                              context: Get.context!,
                                              dialogType: DialogType.question,
                                              animType: AnimType.bottomSlide,
                                              dialogBackgroundColor:
                                                  primaryColor,
                                              titleTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              descTextStyle:
                                                  GoogleFonts.poppins(
                                                color: secondaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              title: 'Konfirmasi',
                                              bodyHeaderDistance: 25,
                                              desc:
                                                  'Apakah yakin untuk menghapus item ini ?',
                                              btnOkOnPress: () {
                                                controller.deleteFirstAgunan(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere((element) =>
                                                            element
                                                                .kodeAgunan ==
                                                            6)
                                                        .id!,
                                                    'agunan_los');
                                              },
                                              btnOkText: 'Oke sip',
                                              btnCancelText: 'Affa iyh',
                                              btnCancelOnPress: () {})
                                          .show()
                                    }),
                                backgroundColor: GFColors.DANGER,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trash,
                                label: 'Hapus',
                              ),
                            ],
                          ),
                          child:
                              Obx(() => controller.isAgunanInputProcessing.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : FormBuilderCheckbox(
                                      name: 'agunan_los',
                                      enabled: controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.where((element) =>
                                                      element.kodeAgunan == 6)
                                                  .isEmpty ==
                                              true
                                          ? true
                                          : false,
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
                                      initialValue: controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.where((element) =>
                                                      element.kodeAgunan == 6)
                                                  .isEmpty ==
                                              true
                                          ? false
                                          : controller
                                                      .debiturController
                                                      .insightDebitur
                                                      .value
                                                      .agunan
                                                      ?.contains(
                                                    controller
                                                        .debiturController
                                                        .insightDebitur
                                                        .value
                                                        .agunan!
                                                        .firstWhere(
                                                      (element) =>
                                                          element.kodeAgunan ==
                                                          6,
                                                    ),
                                                  ) ==
                                                  true
                                              ? true
                                              : false,
                                    )),
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
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
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
                          // Get.back();
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
