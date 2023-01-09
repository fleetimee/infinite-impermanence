// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

// 🌎 Project imports:

class EditAngsuran extends StatelessWidget {
  EditAngsuran({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Angsuran Lain (Bank / Non Bank)',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FormBuilderTextField(
                    name: 'total_angsuran_lain',
                    readOnly: true,
                    controller: controller.angsuranPerBulanLainAtas =
                        MoneyMaskedTextController(
                            thousandSeparator: '.',
                            decimalSeparator: '',
                            precision: 0,
                            initialValue: double.parse(
                                data.inputNeraca.angsuranPinjamanLain)),
                    decoration: InputDecoration(
                      labelText: 'Angsuran Dibayarkan',
                      prefixText: 'Rp. ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Divider(
                  height: 60,
                  thickness: 1,
                  color: primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Angsuran Bank BPD DIY',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          textAlign: TextAlign.right,
                          name: 'bunga_per_tahun_bpd',
                          readOnly: true,
                          controller: controller.bungaPerTahun =
                              TextEditingController(
                                  text: data.inputKeuangan.bungaPerTahun
                                      .toString()),
                          decoration: InputDecoration(
                            labelText: 'Bunga/tahun %',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixText: '%',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'tenor_bpd',
                          readOnly: true,
                          controller: controller.angsuranPerBulan =
                              TextEditingController(
                            text: data.inputKeuangan.angsuran.toString(),
                          ),
                          decoration: InputDecoration(
                              labelText: 'Tenor',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon:
                                  const Icon(FontAwesomeIcons.calendarWeek)),
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
                          decoration: InputDecoration(
                            labelText: 'Status',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          initialValue: 'Efektif',
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
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: FormBuilderTextField(
                          name: 'Total Angsuran Kredit',
                          enabled: false,
                          controller: controller.totalBunga =
                              MoneyMaskedTextController(
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                  initialValue: double.parse(
                                      data.inputKeuangan.angsuranRp)),
                          decoration: InputDecoration(
                            labelText: 'Angsuran Dibayarkan',
                            prefixText: 'Rp. ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // GFButton(
                  //   onPressed: () {
                  //     controller.mothlyPaymentCalculation();
                  //     showToast(
                  //       'Angsuran per bulan: Rp. ${controller.totalBunga.text}',
                  //       textStyle: const TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //         color: secondaryColor,
                  //       ),
                  //       context: context,
                  //       animation: StyledToastAnimation.scale,
                  //       reverseAnimation: StyledToastAnimation.fade,
                  //       position: StyledToastPosition.center,
                  //       animDuration: const Duration(seconds: 1),
                  //       duration: const Duration(seconds: 4),
                  //       curve: Curves.elasticOut,
                  //       reverseCurve: Curves.linear,
                  //     );
                  //   },
                  //   text: 'Hitung Angsuran',
                  //   fullWidthButton: true,
                  //   size: GFSize.LARGE,
                  //   color: primaryColor,
                  // ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Divider(
                  height: 60,
                  thickness: 1,
                  color: primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Angsuran',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FormBuilderTextField(
                        name: 'total_angsuran',
                        controller: controller.totalAngsuran =
                            MoneyMaskedTextController(
                                thousandSeparator: '.',
                                decimalSeparator: '',
                                precision: 0,
                                initialValue: double.parse(
                                    data.analisaKeuangan.angsuranFix)),
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixText: 'Rp. ',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GFButton(
            onPressed: () {
              controller.hitungTotalAngsuran();

              showToast(
                'Total Angsuran per bulan: Rp. ${controller.totalAngsuran.text}',
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
            text: 'Hitung Total Angsuran',
            fullWidthButton: true,
            color: primaryColor,
            size: GFSize.LARGE,
          ),
        ],
      ),
    );
  }
}
