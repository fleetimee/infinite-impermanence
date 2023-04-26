// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_analyst_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_bisnis.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_gallery.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_inputan.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_karakter.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_keuangan.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_reviewer_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_usaha.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/pengutus_submit_controller.dart';
import '../widget/pengutus_submit_agunan.dart';

// ignore: must_be_immutable
class PengutusSubmitView extends GetView<PengutusSubmitController> {
  PengutusSubmitView({Key? key}) : super(key: key);

  String formatDatetime(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  Widget myWidget(int num) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: FormBuilderTextField(
            name: 'name$num',
            maxLines: 3,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              debugPrint('value: $value');
            },
            validator: FormBuilderValidators.required(),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Poin ${num + 1}',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  var list = List.empty(growable: true).obs;

  Icon iconNotYet() {
    return const Icon(
      Icons.info_outline,
      color: Colors.red,
      size: 40,
    );
  }

  Icon iconDone() {
    return const Icon(
      Icons.check_circle_outline,
      color: Colors.green,
      size: 40,
    );
  }

  TextStyle buttonStyle() {
    return const TextStyle(
      fontSize: 20,
      color: secondaryColor,
    );
  }

  TextStyle subtitleStyle() {
    return TextStyle(
      fontSize: 18,
      color: Colors.grey[600],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[600],
      body: RawScrollbar(
        thumbColor: Colors.white,
        radius: const Radius.circular(16),
        thickness: 7,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GFTypography(
                      text: 'Putusan Pengajuan',
                      type: GFTypographyType.typo1,
                      textColor: secondaryColor,
                      dividerColor: secondaryColor,
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => Text(
                        controller.isProcessing.value
                            ? 'Loading...'
                            : 'Pengajuan ini berisikan calon debitur dengan nama ${controller.insightDebitur.value.peminjam1}, dengan no pengajuan ${controller.pengajuan.id} yang diajukan pada tanggal ${formatDatetime(controller.pengajuan.tglSubmit!)} oleh analis Novian',
                        style: Theme.of(context).textTheme.bodySmall?.merge(
                              const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: secondaryColor,
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanggal Putusan :',
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                            const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDateTimePicker(
                      name: 'tglPutusan',
                      cursorColor: secondaryColor,
                      inputType: InputType.date,
                      style: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                      format: DateFormat('dd-MM-yyyy'),
                      resetIcon: const Icon(Icons.clear),
                      decoration: const InputDecoration(
                        focusColor: secondaryColor,
                        hintText: 'Pilih Tanggal Putusan',
                        fillColor: secondaryColor,
                        labelStyle: TextStyle(
                          color: secondaryColor,
                        ),
                        hintStyle: TextStyle(
                          color: secondaryColor,
                        ),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: secondaryColor,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: secondaryColor,
                        ),
                        border: // no border
                            InputBorder.none,
                      ),
                      validator: FormBuilderValidators.required(),
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Berikut adalah detail pengajuan yang diajukan :',
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                            const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    PengutusResultInputSection(
                      controller: controller,
                      subtitleStyle: subtitleStyle(),
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                    ),
                    const SizedBox(height: 20),
                    AnalystResponsePengutus(
                      controller: controller,
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    ReviewerResponsePemutus(
                      controller: controller,
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    PengutusKeuanganSection(
                      controller: controller,
                      subtitleStyle: subtitleStyle(),
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                    ),
                    const SizedBox(height: 20),
                    PengutusKarakterSection(
                      controller: controller,
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitBisnis(
                      controller: controller,
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitUsaha(
                      controller: controller,
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitAgunan(
                      controller: controller,
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Untuk beberapa parameter dibawah ini hanya untuk tambahan saja dan tidak masuk kedalam penilaian :',
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                            const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitGallery(
                      buttonStyle: buttonStyle(),
                      iconDone: iconDone(),
                      iconNotYet: iconNotYet(),
                      subtitleStyle: subtitleStyle(),
                      controller: controller,
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitResponse(
                      controller: controller,
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.grey[200],
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GFTypography(
                                text: 'Putusan',
                                type: GFTypographyType.typo3,
                                showDivider: false,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Decision time, TERIMA / TOLAK ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.merge(
                                      const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                              ),
                              const SizedBox(height: 10),
                              FormBuilderDropdown(
                                name: 'putusan',
                                alignment: Alignment.centerLeft,
                                decoration: const InputDecoration(
                                  hintText: 'Terima / Tolak ?',
                                  border: InputBorder.none,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'DONE',
                                    child: Text('TERIMA'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'REJECTED',
                                    child: Text('TOLAK'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GFButton(
                      onPressed: () {
                        if (controller.formKey.currentState!
                            .saveAndValidate()) {
                          // controller.submit();
                          debugPrint(controller.formKey.currentState!.value
                              .toString());
                          Get.dialog(
                            AlertDialog(
                              title: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                'Tolong double check data yang telah diinputkan, apakah sudah benar ?',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              actions: [
                                GFButton(
                                  color: GFColors.DANGER,
                                  size: GFSize.LARGE,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Tidak'),
                                ),
                                GFButton(
                                  color: GFColors.SUCCESS,
                                  size: GFSize.LARGE,
                                  onPressed: () {
                                    var list =
                                        controller.formKey.currentState!.value;

                                    // Transform map to list
                                    var list2 = list.entries.toList();

                                    // // remove MapEntry and key
                                    list2.removeWhere(
                                      (element) =>
                                          element.key == 'pemutus' ||
                                          element.key == 'tglPutusan' ||
                                          element.key == 'inputan' ||
                                          element.key == 'keuangan' ||
                                          element.key == 'karakter' ||
                                          element.key == 'bisnis' ||
                                          element.key == 'usaha' ||
                                          element.key == 'agunan' ||
                                          element.key == 'berkas' ||
                                          element.key == 'putusan',
                                    );

                                    // debugPrint('list2: $list2');

                                    // Transform list2 to list of string
                                    var list3 =
                                        list2.map((e) => e.value).toList();

                                    // list3.removeWhere((element) => element.k)

                                    // transform list3 to string
                                    list3 =
                                        list3.map((e) => e.toString()).toList();

                                    controller.bahasanPemutus = list3;

                                    var listFinal = controller.bahasanPemutus;

                                    debugPrint(listFinal.toString());

                                    Navigator.pop(context);

                                    controller.savePutusan();
                                  },
                                  child: const Text('Ya'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          debugPrint('validation failed');
                        }
                      },
                      text: 'Submit',
                      shape: GFButtonShape.square,
                      color: GFColors.SUCCESS,
                      fullWidthButton: true,
                      size: GFSize.LARGE,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
