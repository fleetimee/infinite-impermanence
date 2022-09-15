// 🐦 Flutter imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

class ViewAsumsiKeuangan extends StatelessWidget {
  ViewAsumsiKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

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
            enabled: false,
            controller: controller.omzetKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.penjualanKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Omzet Kini',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            readOnly: true,
            enabled: false,
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
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Omzet Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.omzetYADPercent,
                  enabled: false,
                  name: 'persentase_omzet_yad',
                  decoration: const InputDecoration(
                    labelText: '% Omzet YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
            enabled: false,
            controller: controller.biayaBahanKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaBahanKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya bahan kini',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'biaya_bahan_yad',
            enabled: false,
            controller: controller.biayaBahanYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaBahanAsumsi),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya Bahan YAD',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  controller: controller.biayaBahanKiniPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaBahanKini.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'persentase_biaya_bahan_yad',
                  controller: controller.biayaBahanYADPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaBahanYad.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
            enabled: false,
            controller: controller.upahKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaUpahKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Upah Kini',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Upah YAD',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  controller: controller.upahKiniPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaUpahKini.toString(),
                  ),
                  enabled: false,
                  name: 'persentase_upah_kini',
                  decoration: const InputDecoration(
                    labelText: '% Upah Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.upahYADPercent = TextEditingController(
                    text: data.analisaKeuangan.persenBiayaUpahYad.toString(),
                  ),
                  enabled: false,
                  name: 'persentase_upah_yad',
                  decoration: const InputDecoration(
                    labelText: '% Upah YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
            enabled: false,
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
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_operasi_yad',
            enabled: false,
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
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  controller: controller.biayaOperasiKiniPercent =
                      TextEditingController(
                    text:
                        data.analisaKeuangan.persenBiayaOperasiKini.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_operasi_yad',
                  controller: controller.biayaOperasiYADPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaOperasiYad.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
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
            enabled: false,
            controller: controller.biayaHidupKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaHidupKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya hidup Kini',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' biaya_hidup_yad',
            enabled: false,
            controller: controller.biayaHidupYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue: double.parse(data.inputKeuangan.biayaHidupAsumsi),
            ),
            decoration: const InputDecoration(
              labelText: 'Biaya hidup YAD',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  controller: controller.biayaHidupKiniPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaHidupKini.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_biaya_hidup_yad',
                  controller: controller.biayaHidupYADPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenBiayaHidupYad.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // colorButton(context, 'Dapatkan Persentase', () {
          //   controller.hitungPersentasiOtomatis();
          // }),

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
            enabled: false,
            controller: controller.labaUsahaKini = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue:
                  double.parse(data.analisaKeuangan.totalLabaUsahaKini),
            ),
            decoration: const InputDecoration(
              labelText: 'Laba Usaha Kini',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: ' laba_usaha_yad',
            enabled: false,
            controller: controller.labaUsahaYAD = MoneyMaskedTextController(
              decimalSeparator: '',
              thousandSeparator: '.',
              precision: 0,
              initialValue:
                  double.parse(data.analisaKeuangan.totalLabaUsahaYad),
            ),
            decoration: const InputDecoration(
              labelText: 'Laba Usaha YAD',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                  controller: controller.labaUsahaKiniPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenLabaUsahaKini.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha Kini',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: ' persentase_laba_usaha_yad',
                  controller: controller.labaUsahaYADPercent =
                      TextEditingController(
                    text: data.analisaKeuangan.persenLabaUsahaYad.toString(),
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha YAD',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),

          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
