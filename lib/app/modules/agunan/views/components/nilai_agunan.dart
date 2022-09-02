// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan/controllers/agunan_controller.dart';
import 'package:akm/app/widget/color_button.dart';

class NilaiAgunan extends StatelessWidget {
  NilaiAgunan({Key? key}) : super(key: key);

  final controller = Get.put(AgunanController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionTile(
        subtitle: const Text(
          'Jelaskan keterangan barang agunan yang dimiliki debitur secara rinci dan detail serta berikan juga harga dan bukti kepemilikannya.',
          style: TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.fade,
            height: 1.5,
          ),
          textAlign: TextAlign.start,
        ),
        title: const Text('Nilai Agunan'),
        trailing: controller.isExpanded.value
            ? const Icon(Icons.arrow_drop_down_circle)
            : const Icon(
                Icons.arrow_drop_down,
              ),
        onExpansionChanged: (isExpanded) {
          controller.isExpanded.value = isExpanded;
        },
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(
                () => Expanded(
                  child: Checkbox(
                    onChanged: (value) {
                      controller.isCheckedTanah.value = value!;

                      // Clear form builder
                      if (value) {
                        controller.checkboxTanahDeskripsiKey.currentState
                            ?.reset();
                      }
                    },
                    value: controller.isCheckedTanah.value,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: Obx(
                  () => FormBuilderTextField(
                    // Format number with comma
                    controller: controller.tanahInput,
                    enabled: controller.isCheckedTanah.value ? true : false,
                    name: 'Tanah',
                    decoration: const InputDecoration(
                      labelText: 'Tanah',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: Obx(
              () => FormBuilderTextField(
                key: controller.checkboxTanahDeskripsiKey,
                enabled: controller.isCheckedTanah.value ? true : false,
                name: 'Bukti Kepemilikan Tanah',
                decoration: const InputDecoration(
                  labelText: 'Bukti Kepemilikan Tanah',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedTanahAndBangunan.value,
                  onChanged: (value) {
                    controller.isCheckedTanahAndBangunan.value = value!;
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.tanahAndBangunanInput,
                  enabled:
                      controller.isCheckedTanahAndBangunan.value ? true : false,
                  name: 'Tanah Dan Bangunan',
                  decoration: const InputDecoration(
                    labelText: 'Tanah dan Bangunan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled:
                  controller.isCheckedTanahAndBangunan.value ? true : false,
              name: 'Bukti Kepemisilan Tanah dan Bangunan',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Tanah dan Bangunan',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedMesinAndPeralatan.value,
                  onChanged: (value) {
                    controller.isCheckedMesinAndPeralatan.value = value!;
                    // Reset value of input text field
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.mesinAndPeralatanInput,
                  enabled: controller.isCheckedMesinAndPeralatan.value
                      ? true
                      : false,
                  name: 'Mesin dan Peralatan',
                  decoration: const InputDecoration(
                    labelText: 'Mesin dan Peralatan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled:
                  controller.isCheckedMesinAndPeralatan.value ? true : false,
              name: 'Bukti Kepemisilan Mesin dan Peralatan',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Mesin dan Peralatan',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedKendaraan.value,
                  onChanged: (value) {
                    controller.isCheckedKendaraan.value = value!;
                    // Reset value of input text field
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.kendaraanInput,
                  enabled: controller.isCheckedKendaraan.value ? true : false,
                  name: 'Kendaraan',
                  decoration: const InputDecoration(
                    labelText: 'Kendaraan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled: controller.isCheckedKendaraan.value ? true : false,
              name: 'Bukti Kepemisilan Kendaraan',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Kendaraan',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedKios.value,
                  onChanged: (value) {
                    controller.isCheckedKios.value = value!;
                    // Reset value of input text field
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.kiosInput,
                  enabled: controller.isCheckedKios.value ? true : false,
                  name: 'Los / Kios',
                  decoration: const InputDecoration(
                    labelText: 'Los / Kios',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled: controller.isCheckedKios.value ? true : false,
              name: 'Bukti Kepemisilan Kios',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Kios',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedCashCollateral.value,
                  onChanged: (value) {
                    controller.isCheckedCashCollateral.value = value!;
                    // Reset value of input text field
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.cashCollateralInput,
                  enabled:
                      controller.isCheckedCashCollateral.value ? true : false,
                  name: 'Cash Collateral',
                  decoration: const InputDecoration(
                    labelText: 'Cash Collateral',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled: controller.isCheckedCashCollateral.value ? true : false,
              name: 'Bukti Kepemisilan Cash Collateral',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Cash Collateral',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Checkbox(
                  value: controller.isCheckedLainnya.value,
                  onChanged: (value) {
                    controller.isCheckedLainnya.value = value!;
                    // Reset value of input text field
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: FormBuilderTextField(
                  controller: controller.lainnyaInput,
                  enabled: controller.isCheckedLainnya.value ? true : false,
                  name: 'Lainnya',
                  decoration: const InputDecoration(
                    labelText: 'Lainnya',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: FormBuilderTextField(
              enabled: controller.isCheckedLainnya.value ? true : false,
              name: 'Bukti Kepemisilan Lainnya',
              decoration: const InputDecoration(
                labelText: 'Bukti Kepemisilan Lainnya',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
            child: colorButton(
              context,
              'Total',
              () => {
                controller.hitungTotalAgunan(),
                AwesomeDialog(
                  context: context,
                  dialogBackgroundColor: primaryColor,
                  titleTextStyle: GoogleFonts.poppins(
                    color: secondaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  descTextStyle: GoogleFonts.poppins(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Sukses',
                  desc: 'Total berhasil dihitung',
                  btnOkOnPress: () {},
                ).show(),
              },
            ),
          ),
        ],
      ),
    );
  }
}
