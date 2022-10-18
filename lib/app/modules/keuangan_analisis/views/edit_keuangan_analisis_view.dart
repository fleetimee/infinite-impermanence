// 🐦 Flutter imports:
// ignore_for_file: unused_field

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/keuangan_analisis/views/components/edit/edit_analisa_ratio.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/edit/edit_angsuran.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/edit/edit_asumsi_keuangan.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/edit/edit_data_keuangan.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/input/tutorial.dart';
import '../../../common/style.dart';
import '../controllers/keuangan_analisis_controller.dart';

class EditLihatKeuanganAnalisisView
    extends GetView<KeuanganAnalisisController> {
  EditLihatKeuanganAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing: ${data.peminjam1}'),
        actions: [
          IconButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Tutorial();
                  },
                );
              },
              icon: const Icon(
                Icons.help_outline,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: primaryColor,
                  ),
                  isScrollable: true,

                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Data Keuangan'),
                    Tab(text: 'Angsuran'),
                    Tab(text: 'Asumsi Keuangan'),
                    Tab(text: 'Analisa Ratio'),
                    Tab(text: 'Summary'),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: FormBuilder(
                  key: controller.formKeyAnalisaKeuangan,
                  onChanged: () {
                    debugPrint(controller
                        .formKeyAnalisaKeuangan.currentState!.value
                        .toString());
                  },
                  autovalidateMode: AutovalidateMode.always,
                  autoFocusOnValidationFailure: true,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      EditDataKeuangan(),
                      EditAngsuran(),
                      EditAsumsiKeuangan(),
                      EditAnalisaRatio(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FormBuilderTextField(
                              name: 'pinjaman_maksimal',
                              controller: controller.pinjamanMaksimal,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Pinjaman Maksimal',
                                border: OutlineInputBorder(),
                                prefixText: 'Rp. ',
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'perhitungan_investasi',
                              controller: controller.perhitunganModalKerja,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: data.inputKeuangan.digunakanUntuk ==
                                        'Modal Kerja'
                                    ? 'Perhitungan Modal Kerja'
                                    : 'Perhitungan Investasi',
                                border: const OutlineInputBorder(),
                                prefixText: 'Rp. ',
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'trade_cycle',
                              controller: controller.tradeCycle =
                                  TextEditingController(
                                      text: data.inputKeuangan.tradeCycle
                                          .toString()),
                              readOnly: true,
                              decoration: const InputDecoration(
                                  labelText: 'Trade Cycle',
                                  border: OutlineInputBorder(),
                                  prefixText: 'Rp. '),
                            ),
                            FormBuilderTextField(
                              name: 'kebutuhan_investasi',
                              controller: controller.kebutuhanInvestasi,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText:
                                      data.inputKeuangan.digunakanUntuk ==
                                              'Modal Kerja'
                                          ? 'Perhitungan Modal Kerja'
                                          : 'Perhitungan Investasi',
                                  border: const OutlineInputBorder(),
                                  prefixText: 'Rp. '),
                            ),
                            FormBuilderTextField(
                              name: 'kebutuhan_kredit',
                              controller: controller.kebutuhanKredit,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Kebutuhan Kredit',
                                border: OutlineInputBorder(),
                                prefixText: 'Rp. ',
                              ),
                            ),
                            GFButton(
                              onPressed: () {
                                controller.hitungSemua();
                                showToast(
                                  '👀 Berhasil dihitung semua',
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor,
                                  ),
                                  context: context,
                                  animation: StyledToastAnimation.scale,
                                  reverseAnimation: StyledToastAnimation.fade,
                                  position: StyledToastPosition.center,
                                  animDuration: const Duration(seconds: 1),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.linear,
                                );
                              },
                              text: 'Hitung Semua',
                              color: primaryColor,
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: FormBuilderTextField(
                                    controller: controller.kreditYangDiminta =
                                        MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                          data.inputKeuangan.kreditDiusulkan),
                                    ),
                                    readOnly: true,
                                    name: 'kredit_yang_diminta',
                                    decoration: const InputDecoration(
                                      labelText: 'Plafon',
                                      border: OutlineInputBorder(),
                                      prefixText: 'Rp. ',
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Obx(
                                    () {
                                      return controller
                                              .isVerificationButtonPressed.value
                                          ? controller.isKreditPassed.isTrue
                                              ? const Icon(
                                                  Icons.check_box,
                                                  color: Colors.green,
                                                  size: 35,
                                                )
                                              : const Icon(
                                                  Icons.close_outlined,
                                                  color: Colors.red,
                                                  size: 35,
                                                )
                                          : const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            GFButton(
                              onPressed: () {
                                controller.checkIfCreditPassed();
                                showToast(
                                  'Status: ${controller.isKreditPassed.isTrue ? 'Lulus' : 'Gagal'}',
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: secondaryColor,
                                  ),
                                  context: context,
                                  animation: StyledToastAnimation.scale,
                                  reverseAnimation: StyledToastAnimation.fade,
                                  position: StyledToastPosition.center,
                                  animDuration: const Duration(seconds: 1),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.elasticOut,
                                  reverseCurve: Curves.linear,
                                );
                              },
                              text: 'Verifikasi Kredit',
                              color: primaryColor,
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            GFButton(
                              onPressed: () {
                                showBarModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    controller.hitungCrr();
                                    return Container(
                                        height: 450,
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Center(
                                              child: Text(
                                                'Yeay berhasil mengubah',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ),
                                            const Center(
                                              child: Text(
                                                'CRR Keuangan 🎉🎉🎉',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Center(
                                              child: GFImageOverlay(
                                                height: 200,
                                                width: 350,
                                                shape: BoxShape.rectangle,
                                                image: AssetImage(
                                                    'assets/images/home/tohru-okay.gif'),
                                                boxFit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text(
                                                'Total CRR : ${controller.crr.text}',
                                                style: GoogleFonts.spaceGrotesk(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            GFButton(
                                              onPressed: () {
                                                if (controller
                                                        .formKeyAnalisaKeuangan
                                                        .currentState
                                                        ?.saveAndValidate() ??
                                                    false) {
                                                  controller
                                                      .updateAnalisisKeuangan(
                                                          data.analisaKeuangan
                                                              .id);
                                                  Get.back();
                                                  Get.back();
                                                } else {
                                                  debugPrint(
                                                      'validation failed');
                                                }
                                              },
                                              text: 'Update',
                                              color: primaryColor,
                                              fullWidthButton: true,
                                              size: GFSize.LARGE,
                                            ),
                                          ],
                                        ));
                                  },
                                  backgroundColor: secondaryColor,
                                  bounce: true,
                                );
                              },
                              text: 'Lihat Hasil',
                              color: primaryColor,
                              fullWidthButton: true,
                              size: GFSize.LARGE,
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
      ),
    );
  }
}
