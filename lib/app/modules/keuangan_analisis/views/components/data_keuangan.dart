// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';

class DataKeuangan extends StatelessWidget {
  DataKeuangan({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                name: 'equity',
                enabled: false,

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                controller: controller.equityInput,
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
                controller: controller.debtInput,
                decoration: InputDecoration(
                  prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                  labelText: 'Debt / Hutang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Tap Here ->',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const Expanded(
                    child: JustTheTooltip(
                      backgroundColor: secondaryColor,
                      margin: EdgeInsets.only(left: 100),
                      elevation: 10,
                      triggerMode: TooltipTriggerMode.tap,
                      content: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Untuk total asset saya hard-code jumlahnya dikarenakan di sheetnya mereferensikan ke worksheet Rugi dan Laba, di sheet yang sebelumnya yang punya pak Nuruddin itu rumus Jumlah asset = Equity + Pinjaman, tetapi di sheet ini (dwi dagang sayur) jumlah asset diambil dari rugi laba.',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      child: Material(
                        color: primaryColor,
                        shape: CircleBorder(),
                        elevation: 4.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
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
                name: 'total_asset_belum_dengan_kredit',
                textDirection: TextDirection.rtl,
                controller: controller.netWorth,
                decoration: InputDecoration(
                  labelText: 'Total',
                  alignLabelWithHint: true,
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
                  "Hitung Total Asset",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
                    primary: secondaryColor,
                    shape: const StadiumBorder(),
                    maximumSize: const Size.fromWidth(double.infinity),
                    fixedSize: const Size(500, 50)),
                onPressed: () {
                  controller.hitungNetWorth();

                  showToast(
                    'Total Aset: Rp. ${controller.netWorth.text}',
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () {
                        return controller.isVerificationButtonPressed.value
                            ? controller.isKreditPassed.isTrue
                                ? const Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                    size: 35,
                                  )
                                : const Icon(
                                    Icons.close_outlined,
                                    color: Colors.red,
                                    size: 35,
                                  )
                            : const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => FormBuilderSwitch(
                    name: 'kredit_approved',
                    enabled: controller.isKreditPassed.value ? true : false,
                    inactiveThumbColor: secondaryColor,
                    decoration: InputDecoration(
                      labelText: 'Kredit di setujui',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: controller.isVerificationButtonPressed.value
                          ? controller.isKreditPassed.isTrue
                              ? const Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                  size: 35,
                                )
                              : const Icon(
                                  Icons.close_outlined,
                                  color: Colors.red,
                                  size: 35,
                                )
                          : const SizedBox(),
                    ),
                    onChanged: (value) {
                      controller.isKreditPassed.value = value!;
                    },
                    onSaved: (value) {
                      controller.isKreditPassed.value = value!;
                    },
                    title: Text(controller.isKreditPassed.isTrue
                        ? 'Kredit di setujui'
                        : 'Kredit di tolak'),
                  )),
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
                height: 20,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.verified),
                label: const Text(
                  "Verifikasi Kredit",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
                    primary: secondaryColor,
                    shape: const StadiumBorder(),
                    maximumSize: const Size.fromWidth(double.infinity),
                    fixedSize: const Size(500, 50)),
                onPressed: () {
                  controller.checkIfCreditPassed();

                  showToast(
                    'Status: ${controller.isKreditPassed.isTrue ? 'Lulus' : 'Gagal'}',
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
                    backgroundColor: primaryColor,
                    primary: secondaryColor,
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
      ),
    );
  }
}
