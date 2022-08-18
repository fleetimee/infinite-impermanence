// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/widget/color_button.dart';

class DataKeuangan extends StatelessWidget {
  DataKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
        child: FormBuilder(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                FormBuilderTextField(
                  key: const Key('data_keuangan_nama_perusahaan'),
                  name: 'Equity',
                  controller: controller.equityInput,
                  // initialValue: controller.equity.format('19933998'),
                  decoration: const InputDecoration(
                    labelText: 'Equity / Modal',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
                    labelText: 'Debt / Hutang',
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
                      flex: 3,
                      child: Text(
                        'Tap Here ->',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          color: primaryColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Expanded(
                      child: JustTheTooltip(
                        backgroundColor: secondaryColor,
                        margin: EdgeInsets.only(left: 100),
                        elevation: 10,
                        triggerMode: TooltipTriggerMode.tap,
                        content: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Untuk total asset saya hard-code jumlahnya dikarenakan di sheetnya mereferensikan ke worksheet Rugi dan Laba, di sheet yang sebelumnya yang punya pak Nuruddin itu rumus Jumlah asset = Equity + Pinjaman, tetapi di sheet ini (dwi dagang sayur) jumlah asset diambil dari rugi laba.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        child: Material(
                          color: primaryColor,
                          shape: CircleBorder(),
                          elevation: 4.0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                  readOnly: true,
                  name: 'Total',
                  controller: controller.netWorth,
                  decoration: const InputDecoration(
                    labelText: 'Total',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: primaryColor,
                        ),
                        name: 'Kredit yang diminta',
                        decoration: const InputDecoration(
                          labelText: 'Kredit yang diminta',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
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
                          return controller.isVerificationButtonPressed.value
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
                const SizedBox(
                  height: 20,
                ),
                colorButton(
                  context,
                  'Verifikasi Kredit',
                  () {
                    controller.checkIfCreditPassed();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                FormBuilderTextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  name: 'Jumlah Asset',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: primaryColor,
                  ),
                  controller: controller.netWorthPlusCredit,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Asset',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                colorButton(
                  context,
                  'Hitung Total Asset + Kredit yang diminta',
                  () {
                    controller.hitungNetWorthPlusCredit();
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
