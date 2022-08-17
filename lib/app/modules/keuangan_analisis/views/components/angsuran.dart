// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/widget/color_button.dart';

class Angsuran extends StatelessWidget {
  Angsuran({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            'Angsuran Pinjaman Lain',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Bunga Pinjaman Lain',
                  controller: controller.bungaPerTahunLain,
                  decoration: const InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'Angsuran Perbulan Top',
                  controller: controller.angsuranPerBulanLainAtas,
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.calendarWeek),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(''),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.angsuranPerBulanLainBawah,
                  name: 'Angsuran Perbulan Bottom',
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.calendarWeek),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            enabled: false,
            textAlign: TextAlign.center,
            controller: controller.totalBungaLainAtas,
            name: 'Total Angsuran Pinjaman Top',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: 'Total Angsuran Pinjaman ',
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
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Pilih Flat/Nominal'),
                  alignment: Alignment.center,
                  name: 'Choice',
                  items: const [
                    DropdownMenuItem(
                        value: 'nominal',
                        child: Text(
                          'Nominal',
                          style: TextStyle(),
                        )),
                    DropdownMenuItem(
                      value: 'flat',
                      child: Text('Flat'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  controller: controller.totalBungaLainBawah,
                  enabled: false,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: primaryColor,
                  ),
                  name: 'Total Angsuran Pinjaman Bottom',
                  decoration: const InputDecoration(
                    labelText: 'Total Angsuran',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'Unknown Variable',
            textAlign: TextAlign.center,
            controller: controller.unknownNumber,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: '',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          // colorButton(
          //   context,
          //   'Hitung Total Angsuran Pinjaman',
          //   () {},
          // ),
          const Divider(
            height: 100,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Angsuran Pinjaman Kredit
          Text(
            'Angsuran Pinjaman Kredit',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Bunga Pinjaman Kredit',
                  controller: controller.bungaPerTahun,
                  decoration: const InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(FontAwesomeIcons.percent),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'Angsuran Perbulan Kredit',
                  controller: controller.angsuranPerBulan,
                  decoration: const InputDecoration(
                      labelText: 'Angsuran Perbulan',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(FontAwesomeIcons.calendarWeek)),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Pilih Flat/Nominal'),
                  alignment: Alignment.center,
                  name: 'Choice Pinjaman Kredit',
                  items: const [
                    DropdownMenuItem(
                        value: 'Efektif',
                        child: Text(
                          'Efektif',
                          style: TextStyle(),
                        )),
                    DropdownMenuItem(
                      value: 'flat',
                      child: Text('Flat'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  // enabled: false,
                  textAlign: TextAlign.center,
                  name: 'Total Angsuran Kredit',
                  controller: controller.totalBunga,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: primaryColor,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Total Angsuran Kredit',
                    prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // colorButton(
          //   context,
          //   'Hitung Total Angsuran Pinjaman',
          //   () {},
          // ),

          const Divider(
            height: 100,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Hitung Flat / Efektif
          Text(
            'Hitung Flat / Efektif',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Flat Initial',
                  controller: controller.flatInitial,
                  decoration: const InputDecoration(
                    labelText: 'Flat Initial',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.efektifInitial,
                  name: 'Efektif Initial',
                  decoration: const InputDecoration(
                    labelText: 'Efektif Initial',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Flat Perbulan',
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            controller: controller.totalFlatEfektif,
            decoration: const InputDecoration(
              labelText: 'Total Flat / Efektif',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          colorButton(
            context,
            'Hitung Flat / Efektif',
            () {
              controller.hitungFlatAndEfektif();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Total Flat / Efektif',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 60,
          ),
          FormBuilderTextField(
            name: 'Total Efektif',
            controller: controller.totalEfektif,
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: 'Total Efektif',
              border: OutlineInputBorder(),
              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 40,
          ),
          FormBuilderTextField(
            name: 'Total Flat',
            controller: controller.totalFlat,
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: 'Total Flat',
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
            'Hitung',
            () {
              controller.hitungTotalFlatEfektif();
            },
          ),
          const Divider(
            height: 100,
            thickness: 2,
            color: primaryColor,
          ),
          // ! Hitung Flat / Efektif
          Text(
            'Total Angsuran',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Total Angsuran',
            controller: controller.totalAngsuran,
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
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
            'Hitung',
            () {
              controller.hitungTotalAngsuran();
            },
          ),
        ],
      ),
    );
  }
}
