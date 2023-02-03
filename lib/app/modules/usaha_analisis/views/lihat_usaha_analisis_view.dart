// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/usaha_analisis_controller.dart';

class LihatUsahaAnalisisView extends GetView<UsahaAnalisisController> {
  LihatUsahaAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Usaha'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      title: 'Konfirmasi',
                      bodyHeaderDistance: 25,
                      desc: 'Apakah yakin untuk menghapus item ini ?',
                      btnOkOnPress: () {
                        controller
                            .deleteAnalisaUsaha(data.analisaJenisUsaha.id);
                        Get.back();
                      },
                      btnOkText: 'Oke sip',
                      btnCancelText: 'Affa iyh',
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidTrashCan,
            ),
          )
        ],
      ),
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Animate(
                      child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        'assets/images/home/bannerr.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 200,
                      )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 600.ms),
                    ),
                  ) // runs after the above w/new duration
                      // inherits the delay & duration from move,
                      ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.jenisUsahaDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.merge(const TextStyle(
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'jenis_usaha',
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Usaha',
                      border: OutlineInputBorder(),
                    ),
                    controller: controller.jenisUsaha = TextEditingController(
                      text: data.jenisUsaha,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // FormBuilderTextField(
                  //   name: 'crr_jenis_usaha',
                  //   enabled: false,
                  //   controller: controller.crrJenisUsaha =
                  //       TextEditingController(
                  //     text: data.analisaJenisUsaha.totalCrrUsaha.toString(),
                  //   ),
                  //   decoration: const InputDecoration(
                  //       labelText: 'CRR Jenis Usaha',
                  //       border: OutlineInputBorder()),
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Visibility(
                    visible: false,
                    child: FormBuilderTextField(
                      name: 'debiturId',
                      controller: controller.debiturId = TextEditingController(
                        text: data.id.toString(),
                      ),
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Debitur',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              GFButton(
                onPressed: () {
                  showBarModalBottomSheet(
                    backgroundColor: secondaryColor,
                    bounce: true,
                    context: context,
                    builder: (context) {
                      controller.hitungCrrUsaha();
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: FormBuilder(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Center(
                                child: Text(
                                  'Beriku adalah rincian',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'CRR Jenis Usaha 🎉🎉🎉',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Lottie.asset(
                                  'assets/images/home/jenis_usaha_promp.zip',
                                  frameRate: FrameRate.max,
                                  height: 280,
                                  fit: BoxFit.cover,
                                  repeat: true,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text(
                                      'Gagal memuat animasi',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  'Total CRR : ${data.analisaJenisUsaha.totalCrrUsaha}',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                text: 'Lihat Hasil',
                color: primaryColor,
                size: GFSize.LARGE,
                fullWidthButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
