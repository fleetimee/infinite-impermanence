// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class AsumsiKeuangan extends StatelessWidget {
  AsumsiKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  // TODO: Lanjut disini
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 220),
            child: Text(
              'a. Omzet/Bulan',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'omzet_kini',
            readOnly: true,
            controller: controller.omzetKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.penjualanKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Omzet Kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            readOnly: true,
            controller: controller.omzetYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.penjualanAsumsi),
            ),
            name: 'omzet_yad',
            decoration: const InputDecoration(
              labelText: 'Omzet YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.omzetKiniPercent,
                  name: 'persentase_omzet_kini',
                  readOnly: true,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: '% Omzet Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.omzetYADPercent,
                  readOnly: true,
                  name: 'persentase_omzet_yad',
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: '% Omzet YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 120),
            child: Text(
              'b. Biaya bahan (HPP)/bulan',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'biaya_bahan_kini',
            readOnly: true,
            controller: controller.biayaBahanKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaBahanKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya bahan kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'biaya_bahan_yad',
            readOnly: true,
            controller: controller.biayaBahanYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaBahanAsumsi),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya Bahan YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'persentase_biaya_bahan_kini',
                  controller: controller.biayaBahanKiniPercent,
                  readOnly: true,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'persentase_biaya_bahan_yad',
                  textAlign: TextAlign.right,
                  controller: controller.biayaBahanYADPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 240),
            child: Text(
              'c. Upah/bulan',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'upah_kini',
            readOnly: true,
            controller: controller.upahKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaUpahKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Upah Kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            controller: controller.upahYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaUpahAsumsi),
            ),
            name: 'upah_yad',
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Upah YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.upahKiniPercent,
                  readOnly: true,
                  name: 'persentase_upah_kini',
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: '% Upah Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.upahYADPercent,
                  readOnly: true,
                  name: 'persentase_upah_yad',
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: '% Upah YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'd. Biaya operasi (BBM, Listrik, Air, dsb)',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_operasi_kini',
            readOnly: true,
            controller: controller.biayaOperasiKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue:
                  double.parse(data.inputKeuangan.biayaOperasionalKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya operasi Kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_operasi_yad',
            readOnly: true,
            controller: controller.biayaOperasiYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue:
                  double.parse(data.inputKeuangan.biayaOperasionalAsumsi),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya operasi YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_operasi_kini',
                  textAlign: TextAlign.right,
                  controller: controller.biayaOperasiKiniPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_operasi_yad',
                  textAlign: TextAlign.right,
                  controller: controller.biayaOperasiYADPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'e. Biaya hidup (gaji pemilik)/bulan',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_hidup_kini',
            readOnly: true,
            controller: controller.biayaHidupKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaHidupKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya hidup Kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_hidup_yad',
            readOnly: true,
            controller: controller.biayaHidupYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaHidupAsumsi),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya hidup YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_hidup_kini',
                  textAlign: TextAlign.right,
                  controller: controller.biayaHidupKiniPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_hidup_yad',
                  textAlign: TextAlign.right,
                  controller: controller.biayaHidupYADPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GFButton(
            onPressed: () {
              controller.hitungPersentasiOtomatis();

              showToast(
                '👀 Persentase berhasil dihitung 👀',
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
            text: 'Get Percent',
            color: primaryColor,
            size: GFSize.LARGE,
            fullWidthButton: true,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Laba Usaha',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' laba_usaha_kini',
            controller: controller.labaUsahaKini,
            decoration: const InputDecoration(
              labelText: 'Laba Usaha Kini',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' laba_usaha_yad',
            controller: controller.labaUsahaYAD,
            decoration: const InputDecoration(
              labelText: 'Laba Usaha YAD',
              border: OutlineInputBorder(),
              prefixText: 'Rp. ',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_laba_usaha_kini',
                  textAlign: TextAlign.right,
                  controller: controller.labaUsahaKiniPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha Kini',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_laba_usaha_yad',
                  textAlign: TextAlign.right,
                  controller: controller.labaUsahaYADPercent,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha YAD',
                    border: OutlineInputBorder(),
                    suffixText: '%',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: GFButton(
                  onPressed: () {
                    controller.hitungTotalLaba();
                    showToast(
                      '👀 Laba Rupiah Berhasil Dihitung 👀',
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
                  text: 'Hitung Total Laba',
                  color: primaryColor,
                  size: GFSize.LARGE,
                  fullWidthButton: true,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GFButton(
                  onPressed: () {
                    controller.hitungTotalPersentasi();
                    showToast(
                      '👀 Persentase Laba Berhasil Dihitung 👀',
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
                  text: 'Hitung Persentase Laba',
                  color: primaryColor,
                  size: GFSize.LARGE,
                  fullWidthButton: true,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
