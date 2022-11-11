// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
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
                      child: const GFCard(
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    showOverlayImage: true,
                    imageOverlay: AssetImage('assets/images/home/bannerr.jpg'),
                    title: GFListTile(
                      title: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(
                              delay: 300.ms,
                              duration:
                                  600.ms) // runs after the above w/new duration
                      // inherits the delay & duration from move,
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
                              const Center(
                                child: GFImageOverlay(
                                  height: 200,
                                  width: 350,
                                  shape: BoxShape.rectangle,
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/17/bb/14/17bb14d09f89ccc0efb7c30c3b49c926.jpg'),
                                  boxFit: BoxFit.cover,
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
