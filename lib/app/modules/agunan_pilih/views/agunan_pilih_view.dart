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

// ignore: must_be_immutable
class AgunanPilihView extends GetView<AgunanPilihController> {
  AgunanPilihView({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Animate(
                      child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        'assets/images/home/bannerr.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 200,
                      )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 600.ms),
                    ),
                  ) // runs after the above w/new duration
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
                      prefixText: 'Rp. ',
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
                  int.parse(data.inputKeuangan.kreditDiusulkan) > 100000000
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Berikut adalah jenis agunan yang tersedia untuk plafond diatas Rp. 100.000.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.merge(const TextStyle(fontSize: 14)),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Obx(
                              () => controller.isAgunanInputProcessing.value
                                  ? const Center(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Slidable(
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                1)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                endActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 1)
                                                                              .id!,
                                                                          'agunan_tanah');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(() => controller
                                                        .isAgunanInputProcessing
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : FormBuilderCheckbox(
                                                        name: 'agunan_tanah',
                                                        enabled: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        1)
                                                                    .isEmpty ==
                                                                true
                                                            ? true
                                                            : false,
                                                        activeColor:
                                                            primaryColor,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              const OutlineInputBorder(),
                                                          filled: true,
                                                          fillColor: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          1)
                                                                      .isEmpty ==
                                                                  true
                                                              ? GFColors.FOCUS
                                                              : GFColors
                                                                  .SUCCESS,
                                                        ),
                                                        title: Text(
                                                          'Tanah',
                                                          style: checkboxStyle,
                                                        ),
                                                        initialValue: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        1)
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
                                                                            1,
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
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                2)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                startActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 2)
                                                                              .id!,
                                                                          'agunan_tanah');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(() => controller
                                                        .isAgunanInputProcessing
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : FormBuilderCheckbox(
                                                        name:
                                                            'agunan_tanah_bangunan',
                                                        activeColor:
                                                            primaryColor,
                                                        enabled: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        2)
                                                                    .isEmpty ==
                                                                true
                                                            ? true
                                                            : false,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              const OutlineInputBorder(),
                                                          filled: true,
                                                          fillColor: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          2)
                                                                      .isEmpty ==
                                                                  true
                                                              ? GFColors.FOCUS
                                                              : GFColors
                                                                  .SUCCESS,
                                                        ),
                                                        title: Text(
                                                          'Tanah dan Bangunan',
                                                          style: checkboxStyle,
                                                        ),
                                                        initialValue: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        2)
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
                                                                            2,
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
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                4)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                endActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 4)
                                                                              .id!,
                                                                          'agunan_peralatan');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(
                                                  () => controller
                                                          .isAgunanInputProcessing
                                                          .value
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : FormBuilderCheckbox(
                                                          name:
                                                              'agunan_peralatan',
                                                          enabled: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          4)
                                                                      .isEmpty ==
                                                                  true
                                                              ? true
                                                              : false,
                                                          activeColor:
                                                              primaryColor,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                const OutlineInputBorder(),
                                                            filled: true,
                                                            fillColor: controller
                                                                        .debiturController
                                                                        .insightDebitur
                                                                        .value
                                                                        .agunan
                                                                        ?.where((element) =>
                                                                            element.kodeAgunan ==
                                                                            4)
                                                                        .isEmpty ==
                                                                    true
                                                                ? GFColors.FOCUS
                                                                : GFColors
                                                                    .SUCCESS,
                                                          ),
                                                          title: Text(
                                                            'Mesin dan Peralatan',
                                                            style:
                                                                checkboxStyle,
                                                          ),
                                                          initialValue: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          4)
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
                                                                              4,
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
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                5)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                startActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 5)
                                                                              .id!,
                                                                          'agunan_cash');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(
                                                  () => controller
                                                          .isAgunanInputProcessing
                                                          .value
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : FormBuilderCheckbox(
                                                          name: 'agunan_cash',
                                                          enabled: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          5)
                                                                      .isEmpty ==
                                                                  true
                                                              ? true
                                                              : false,
                                                          activeColor:
                                                              primaryColor,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                const OutlineInputBorder(),
                                                            filled: true,
                                                            fillColor: controller
                                                                        .debiturController
                                                                        .insightDebitur
                                                                        .value
                                                                        .agunan
                                                                        ?.where((element) =>
                                                                            element.kodeAgunan ==
                                                                            5)
                                                                        .isEmpty ==
                                                                    true
                                                                ? GFColors.FOCUS
                                                                : GFColors
                                                                    .SUCCESS,
                                                          ),
                                                          title: Text(
                                                            'Cash Collateral',
                                                            style:
                                                                checkboxStyle,
                                                          ),
                                                          initialValue: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          5)
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
                                                                              5,
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
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                6)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                endActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 6)
                                                                              .id!,
                                                                          'agunan_los');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(() => controller
                                                        .isAgunanInputProcessing
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : FormBuilderCheckbox(
                                                        name: 'agunan_los',
                                                        enabled: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        6)
                                                                    .isEmpty ==
                                                                true
                                                            ? true
                                                            : false,
                                                        activeColor:
                                                            primaryColor,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              const OutlineInputBorder(),
                                                          filled: true,
                                                          fillColor: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          6)
                                                                      .isEmpty ==
                                                                  true
                                                              ? GFColors.FOCUS
                                                              : GFColors
                                                                  .SUCCESS,
                                                        ),
                                                        title: Text(
                                                          'Kios Pasar / Los',
                                                          style: checkboxStyle,
                                                        ),
                                                        initialValue: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        6)
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
                                              child: Slidable(
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                7)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                startActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 7)
                                                                              .id!,
                                                                          'agunan_lainnya');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(() => controller
                                                        .isAgunanInputProcessing
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : FormBuilderCheckbox(
                                                        name: 'agunan_lainnya',
                                                        enabled: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        7)
                                                                    .isEmpty ==
                                                                true
                                                            ? true
                                                            : false,
                                                        activeColor:
                                                            primaryColor,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              const OutlineInputBorder(),
                                                          filled: true,
                                                          fillColor: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          7)
                                                                      .isEmpty ==
                                                                  true
                                                              ? GFColors.FOCUS
                                                              : GFColors
                                                                  .SUCCESS,
                                                        ),
                                                        title: Text(
                                                          'Lainnya',
                                                          style: checkboxStyle,
                                                        ),
                                                        initialValue: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        7)
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
                                                                            7,
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
                                                enabled: controller
                                                            .debiturController
                                                            .insightDebitur
                                                            .value
                                                            .agunan
                                                            ?.where((element) =>
                                                                element
                                                                    .kodeAgunan ==
                                                                3)
                                                            .isEmpty ==
                                                        true
                                                    ? false
                                                    : true,
                                                endActionPane: ActionPane(
                                                  motion: const DrawerMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      spacing: 10,
                                                      onPressed: ((context) => {
                                                            AwesomeDialog(
                                                                    context: Get
                                                                        .context!,
                                                                    dialogType: DialogType
                                                                        .question,
                                                                    animType: AnimType
                                                                        .bottomSlide,
                                                                    dialogBackgroundColor:
                                                                        primaryColor,
                                                                    titleTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          30,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    descTextStyle:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      color:
                                                                          secondaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    title:
                                                                        'Konfirmasi',
                                                                    bodyHeaderDistance:
                                                                        25,
                                                                    desc:
                                                                        'Apakah yakin untuk menghapus item ini ?',
                                                                    btnOkOnPress:
                                                                        () {
                                                                      controller.deleteFirstAgunan(
                                                                          controller
                                                                              .debiturController
                                                                              .insightDebitur
                                                                              .value
                                                                              .agunan!
                                                                              .firstWhere((element) => element.kodeAgunan == 3)
                                                                              .id!,
                                                                          'agunan_kendaraan');
                                                                    },
                                                                    btnOkText:
                                                                        'Oke sip',
                                                                    btnCancelText:
                                                                        'Affa iyh',
                                                                    btnCancelOnPress:
                                                                        () {})
                                                                .show()
                                                          }),
                                                      backgroundColor:
                                                          GFColors.DANGER,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: FontAwesomeIcons
                                                          .trash,
                                                      label: 'Hapus',
                                                    ),
                                                  ],
                                                ),
                                                child: Obx(() => controller
                                                        .isAgunanInputProcessing
                                                        .value
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )
                                                    : FormBuilderCheckbox(
                                                        name:
                                                            'agunan_kendaraan',
                                                        enabled: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        3)
                                                                    .isEmpty ==
                                                                true
                                                            ? true
                                                            : false,
                                                        activeColor:
                                                            primaryColor,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              const OutlineInputBorder(),
                                                          filled: true,
                                                          fillColor: controller
                                                                      .debiturController
                                                                      .insightDebitur
                                                                      .value
                                                                      .agunan
                                                                      ?.where((element) =>
                                                                          element
                                                                              .kodeAgunan ==
                                                                          3)
                                                                      .isEmpty ==
                                                                  true
                                                              ? GFColors.FOCUS
                                                              : GFColors
                                                                  .SUCCESS,
                                                        ),
                                                        title: Text(
                                                          'Kendaraan',
                                                          style: checkboxStyle,
                                                        ),
                                                        initialValue: controller
                                                                    .debiturController
                                                                    .insightDebitur
                                                                    .value
                                                                    .agunan
                                                                    ?.where((element) =>
                                                                        element
                                                                            .kodeAgunan ==
                                                                        3)
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
                                                                            3,
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
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              'Berikut adalah jenis agunan yang tersedia untuk plafond dibawah atau sama dengan Rp. 100.000.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.merge(const TextStyle(fontSize: 14)),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Slidable(
                              enabled: controller.debiturController
                                          .insightDebitur.value.agunan
                                          ?.where((element) =>
                                              element.kodeAgunan == 7)
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
                                                  dialogType:
                                                      DialogType.question,
                                                  animType:
                                                      AnimType.bottomSlide,
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
                                                                7)
                                                            .id!,
                                                        'agunan_lainnya');
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
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : FormBuilderCheckbox(
                                      name: 'agunan_lainnya',
                                      enabled: controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.where((element) =>
                                                      element.kodeAgunan == 7)
                                                  .isEmpty ==
                                              true
                                          ? true
                                          : false,
                                      activeColor: primaryColor,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        filled: true,
                                        fillColor: controller.debiturController
                                                    .insightDebitur.value.agunan
                                                    ?.where((element) =>
                                                        element.kodeAgunan == 7)
                                                    .isEmpty ==
                                                true
                                            ? GFColors.FOCUS
                                            : GFColors.SUCCESS,
                                      ),
                                      title: Text(
                                        'Lainnya',
                                        style: checkboxStyle,
                                      ),
                                      initialValue: controller.debiturController
                                                  .insightDebitur.value.agunan
                                                  ?.where((element) =>
                                                      element.kodeAgunan == 7)
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
                                                          7,
                                                    ),
                                                  ) ==
                                                  true
                                              ? true
                                              : false,
                                    )),
                            )
                          ],
                        ),
                ],
              ),

              Obx(() => GFButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
                        controller.saveMultipleAgunan();
                        // controller.patchProgressBar(data.id);
                        // Get.back();
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                      } else {
                        debugPrint(
                            controller.formKey.currentState?.value.toString());
                        debugPrint('validation failed');
                      }
                    },
                    color: primaryColor,
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                    child: controller.isAgunanInputProcessing.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Simpan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
