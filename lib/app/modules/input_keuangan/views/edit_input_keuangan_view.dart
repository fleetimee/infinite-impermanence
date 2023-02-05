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

class EditInputKeuanganView extends GetView<InputKeuanganController> {
  EditInputKeuanganView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Edit Keuangan',
        ),
      ),
      body: FormBuilder(
        key: controller.formKey,
        autoFocusOnValidationFailure: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
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
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    'Data Keuangan',
                                    style: GoogleFonts.poppins(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Animate(
                                    child: SizedBox(
                                  height: 170,
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
                                      prefixIcon:
                                          const Icon(FontAwesomeIcons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                      prefixIcon:
                                          const Icon(FontAwesomeIcons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  controller.deskripsiKredit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.merge(
                                        const TextStyle(
                                          fontSize: 14,
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
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                        controller:
                                            controller.kreditYangDiusulkan =
                                                MoneyMaskedTextController(
                                          decimalSeparator: '',
                                          thousandSeparator: '.',
                                          precision: 0,
                                          initialValue: double.parse(data
                                              .inputKeuangan.kreditDiusulkan
                                              .toString()),
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Kredit Diusulkan',
                                          prefixText: 'Rp. ',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              errorText: 'Harus diisi'),
                                          FormBuilderValidators.maxLength(3,
                                              errorText: 'Max 3 digit'),
                                        ]),
                                        controller:
                                            controller.angsuranPerBulan =
                                                TextEditingController(
                                          text: data.inputKeuangan.angsuran
                                              .toString(),
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Jangka Waktu (bln)',
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
                                Text(
                                  controller.bungaDeskripsi,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.merge(
                                        const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
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
                                  controller: controller.bungaPerTahun =
                                      TextEditingController(
                                          text: data.inputKeuangan.bungaPerTahun
                                              .toString()),
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
                                        controller: controller.provisi =
                                            TextEditingController(
                                          text: data.inputKeuangan.provisi
                                              .toString(),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator:
                                            FormBuilderValidators.compose([
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                        initialValue: data
                                            .inputKeuangan.sistemAngsuran
                                            .toString(),
                                        validator:
                                            FormBuilderValidators.required(),
                                        onChanged: (value) {
                                          controller.sistemAngsuran =
                                              value.toString();
                                        },
                                        onSaved: (value) {
                                          controller.sistemAngsuran =
                                              value.toString();
                                        },
                                        items: controller.sistemAngsuranList
                                            .map(
                                              (element) => DropdownMenuItem(
                                                value: element,
                                                child: Text(element),
                                              ),
                                            )
                                            .toList(),
                                        decoration: InputDecoration(
                                          labelText: 'Sistem Angsuran',
                                          hintText: 'Pilih..',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Text(
                                  controller.digunakan,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.merge(const TextStyle(fontSize: 14)),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                FormBuilderDropdown<String>(
                                  name: 'digunakan_untuk',
                                  initialValue: data
                                      .inputKeuangan.digunakanUntuk
                                      .toString(),
                                  onChanged: (value) {
                                    controller.digunakanUntuk = value!;
                                  },
                                  onSaved: (value) {
                                    controller.digunakanUntuk = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Digunakan Untuk',
                                    hintText: 'Pilih..',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: controller.digunakanUntukList
                                      .map(
                                        (element) => DropdownMenuItem(
                                          value: element,
                                          child: Text(element),
                                        ),
                                      )
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Text(controller.totalAngsuranDeskripsi,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.merge(const TextStyle(fontSize: 14))),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                FormBuilderTextField(
                                  name: 'angsuran_rp',
                                  readOnly: true,
                                  controller: controller.totalAngsuran =
                                      MoneyMaskedTextController(
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    precision: 0,
                                    initialValue: double.parse(data
                                        .inputKeuangan.angsuranRp
                                        .toString()),
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Angsuran (Rp)',
                                    prefixIcon:
                                        const Icon(FontAwesomeIcons.rupiahSign),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                            GFButton(
                              onPressed: () {
                                if (controller.formKey.currentState
                                        ?.saveAndValidate() ??
                                    false) {
                                  controller.mothlyPaymentCalculation();
                                  debugPrint(controller
                                      .formKey.currentState?.value
                                      .toString());
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
                                } else {
                                  debugPrint(controller
                                      .formKey.currentState?.value
                                      .toString());
                                  debugPrint('validation failed');
                                }
                              },
                              text: 'Hitung Angsuran Tetap',
                              size: GFSize.LARGE,
                              fullWidthButton: true,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
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
                                child: SizedBox(
                              height: 170,
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
                              height: 8.0,
                            ),
                            Text(controller.keuanganKini,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.merge(const TextStyle(fontSize: 14))),
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
                                  borderRadius: BorderRadius.circular(8),
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
                                initialValue: double.parse(
                                  data.inputKeuangan.biayaBahanKini.toString(),
                                ),
                              ),
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya bahan HPP',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                                  borderRadius: BorderRadius.circular(8),
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
                                  borderRadius: BorderRadius.circular(8),
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
                                  borderRadius: BorderRadius.circular(8),
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
                              height: 8.0,
                            ),
                            Text(controller.asumsi,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.merge(const TextStyle(fontSize: 14))),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'penjualan_asumsi',
                              controller: controller.penjualanYad =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputKeuangan.penjualanAsumsi),
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                prefixText: 'Rp. ',
                                labelText: 'Penjualan YAD',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_bahan_asumsi',
                              controller: controller.biayaBahanYad =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputKeuangan.biayaBahanAsumsi),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya bahan HPP YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_upah_asumsi',
                              controller: controller.biayaUpahYad =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputKeuangan.biayaUpahAsumsi),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Upah YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_operasional_asumsi',
                              controller: controller.biayaOperasionalYad =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputKeuangan.biayaOperasionalAsumsi),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Operasional YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FormBuilderTextField(
                              readOnly: true,
                              name: 'biaya_hidup_asumsi',
                              controller: controller.biayaHidupYad =
                                  MoneyMaskedTextController(
                                decimalSeparator: '',
                                thousandSeparator: '.',
                                precision: 0,
                                initialValue: double.parse(
                                    data.inputKeuangan.biayaHidupAsumsi),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Biaya Hidup YAD',
                                prefixText: 'Rp. ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Text(
                                  'Interest',
                                  style: GoogleFonts.poppins(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Visibility(
                                maintainState: true,
                                visible: false,
                                child: FormBuilderDropdown(
                                  name: 'sistem_angsuran',
                                  initialValue: data
                                      .inputKeuangan.sistemAngsuran
                                      .toString(),
                                  validator: FormBuilderValidators.required(),
                                  onChanged: (value) {
                                    controller.sistemAngsuran =
                                        value.toString();
                                  },
                                  onSaved: (value) {
                                    controller.sistemAngsuran =
                                        value.toString();
                                  },
                                  items: controller.sistemAngsuranList
                                      .map(
                                        (element) => DropdownMenuItem(
                                          value: element,
                                          child: Text(element),
                                        ),
                                      )
                                      .toList(),
                                  decoration: InputDecoration(
                                    labelText: 'Sistem Angsuran',
                                    hintText: 'Pilih..',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                maintainState: true,
                                visible: false,
                                child: FormBuilderDropdown<String>(
                                  name: 'digunakan_untuk',
                                  initialValue: data
                                      .inputKeuangan.digunakanUntuk
                                      .toString(),
                                  onChanged: (value) {
                                    controller.digunakanUntuk = value!;
                                  },
                                  onSaved: (value) {
                                    controller.digunakanUntuk = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Digunakan Untuk',
                                    hintText: 'Pilih..',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: controller.digunakanUntukList
                                      .map(
                                        (element) => DropdownMenuItem(
                                          value: element,
                                          child: Text(element),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              Animate(
                                  child: SizedBox(
                                height: 170,
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
                                height: 10.0,
                              ),
                              Text(
                                controller.interestTop,
                                style:
                                    Theme.of(context).textTheme.bodySmall?.merge(
                                          const TextStyle(
                                            fontSize: 14.0,
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
                                              BorderRadius.circular(8),
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
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(controller.tradeCycleDesc,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.merge(const TextStyle(
                                        fontSize: 14.0,
                                      ))),
                              const SizedBox(
                                height: 16.0,
                              ),
                              FormBuilderTextField(
                                name: 'trade_cycle',
                                controller: controller.tradeCycle =
                                    TextEditingController(
                                  text:
                                      data.inputKeuangan.tradeCycle.toString(),
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Trade Cycle',
                                  prefixIcon:
                                      const Icon(FontAwesomeIcons.arrowsRotate),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                                controller
                                    .updateKeuangan(data.inputKeuangan.id);
                                Get.back();
                              }
                            },
                            text: 'Update',
                            color: primaryColor,
                            size: GFSize.LARGE,
                            fullWidthButton: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
