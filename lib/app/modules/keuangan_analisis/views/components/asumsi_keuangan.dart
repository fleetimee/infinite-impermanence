import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/widget/color_button.dart';

class AsumsiKeuangan extends StatelessWidget {
  AsumsiKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

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
            name: 'Omzet Kini',
            controller: controller.omzetKini,
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
            controller: controller.omzetYAD,
            name: 'Omzet Dari Tahun Lalu',
            decoration: const InputDecoration(
              labelText: 'Omzet Dari Tahun Lalu',
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
                  name: '% Omzet Kini',
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Omzet Kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
                  name: '% Omzet YAD',
                  decoration: const InputDecoration(
                    labelText: '% Omzet YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
            name: 'Biaya bahan kini',
            controller: controller.biayaBahanKini,
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
            name: 'Biaya Bahan Tahun Lalu',
            controller: controller.biayaBahanYAD,
            decoration: const InputDecoration(
              labelText: 'Biaya Bahan Tahun Lalu',
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
                  name: '% Biaya Bahan Kini',
                  controller: controller.biayaBahanKiniPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: '% Biaya YAD',
                  controller: controller.biayaBahanYADPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya bahan YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
            name: 'Upah Kini',
            controller: controller.upahKini,
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
            controller: controller.upahYAD,
            name: 'Upah Dari Tahun Lalu',
            decoration: const InputDecoration(
              labelText: 'Upah Dari Tahun Lalu',
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
                  controller: controller.upahKiniPercent,
                  enabled: false,
                  name: '% Upah Kini',
                  decoration: const InputDecoration(
                    labelText: '% Upah Kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.upahYADPercent,
                  enabled: false,
                  name: '% Upah YAD',
                  decoration: const InputDecoration(
                    labelText: '% Upah YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
            name: 'Biaya operasi Kini',
            controller: controller.biayaOperasiKini,
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
            name: 'Biaya operasi Dari Tahun Lalu',
            controller: controller.biayaOperasiYAD,
            decoration: const InputDecoration(
              labelText: 'Biaya operasi Dari Tahun Lalu',
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
                  name: '% Biaya operasi Kini',
                  controller: controller.biayaOperasiKiniPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi Kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: '% Biaya operasi YAD',
                  controller: controller.biayaOperasiYADPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya operasi YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
            name: 'Biaya hidup Kini',
            controller: controller.biayaHidupKini,
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
            name: 'Biaya hidup Dari Tahun Lalu',
            controller: controller.biayaHidupYAD,
            decoration: const InputDecoration(
              labelText: 'Biaya hidup Dari Tahun Lalu',
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
                  name: '% Biaya hidup Kini',
                  controller: controller.biayaHidupKiniPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup Kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: '% Biaya hidup YAD',
                  controller: controller.biayaHidupYADPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Biaya hidup YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          colorButton(context, 'Dapatkan Persentase', () {
            controller.hitungPersentasiOtomatis();
          }),
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
            name: 'Laba Usaha Kini',
            controller: controller.labaUsahaKini,
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
            name: 'Laba Usaha Tahun Lalu',
            controller: controller.labaUsahaYAD,
            decoration: const InputDecoration(
              labelText: 'Laba Usaha Tahun Lalu',
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
                  name: '% Laba Usaha Kini',
                  controller: controller.labaUsahaKiniPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha Kini',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: '% Laba Usaha YAD',
                  controller: controller.labaUsahaYADPercent,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: '% Laba Usaha YAD',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.percent),
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
                child: colorButton(
                  context,
                  'Hitung Total Laba',
                  () {
                    controller.hitungTotalLaba();
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: colorButton(
                  context,
                  'Hitung Prosentase Laba',
                  () {
                    controller.hitungTotalPersentasi();
                  },
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
