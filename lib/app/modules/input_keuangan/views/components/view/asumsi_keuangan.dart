// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
 import '../../../controllers/input_keuangan_controller.dart';

class ViewAsumsiKeuanganInput extends StatelessWidget {
  ViewAsumsiKeuanganInput({Key? key}) : super(key: key);

  final controller = Get.put(InputKeuanganController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Asumsi Keuangan',
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
              'assets/images/input_keuangan/asumsi.svg',
              height: 400,
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 195),
            //   child: Text(
            //     'Pinjaman Bank Lain',
            //     style: GoogleFonts.poppins(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w400,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: FormBuilderTextField(
            //         name: 'pinjaman_lainnya',
            //         autovalidateMode: AutovalidateMode.onUserInteraction,
            //         validator: FormBuilderValidators.compose([
            //           FormBuilderValidators.required(),
            //         ]),
            //         keyboardType: TextInputType.number,
            //         controller: controller.pinjamanLainnya,
            //         decoration: InputDecoration(
            //           labelText: 'Pinjaman Lainnya',
            //           prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     Expanded(
            //       child: FormBuilderTextField(
            //         name: 'angsuran_pinjman_lain',
            //         autovalidateMode: AutovalidateMode.onUserInteraction,
            //         validator: FormBuilderValidators.compose([
            //           FormBuilderValidators.required(),
            //         ]),
            //         controller: controller.angsuranPinjamanLainnya,
            //         keyboardType: TextInputType.number,
            //         decoration: InputDecoration(
            //           labelText: 'Angsuran Lain (bln)',
            //           suffixIcon: const Icon(FontAwesomeIcons.calendar),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 300),
            //   child: Text(
            //     'Nilai Aset',
            //     style: GoogleFonts.poppins(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w400,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // FormBuilderTextField(
            //   name: 'nilai_aset',
            //   controller: controller.nilaiAset,
            //   keyboardType: TextInputType.number,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   validator: FormBuilderValidators.compose([
            //     FormBuilderValidators.required(),
            //   ]),
            //   decoration: InputDecoration(
            //     labelText: 'Nilai Aset (exc: Rumah)',
            //     prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 25.0,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                'Keuangan Kini',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'penjualan',
              enabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              readOnly: true,
              controller: controller.penjualanKini = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputRugiLaba.omzet),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                labelText: 'Penjualan per bulan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'hpp',
              enabled: false,
              controller: controller.hpp = TextEditingController(
                text: data.inputKeuangan.hpp.toString(),
              ),
              textAlign: TextAlign.right,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.max(100),
                FormBuilderValidators.min(20),
              ]),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: const Icon(FontAwesomeIcons.percent),
                labelText: 'HPP per bulan',
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_bahan',
              enabled: false,
              controller: controller.biayaBahanKini = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(
                  data.inputKeuangan.biayaBahanKini.toString(),
                ),
              ),
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya bahan HPP',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_upah',
              readOnly: true,
              enabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              controller: controller.biayaUpahKini = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputRugiLaba.biayaTenagaKerja),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Upah',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_operasional',
              readOnly: true,
              enabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              controller: controller.biayaOperasionalKini =
                  MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputRugiLaba.biayaOperasional),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Operasional',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_hidup',
              readOnly: true,
              enabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              controller: controller.biayaHidupKini = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputRugiLaba.biayaHidup),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Hidup',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                'Asumsi',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              enabled: false,
              name: 'penjualan_asumsi',
              controller: controller.penjualanYad = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputKeuangan.penjualanAsumsi),
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                labelText: 'Penjualan YAD',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              enabled: false,
              name: 'biaya_bahan_asumsi',
              controller: controller.biayaBahanYad = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputKeuangan.biayaBahanAsumsi),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya bahan HPP YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              enabled: false,
              name: 'biaya_upah_asumsi',
              controller: controller.biayaUpahYad = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputKeuangan.biayaUpahAsumsi),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Upah YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              enabled: false,
              name: 'biaya_operasional_asumsi',
              controller: controller.biayaOperasionalYad =
                  MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue:
                    double.parse(data.inputKeuangan.biayaOperasionalAsumsi),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Operasional YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              enabled: false,
              name: 'biaya_hidup_asumsi',
              controller: controller.biayaHidupYad = MoneyMaskedTextController(
                decimalSeparator: '',
                thousandSeparator: '.',
                precision: 0,
                initialValue: double.parse(data.inputKeuangan.biayaHidupAsumsi),
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Hidup YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
