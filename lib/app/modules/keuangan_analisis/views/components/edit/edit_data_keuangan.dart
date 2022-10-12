// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

// 🌎 Project imports:

class EditDataKeuangan extends StatelessWidget {
  EditDataKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: false,
              child: FormBuilderTextField(
                name: 'debiturId',
                controller: controller.debiturId = TextEditingController(
                  text: data.id.toString(),
                ),
                decoration: InputDecoration(
                  labelText: 'Debitur ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Visibility(
              visible: false,
              child: FormBuilderTextField(
                name: 'keuanganId',
                controller: controller.keuanganId = TextEditingController(
                  text: data.inputKeuangan.id.toString(),
                ),
                decoration: InputDecoration(
                  labelText: 'Keuangan ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            FormBuilderTextField(
              enabled: false,
              readOnly: true,
              name: 'total_asset_belum_dengan_kredit',
              controller: controller.netWorth = MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: (double.parse(data.inputRugiLaba.sumAktiva) -
                      double.parse(data.inputRugiLaba.tanahDanBangunan))),
              decoration: InputDecoration(
                labelText: 'Jumlah Aset',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20.0,
            ),
            FormBuilderTextField(
              name: 'equity',
              enabled: false,

              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              controller: controller.equityInput = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputRugiLaba.jumlahModal),
              ),
              // initialValue: controller.equity.format('19933998'),
              decoration: InputDecoration(
                labelText: 'Equity / Modal',
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
            FormBuilderTextField(
              name: 'debt',
              enabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              controller: controller.debtInput = MoneyMaskedTextController(
                  decimalSeparator: '',
                  thousandSeparator: '.',
                  precision: 0,
                  initialValue: double.parse(data.inputRugiLaba.hutangLainnya)),
              decoration: InputDecoration(
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                labelText: 'Pinjaman lain (bank/non bank)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 3,
            //       child: Text(
            //         'Tap Here ->',
            //         style: GoogleFonts.aBeeZee(
            //           fontSize: 20,
            //           color: primaryColor,
            //         ),
            //         textAlign: TextAlign.right,
            //       ),
            //     ),
            //     const Expanded(
            //       child: JustTheTooltip(
            //         backgroundColor: secondaryColor,
            //         margin: EdgeInsets.only(left: 100),
            //         elevation: 10,
            //         triggerMode: TooltipTriggerMode.tap,
            //         content: Padding(
            //           padding: EdgeInsets.all(16.0),
            //           child: Text(
            //             'Untuk total asset saya hard-code jumlahnya dikarenakan di sheetnya mereferensikan ke worksheet Rugi dan Laba, di sheet yang sebelumnya yang punya pak Nuruddin itu rumus Jumlah asset = Equity + Pinjaman, tetapi di sheet ini (dwi dagang sayur) jumlah asset diambil dari rugi laba.',
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         ),
            //         child: Material(
            //           color: primaryColor,
            //           shape: CircleBorder(),
            //           elevation: 4.0,
            //           child: Padding(
            //             padding: EdgeInsets.all(8.0),
            //             child: Icon(
            //               Icons.info_outline,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),

            const Padding(
              padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: Divider(
                height: 60,
                thickness: 1,
                color: primaryColor,
              ),
            ),
            FormBuilderTextField(
              controller: controller.kreditYangDiminta =
                  MoneyMaskedTextController(
                      thousandSeparator: '.',
                      decimalSeparator: '',
                      precision: 0,
                      initialValue:
                          double.parse(data.inputKeuangan.kreditDiusulkan)),
              enabled: false,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: primaryColor,
              ),
              name: 'kredit_yang_diminta',
              decoration: InputDecoration(
                labelText: 'Plafon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),

            // Switch(
            //   value: controller.isKreditPassed.value,
            //   onChanged: (value) {
            //     if (value) {
            //       controller.isKreditPassed.value = true;
            //     } else {
            //       controller.isKreditPassed.value = false;
            //     }
            //   },
            // ),

            const SizedBox(
              height: 40,
            ),
            FormBuilderTextField(
              enabled: false,
              textAlign: TextAlign.center,
              name: 'jumlah_asset',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: primaryColor,
              ),
              controller: controller.netWorthPlusCredit,
              decoration: InputDecoration(
                labelText: 'Jumlah Asset',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text(
                "Total Aset Kini Menjadi",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                controller.hitungNetWorthPlusCredit();

                showToast(
                  ' Total Aset: Rp. ${controller.netWorthPlusCredit.text}',
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
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
