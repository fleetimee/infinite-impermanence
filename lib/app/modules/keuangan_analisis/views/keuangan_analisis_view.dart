import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/analisa_ratio.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/asumsi_keuangan.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisView extends GetView<KeuanganAnalisisController> {
  const KeuanganAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Analisis Keuangan'),
        centerTitle: true,
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
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Data Keuangan',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Angsuran',
                    ),

                    // third tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Asumsi Keuangan',
                    ),

                    Tab(
                      text: 'Analisa Ratio',
                    ),

                    Tab(
                      text: 'Summary',
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: FormBuilder(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      // first tab bar view widget
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                        child: FormBuilder(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              FormBuilderTextField(
                                controller: controller.equityInput,
                                name: 'Equity',
                                decoration: const InputDecoration(
                                  labelText: 'Equity / Modal',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FormBuilderTextField(
                                name: 'Debt',
                                controller: controller.debtInput,
                                decoration: const InputDecoration(
                                  labelText: 'Debt / Hutang',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              FormBuilderTextField(
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: 1,
                                ),
                                readOnly: true,
                                name: 'Total',
                                controller: controller.netWorth,
                                decoration: const InputDecoration(
                                  labelText: 'Total',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              colorButton(
                                context,
                                'Hitung Total Asset',
                                () {
                                  controller.hitungNetWorth();
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                                child: Divider(
                                  height: 60,
                                  thickness: 1,
                                  color: primaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: FormBuilderTextField(
                                      controller: controller.kreditYangDiminta,
                                      name: 'Kredit yang diminta',
                                      decoration: const InputDecoration(
                                        labelText: 'Kredit yang diminta',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FormBuilderTextField(
                                name: 'Jumlah Asset',
                                decoration: const InputDecoration(
                                  labelText: 'Jumlah Asset',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              colorButton(
                                context,
                                'Hitung Total Asset + Kredit yang diminta',
                                () {},
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // second tab bar view widget
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: ListView(
                          children: <Widget>[
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Angsuran Pinjaman Lain',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FormBuilderTextField(
                              name: 'Angsuran Pokok',
                              decoration: const InputDecoration(
                                labelText: 'Angsuran Pokok',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),

                      Padding(
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
                                    controller:
                                        controller.biayaBahanKiniPercent,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: '% Biaya bahan kini',
                                      border: OutlineInputBorder(),
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
                                    controller:
                                        controller.biayaOperasiKiniPercent,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: '% Biaya operasi Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: '% Biaya operasi YAD',
                                    controller:
                                        controller.biayaOperasiYADPercent,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: '% Biaya operasi YAD',
                                      border: OutlineInputBorder(),
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
                                    controller:
                                        controller.biayaHidupKiniPercent,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      labelText: '% Biaya hidup Kini',
                                      border: OutlineInputBorder(),
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
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 250),
                              child: Text(
                                'a. Ratio profit',
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
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    controller: controller.ratioProfitKini,
                                    name: 'Ratio Profit Kini',
                                    decoration: const InputDecoration(
                                      labelText: 'Ratio Profit Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    controller: controller.ratioProfitYAD,
                                    name: 'Ratio Profit YAD',
                                    decoration: const InputDecoration(
                                      labelText: 'Ratio Profit YAD',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            colorButton(
                              context,
                              'Hitung Ratio Profit',
                              () => controller.hitungRatioProfit(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'b. ROE',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    controller: controller.roeFixed,
                                    name: 'ROE',
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'ROE Kini',
                                    decoration: const InputDecoration(
                                      labelText: 'ROE Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'ROE YAD',
                                    decoration: const InputDecoration(
                                      labelText: 'ROE YAD',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Baik 👍',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'c. ROA',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'ROA',
                                    controller: controller.roaFixed,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'ROA Kini',
                                    decoration: const InputDecoration(
                                      labelText: 'ROA Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'ROA YAD',
                                    decoration: const InputDecoration(
                                      labelText: 'ROA YAD',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Baik 👍',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'd. DER',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DER',
                                    controller: controller.derFixed,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DER Kini',
                                    decoration: const InputDecoration(
                                      labelText: 'DER Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DER YAD',
                                    decoration: const InputDecoration(
                                      labelText: 'DER YAD',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Diterima 🤝',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'e. DSC',
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DSC',
                                    controller: controller.dscFixed,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DSC Kini',
                                    decoration: const InputDecoration(
                                      labelText: 'DSC Kini',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'DSC YAD',
                                    decoration: const InputDecoration(
                                      labelText: 'DSC YAD',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Diterima 🤝',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
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
