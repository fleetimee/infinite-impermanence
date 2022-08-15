import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
                  controller: controller.equityInput,
                  name: 'Equity',
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
                  height: 40,
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
                    const Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                  ],
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
