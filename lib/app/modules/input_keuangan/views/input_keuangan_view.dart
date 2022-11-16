// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/input_keuangan_controller.dart';

class InputKeuanganView extends GetView<InputKeuanganController> {
  InputKeuanganView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Keuangan',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Data Keuangan'),
                  Tab(text: 'Asumsi'),
                  Tab(text: 'Interest'),
                ],
              ),
            ),
            Expanded(
              child: FormBuilder(
                key: controller.formKey,
                autoFocusOnValidationFailure: true,
                autovalidateMode: AutovalidateMode.disabled,
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Data Keuangan',
                              style: GoogleFonts.poppins(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Animate(
                                child: const GFCard(
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              showOverlayImage: true,
                              imageOverlay: AssetImage(
                                'assets/images/home/bannerr.jpg',
                              ),
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
                                        duration: 600
                                            .ms) // runs after the above w/new duration
                                // inherits the delay & duration from move,
                                ),
                            Visibility(
                              visible: false,
                              child: FormBuilderTextField(
                                name: 'debitur_id',
                                enabled: false,
                                controller: controller.debitur =
                                    TextEditingController(
                                  text: data.id.toString(),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Debitur ID',
                                  prefixText: 'Rp. ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Visibility(
                              visible: false,
                              child: FormBuilderTextField(
                                name: 'rugi_laba_id',
                                enabled: false,
                                controller: controller.rugiLaba =
                                    TextEditingController(
                                  text: data.inputRugiLaba.id.toString(),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Rugi Laba ID',
                                  prefixText: 'Rp. ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: FormBuilderTextField(
                                    name: 'kredit_diusulkan',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    controller: controller.kreditYangDiusulkan,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Kredit Diusulkan',
                                      prefixText: 'Rp. ',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'angsuran',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: 'Harus diisi'),
                                      FormBuilderValidators.maxLength(3,
                                          errorText: 'Max 3 digit'),
                                    ]),
                                    controller: controller.angsuranPerBulan,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Jangka Waktu (bln)',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'bunga_per_tahun',
                              textAlign: TextAlign.right,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Harus diisi'),
                                FormBuilderValidators.numeric(),
                                FormBuilderValidators.min(0),
                                FormBuilderValidators.max(500),
                                FormBuilderValidators.maxLength(3,
                                    errorText: 'Max 3 digit'),
                              ]),
                              controller: controller.bungaPerTahun,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Bunga per tahun',
                                suffixText: '%',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'provisi',
                                    textAlign: TextAlign.right,
                                    controller: controller.provisi,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: 'Harus diisi'),
                                      FormBuilderValidators.numeric(),
                                      FormBuilderValidators.min(0),
                                      FormBuilderValidators.max(500),
                                      FormBuilderValidators.maxLength(3,
                                          errorText: 'Max 3 digit'),
                                    ]),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Provisi %',
                                      suffixText: '%',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: FormBuilderDropdown(
                                    name: 'sistem_angsuran',
                                    onChanged: (value) {
                                      controller.sistemAngsuran =
                                          value.toString();
                                      debugPrint(value.toString());
                                    },
                                    onSaved: (value) {
                                      controller.sistemAngsuran =
                                          value.toString();
                                      debugPrint(value.toString());
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Sistem Angsuran',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: [
                                      'Efektif',
                                      'Flat',
                                    ]
                                        .map(
                                          (val) => DropdownMenuItem(
                                            value: val,
                                            child: Text(val),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderDropdown<String>(
                              name: 'digunakan_untuk',
                              items: controller.digunakanUntukList
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (value) {
                                controller.digunakanUntuk = value!;
                              },
                              onSaved: (value) {
                                controller.digunakanUntuk = value!;
                              },
                              decoration: InputDecoration(
                                labelText: 'Digunakan Untuk',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'angsuran_rp',
                              readOnly: true,
                              controller: controller.totalAngsuran,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Angsuran (Rp)',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            GFButton(
                              onPressed: () {
                                controller.mothlyPaymentCalculation();
                                showToast(
                                  'Angsuran per bulan: Rp. ${controller.totalAngsuran.text}',
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
                              text: 'Hitung Angsuran Tetap',
                              size: GFSize.LARGE,
                              fullWidthButton: true,
                              color: primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Text(
                                'Asumsi Keuangan',
                                style: GoogleFonts.poppins(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Animate(
                                child: const GFCard(
                              boxFit: BoxFit.cover,
                              titlePosition: GFPosition.start,
                              showOverlayImage: true,
                              imageOverlay: AssetImage(
                                'assets/images/home/bannerr.jpg',
                              ),
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
                                        duration: 600
                                            .ms) // runs after the above w/new duration
                                // inherits the delay & duration from move,
                                ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 250),
                              child: Text(
                                'Keuangan Kini',
                                style: GoogleFonts.poppins(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'penjualan',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              readOnly: true,
                              controller: controller.penjualanKini =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue:
                                    double.parse(data.inputRugiLaba.omzet),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                prefixText: 'Rp. ',
                                labelText: 'Penjualan per bulan',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'biaya_bahan',
                              controller: controller.biayaBahanKini =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue:
                                    double.parse(data.inputRugiLaba.hargaPokok),
                              ),
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya bahan HPP',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'biaya_upah',
                              readOnly: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              controller: controller.biayaUpahKini =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputRugiLaba.biayaTenagaKerja),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Upah',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'biaya_operasional',
                              readOnly: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              controller: controller.biayaOperasionalKini =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputRugiLaba.biayaOperasional),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Operasional',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              name: 'biaya_hidup',
                              readOnly: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              controller: controller.biayaHidupKini =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue:
                                    double.parse(data.inputRugiLaba.biayaHidup),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Hidup',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 320),
                              child: Text(
                                'Asumsi',
                                style: GoogleFonts.poppins(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'penjualan_asumsi',
                              controller: controller.penjualanYad,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                prefixText: 'Rp. ',
                                labelText: 'Penjualan YAD',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_bahan_asumsi',
                              controller: controller.biayaBahanYad,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya bahan HPP YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_upah_asumsi',
                              controller: controller.biayaUpahYad,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Upah YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_operasional_asumsi',
                              controller: controller.biayaOperasionalYad,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Operasional YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_hidup_asumsi',
                              controller: controller.biayaHidupYad,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Hidup YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 35.0,
                            ),
                            GFButton(
                              onPressed: () {
                                controller.hitungAsumsiPenjualan();
                                showToast(
                                  'Asumsi Penjualan Berhasil Dihitung',
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
                              text: 'Hitung Asumsi',
                              color: primaryColor,
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Interest',
                                style: GoogleFonts.poppins(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Animate(
                                  child: const GFCard(
                                boxFit: BoxFit.cover,
                                titlePosition: GFPosition.start,
                                showOverlayImage: true,
                                imageOverlay: AssetImage(
                                  'assets/images/home/bannerr.jpg',
                                ),
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
                                          duration: 600
                                              .ms) // runs after the above w/new duration
                                  // inherits the delay & duration from move,
                                  ),
                              Row(
                                children: [
                                  Expanded(
                                    child: FormBuilderTextField(
                                      name: 'bunga_per_tahun_int',
                                      readOnly: true,
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.number,
                                      controller: controller.bungaPerTahun,
                                      decoration: InputDecoration(
                                        labelText: 'Bunga per tahun',
                                        suffixText: '%',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: FormBuilderTextField(
                                      readOnly: true,
                                      name: 'jangka_waktu',
                                      controller: controller.angsuranPerBulan,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Jangka Waktu',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              FormBuilderTextField(
                                name: 'trade_cycle',
                                controller: controller.tradeCycle,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Trade Cycle',
                                  prefixIcon:
                                      const Icon(FontAwesomeIcons.arrowsRotate),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                            ],
                          ),
                          GFButton(
                            onPressed: () {
                              if (controller.formKey.currentState
                                      ?.saveAndValidate() ??
                                  false) {
                                controller.saveKeuangan();
                                // controller.patchProgressBar(data.id);
                                Get.back();
                              } else {
                                debugPrint('validation failed');
                              }
                            },
                            text: 'Submit',
                            fullWidthButton: true,
                            size: GFSize.LARGE,
                            color: primaryColor,
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
    );
  }
}
