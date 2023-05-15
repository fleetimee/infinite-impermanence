// 🐦 Flutter imports:
// ignore_for_file: unused_field

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/keuangan_analisis_controller.dart';
import 'components/views/view_analisa_ratio.dart';
import 'components/views/view_angsuran.dart';
import 'components/views/view_asumsi_keuangan.dart';
import 'components/views/view_data_keuangan.dart';

class LihatKeuanganAnalisisView extends GetView<KeuanganAnalisisController> {
  LihatKeuanganAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisis Keuangan: ${data.peminjam1}'),
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      title: 'Konfirmasi',
                      bodyHeaderDistance: 25,
                      desc: 'Apakah yakin untuk menghapus item ini ?',
                      btnOkOnPress: () {
                        controller
                            .deleteAnalisisKeuangan(data.analisaKeuangan.id);
                        // controller.purgeProgressBar(data.id);
                        Get.back();
                      },
                      btnOkText: 'Oke sip',
                      btnCancelText: 'Affa iyh',
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidTrashCan,
            ),
          )
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
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      ViewDataKeuangan(),
                      ViewAngsuran(),
                      ViewAsumsiKeuangan(),
                      ViewAnalisaRatio(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FormBuilderTextField(
                              name: 'pinjaman_maksimal',
                              controller: controller.pinjamanMaksimal =
                                  MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        data.analisaKeuangan.pinjamanMaksimal,
                                      )),
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Pinjaman Maksimal',
                                border: OutlineInputBorder(),
                                prefixText: 'Rp. ',
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'perhitungan_investasi',
                              controller: controller.perhitunganModalKerja =
                                  MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        data.analisaKeuangan
                                            .perhitunganModalKerja,
                                      )),
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
                                  prefixIcon:
                                      Icon(FontAwesomeIcons.arrowsRotate)),
                            ),
                            FormBuilderTextField(
                              name: 'kebutuhan_investasi',
                              controller: controller.kebutuhanInvestasi =
                                  MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        data.analisaKeuangan.kebutuhanInvestasi,
                                      )),
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
                              controller: controller.kebutuhanKredit =
                                  MoneyMaskedTextController(
                                      decimalSeparator: '',
                                      thousandSeparator: '.',
                                      precision: 0,
                                      initialValue: double.parse(
                                        data.analisaKeuangan.kebutuhanKredit,
                                      )),
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Kebutuhan Kredit',
                                border: OutlineInputBorder(),
                                prefixText: 'Rp. ',
                              ),
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
                                  child:
                                      data.analisaKeuangan.kreditDisetujuin ==
                                              true
                                          ? const Icon(
                                              FontAwesomeIcons.circleCheck,
                                              color: Colors.green,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.circleXmark,
                                              color: Colors.red,
                                            ),
                                ),
                              ],
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
                                                'Berikut adalah',
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
                                            Center(
                                              child: Lottie.asset(
                                                'assets/images/home/keuangan_promp.zip',
                                                frameRate: FrameRate.max,
                                                height: 280,
                                                fit: BoxFit.cover,
                                                repeat: true,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return const Text(
                                                    'Gagal memuat animasi',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text(
                                                'Total CRR : ${data.analisaKeuangan.totalCrrKeuangan.toString()}',
                                                style: GoogleFonts.spaceGrotesk(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                  backgroundColor: secondaryColor,
                                  bounce: true,
                                );
                              },
                              text: 'Cek CRR',
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
