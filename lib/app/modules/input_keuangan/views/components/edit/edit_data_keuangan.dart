// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../../controllers/input_keuangan_controller.dart';

class EditDataKeuanganInput extends StatelessWidget {
  EditDataKeuanganInput({Key? key}) : super(key: key);

  final dataKeuanganCtrl = Get.put(InputKeuanganController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Data Keuangan',
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
              'assets/images/input_keuangan/page.svg',
            ),
            Visibility(
              visible: false,
              child: FormBuilderTextField(
                name: 'debitur_id',
                enabled: false,
                controller: dataKeuanganCtrl.debitur = TextEditingController(
                  text: data.id.toString(),
                ),
                decoration: InputDecoration(
                  labelText: 'Debitur ID',
                  prefixIcon: const Icon(FontAwesomeIcons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: false,
              child: FormBuilderTextField(
                name: 'rugi_laba_id',
                enabled: false,
                controller: dataKeuanganCtrl.rugiLaba = TextEditingController(
                  text: data.inputRugiLaba.id.toString(),
                ),
                decoration: InputDecoration(
                  labelText: 'Rugi Laba ID',
                  prefixIcon: const Icon(FontAwesomeIcons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FormBuilderTextField(
                    name: 'kredit_diusulkan',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    controller: dataKeuanganCtrl.kreditYangDiusulkan =
                        MoneyMaskedTextController(
                      decimalSeparator: '',
                      thousandSeparator: '.',
                      precision: 0,
                      initialValue: double.parse(
                          data.inputKeuangan.kreditDiusulkan.toString()),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Kredit Diusulkan',
                      prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'angsuran',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Harus diisi'),
                      FormBuilderValidators.maxLength(3,
                          errorText: 'Max 3 digit'),
                    ]),
                    controller: dataKeuanganCtrl.angsuranPerBulan =
                        TextEditingController(
                      text: data.inputKeuangan.angsuran.toString(),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jangka Waktu (bln)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'bunga_per_tahun',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Harus diisi'),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(0),
                FormBuilderValidators.max(500),
                FormBuilderValidators.maxLength(3, errorText: 'Max 3 digit'),
              ]),
              controller: dataKeuanganCtrl.bungaPerTahun =
                  TextEditingController(
                      text: data.inputKeuangan.bungaPerTahun.toString()),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bunga per tahun',
                suffixIcon: const Icon(FontAwesomeIcons.percent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'provisi',
                    controller: dataKeuanganCtrl.provisi =
                        TextEditingController(
                      text: data.inputKeuangan.provisi.toString(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Harus diisi'),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.min(0),
                      FormBuilderValidators.max(500),
                      FormBuilderValidators.maxLength(3,
                          errorText: 'Max 3 digit'),
                    ]),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Provisi %',
                      suffixIcon: const Icon(FontAwesomeIcons.percent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: FormBuilderDropdown(
                    items: [
                      'Efektif',
                      'Flat',
                    ]
                        .map(
                          (val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ),
                        )
                        .toList(),
                    name: 'sistem_angsuran',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: 'Harus diisi'),
                      ],
                    ),
                    initialValue: data.inputKeuangan.sistemAngsuran,
                    onChanged: (value) {
                      dataKeuanganCtrl.sistemAngsuran.value = value.toString();
                      debugPrint(value.toString());
                    },
                    onSaved: (value) {
                      dataKeuanganCtrl.sistemAngsuran.value = value.toString();
                      debugPrint(value.toString());
                    },
                    decoration: InputDecoration(
                      labelText: 'Sistem Angsuran',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderDropdown(
                name: 'digunakan_untuk',
                initialValue: data.inputKeuangan.digunakanUntuk,
                onChanged: (value) {
                  dataKeuanganCtrl.digunakanUntuk.value = value!.toString();
                  debugPrint(value.toString());
                },
                onSaved: (value) {
                  dataKeuanganCtrl.digunakanUntuk.value = value!.toString();
                  debugPrint(value.toString());
                },
                decoration: InputDecoration(
                  labelText: 'Digunakan Untuk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: dataKeuanganCtrl.digunakanUntukList
                    .map(
                      (element) => DropdownMenuItem(
                        value: element,
                        child: Text(element),
                      ),
                    )
                    .toList()),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'angsuran_rp',
              readOnly: true,
              controller: dataKeuanganCtrl.totalAngsuran =
                  MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue:
                    double.parse(data.inputKeuangan.angsuranRp.toString()),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angsuran (Rp)',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text(
                "Hitung Angsuran",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  maximumSize: const Size.fromWidth(double.infinity),
                  fixedSize: const Size(500, 50)),
              onPressed: () {
                dataKeuanganCtrl.mothlyPaymentCalculation();

                showToast(
                  'Angsuran per bulan: Rp. ${dataKeuanganCtrl.totalAngsuran.text}',
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
          ],
        ),
      ),
    );
  }
}
