// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';

class DataKeuanganInput extends StatelessWidget {
  DataKeuanganInput({Key? key}) : super(key: key);

  final dataKeuanganCtrl = Get.put(InputKeuanganController());

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
                    controller: dataKeuanganCtrl.kreditYangDiusulkan,
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
                    controller: dataKeuanganCtrl.angsuranPerBulan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angsuran (bln)',
                      suffixIcon: const Icon(FontAwesomeIcons.calendar),
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
              controller: dataKeuanganCtrl.bungaPerTahun,
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
                    controller: dataKeuanganCtrl.provisi,
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
                    name: 'sistem_angsuran',
                    initialValue: 'Efektif',
                    onChanged: (value) {
                      dataKeuanganCtrl.sistemAngsuran.value = value.toString();
                      debugPrint(value.toString());
                    },
                    decoration: InputDecoration(
                      labelText: 'Sistem Angsuran',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'digunakan_untuk',
              controller: dataKeuanganCtrl.digunakanUntuk,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Digunakan Untuk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'angsuran_rp',
              readOnly: true,
              controller: dataKeuanganCtrl.totalAngsuran,
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
                  backgroundColor: primaryColor,
                  primary: secondaryColor,
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
