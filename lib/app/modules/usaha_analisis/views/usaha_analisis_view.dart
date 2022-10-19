// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/usaha_analisis_controller.dart';

class UsahaAnalisisView extends GetView<UsahaAnalisisController> {
  UsahaAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Usaha'),
        centerTitle: true,
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
                    imageOverlay: NetworkImage(
                      'https://i0.wp.com/www.animegeek.com/wp-content/uploads/2022/08/Lycoris-Recoil-Season-2-release-date-Anime.jpg?resize=1024%2C576&ssl=1',
                    ),
                    colorFilter: ColorFilter.mode(
                      Color.fromARGB(136, 0, 0, 0),
                      BlendMode.darken,
                    ),
                    title: GFListTile(
                      title: Text(
                        'Jenis',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Text(
                      'Usaha',
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
                  Visibility(
                    visible: false,
                    child: FormBuilderTextField(
                      name: 'debiturId',
                      controller: controller.debiturId = TextEditingController(
                        text: data.id.toString(),
                      ),
                      enabled: false,
                      decoration: const InputDecoration(
                          labelText: 'Debitur', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton.icon(
              //         icon: const Icon(Icons.add),
              //         label: const Text("Hitung CRR"),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: primaryColor,
              //           shape: const StadiumBorder(),
              //         ),
              //         onPressed: () {
              //           if (controller.formKey.currentState
              //                   ?.saveAndValidate() ??
              //               false) {
              //             debugPrint(controller.formKey.currentState?.value
              //                 .toString());
              //             controller.hitungCrrUsaha();
              //           } else {
              //             debugPrint(controller.formKey.currentState?.value
              //                 .toString());
              //             debugPrint('validation failed');
              //           }
              //         },
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 5.0,
              //     ),
              //     Expanded(
              //       child: ElevatedButton.icon(
              //         icon: const Icon(Icons.add),
              //         label: const Text("Submit"),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: primaryColor,
              //           shape: const StadiumBorder(),
              //         ),
              //         onPressed: () {
              //           if (controller.formKey.currentState
              //                   ?.saveAndValidate() ??
              //               false) {
              //             debugPrint(controller.formKey.currentState?.value
              //                 .toString());
              //             controller.saveAnalisaUsaha();
              //             Get.back();
              //           } else {
              //             debugPrint(controller.formKey.currentState?.value
              //                 .toString());
              //             debugPrint('validation failed');
              //           }
              //         },
              //       ),
              //     ),
              //   ],
              // ),
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
                                  'Yeay berhasil mendapatkan',
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
                                  'Total CRR : ${controller.crrJenisUsaha.text}',
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GFButton(
                                onPressed: () {
                                  if (controller.formKey.currentState
                                          ?.saveAndValidate() ??
                                      false) {
                                    controller.saveAnalisaUsaha();
                                    Get.back();
                                    Get.back();
                                    debugPrint(controller
                                        .formKey.currentState?.value
                                        .toString());
                                  } else {
                                    debugPrint(controller
                                        .formKey.currentState?.value
                                        .toString());
                                    debugPrint('validation failed');
                                  }
                                },
                                text: 'Simpan',
                                color: primaryColor,
                                size: GFSize.LARGE,
                                fullWidthButton: true,
                              )
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
