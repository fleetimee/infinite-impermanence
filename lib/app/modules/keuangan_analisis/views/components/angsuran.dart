// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
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
            'Angsuran Bank Lain',
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
            decoration: InputDecoration(
              labelText: 'Angsuran Dibayarkan A',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              alignLabelWithHint: true,
              prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            controller: controller.totalBungaLainBawah,
            enabled: false,
            readOnly: true,
            textAlign: TextAlign.center,
            name: 'Total Angsuran Pinjaman Bottom',
            decoration: InputDecoration(
              labelText: 'Angsuran Dibayarkan B',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          // FormBuilderTextField(
          //   name: 'Unknown Variable',
          //   textAlign: TextAlign.center,
          //   controller: controller.unknownNumber,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   decoration: const InputDecoration(
          //     labelText: '',
          //     border: OutlineInputBorder(),
          //     prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),

          // colorButton(
          //   context,
          //   'Hitung Total Angsuran Pinjaman',
          //   () {},
          // ),
          const Divider(
            height: 50,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Angsuran Pinjaman Kredit
          Text(
            'Angsuran BPD DIY',
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
                  name: 'tenor',
                  controller: controller.angsuranPerBulan,
                  decoration: const InputDecoration(
                      labelText: 'Tenor',
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
                  initialValue: 'Efektif',
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
                  name: 'Total Angsuran Kredit',
                  enabled: false,
                  controller: controller.totalBunga,
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Dibayarkan',
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
          //   () {
          //     controller.mothlyPaymentCalculation();
          //   },
          // ),

          OutlinedButton.icon(
            icon: const Icon(Icons.calculate),
            label: const Text(
              "Hitung Angsuran BPD DIY",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            style: OutlinedButton.styleFrom(
                backgroundColor: primaryColor,
                primary: secondaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size.fromWidth(double.infinity),
                fixedSize: const Size(500, 50)),
            onPressed: () {
              controller.mothlyPaymentCalculation();

              showToast(
                'Angsuran per bulan: Rp. ${controller.totalBunga.text}',
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
          ),

          const Divider(
            height: 50,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Hitung Flat / Efektif
          // Text(
          //   'Hitung Flat / Efektif',
          //   style: TextStyle(
          //     fontSize: 30,
          //     letterSpacing: 1,
          //     // make underline
          //     decoration: TextDecoration.combine([
          //       TextDecoration.underline,
          //     ]),
          //   ),
          //   textAlign: TextAlign.left,
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: FormBuilderTextField(
          //         name: 'Flat Initial',
          //         controller: controller.flatInitial,
          //         decoration: const InputDecoration(
          //           labelText: 'Flat Initial',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Expanded(
          //       child: FormBuilderTextField(
          //         controller: controller.efektifInitial,
          //         name: 'Efektif Initial',
          //         decoration: const InputDecoration(
          //           labelText: 'Efektif Initial',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // FormBuilderTextField(
          //   name: 'Flat Perbulan',
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   controller: controller.totalFlatEfektif,
          //   decoration: const InputDecoration(
          //     labelText: 'Total Flat / Efektif',
          //     border: OutlineInputBorder(),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // colorButton(
          //   context,
          //   'Hitung Flat / Efektif',
          //   () {
          //     controller.hitungFlatAndEfektif();
          //   },
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   'Total Flat / Efektif',
          //   style: TextStyle(
          //     fontSize: 30,
          //     letterSpacing: 1,
          //     // make underline
          //     decoration: TextDecoration.combine([
          //       TextDecoration.underline,
          //     ]),
          //   ),
          //   textAlign: TextAlign.left,
          // ),
          // const SizedBox(
          //   height: 60,
          // ),
          // FormBuilderTextField(
          //   name: 'Total Efektif',
          //   controller: controller.totalEfektif,
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   decoration: const InputDecoration(
          //     labelText: 'Total Efektif',
          //     border: OutlineInputBorder(),
          //     prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 40,
          // ),
          // FormBuilderTextField(
          //   name: 'Total Flat',
          //   controller: controller.totalFlat,
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   decoration: const InputDecoration(
          //     labelText: 'Total Flat',
          //     border: OutlineInputBorder(),
          //     prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // colorButton(
          //   context,
          //   'Hitung',
          //   () {
          //     controller.hitungTotalFlatEfektif();
          //   },
          // ),
          // const Divider(
          //   height: 100,
          //   thickness: 2,
          //   color: primaryColor,
          // ),
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
