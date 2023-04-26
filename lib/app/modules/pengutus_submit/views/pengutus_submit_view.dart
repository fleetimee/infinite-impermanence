// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_analyst_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_bisnis.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_bottom_navbar.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_gallery.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_inputan.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_karakter.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_keuangan.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_reviewer_response.dart';
import 'package:akm/app/modules/pengutus_submit/widget/pengutus_submit_usaha.dart';
import 'package:akm/app/modules/reviewer_submit/widget/pengutus_submit_decision.dart';
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

  RxBool showButton = false.obs;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // User reached the bottom of the page
        showButton.value = true;
      }
    });

    return Scaffold(
      backgroundColor: Colors.pink[600],
      body: RawScrollbar(
        controller: scrollController,
        thumbColor: Colors.white,
        radius: const Radius.circular(16),
        thickness: 7,
        child: SingleChildScrollView(
          controller: scrollController,
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
                      transitionBuilder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light().copyWith(
                              primary: Colors.pink,
                            ),
                          ),
                          child: child!,
                        );
                      },
                      cursorColor: secondaryColor,
                      inputType: InputType.date,
                      style: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 16,
                      ),
                      format: DateFormat('EEEE, dd MMMM yyyy', 'id_ID'),
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
                      list: list,
                    ),
                    const SizedBox(height: 20),
                    PengutusSubmitDecision(
                      subtitleStyle: subtitleStyle(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: PengutusSubmitBottomNavBar(
        controller: controller,
        listPoints: list,
        showButton: showButton,
      ),
    );
  }
}
