// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:getwidget/getwidget.dart';

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
        children: [
          Visibility(
            visible: false,
            child: Column(
              children: [
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
                        name: 'bunga_pinjaman_lain',
                        controller: controller.bungaPerTahunLain,
                        decoration: InputDecoration(
                          labelText: 'Bunga/tahun %',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: const Icon(FontAwesomeIcons.percent),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'tenor_a',
                        controller: controller.angsuranPerBulanLainAtas,
                        decoration: InputDecoration(
                          labelText: 'Tenor A',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(FontAwesomeIcons.calendarWeek),
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
                        name: 'tenor_b',
                        decoration: InputDecoration(
                          labelText: 'Tenor B',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(FontAwesomeIcons.calendarWeek),
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
                  name: 'angsuran_pinjaman_lain_top',
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
                  name: 'angsuran_pinjaman_lain_bottom',
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
                OutlinedButton.icon(
                  icon: const Icon(Icons.calculate),
                  label: const Text(
                    "Hitung Angsuran Bank Lain",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: secondaryColor,
                      backgroundColor: primaryColor,
                      shape: const StadiumBorder(),
                      maximumSize: const Size.fromWidth(double.infinity),
                      fixedSize: const Size(500, 50)),
                  onPressed: () {
                    controller.hitungPinjamanBankLain();

                    showToast(
                      ' Total Angsuran Bank Lain : Rp ${controller.totalBungaLainAtas.text}',
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
              ],
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
                              text:
                                  data.inputKeuangan.bungaPerTahun.toString()),
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
                              initialValue:
                                  double.parse(data.inputKeuangan.angsuranRp)),
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
              GFButton(
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
                text: 'Hitung Angsuran',
                fullWidthButton: true,
                size: GFSize.LARGE,
                color: primaryColor,
              ),
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
                            initialValue:
                                double.parse(data.inputKeuangan.angsuranRp)),
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
        ],
      ),
    );
  }
}
