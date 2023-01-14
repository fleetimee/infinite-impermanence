// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/ijin_legitimasi_controller.dart';

class LihatIjinLegitimasiView extends GetView<IjinLegitimasiController> {
  LihatIjinLegitimasiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Ijin Legitimasi'),
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
                        controller.deleteInputIjinLegitimasi(
                            data.id, data.ijinLegitimasi.id);
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
                    controller.jenisIjinKeterangan,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'jenisIjinLegitimasi',
                    readOnly: true,
                    controller: controller.jenisIjinLegitimasi =
                        TextEditingController(
                      text: data.ijinLegitimasi.jenisIjin,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidFileLines,
                      ),
                      labelText: 'Jenis Ijin',
                      border: OutlineInputBorder(),
                      hintText: 'Surat Keterangan Usaha',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.keteranganDeskripsi,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.merge(const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    name: 'keteranganIjinLegitimasi',
                    readOnly: true,
                    controller: controller.keteranganIjinLegitimasi =
                        TextEditingController(
                            text: data.ijinLegitimasi.keteranganIjin),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      labelText: 'Keterangan',
                      border: OutlineInputBorder(),
                      hintText: '107/UU/NGT/III/2022',
                    ),
                  ),
                ],
              ),
              // GFButton(
              //   onPressed: () {
              //     if (controller.formKey.currentState?.saveAndValidate() ??
              //         false) {
              //       controller.saveInputIjinLegitimasi(data.id);
              //       Get.back();
              //       debugPrint(
              //           controller.formKey.currentState?.value.toString());
              //     } else {
              //       debugPrint(
              //           controller.formKey.currentState?.value.toString());
              //       debugPrint('validation failed');
              //     }
              //   },
              //   text: 'Simpan',
              //   color: primaryColor,
              //   size: GFSize.LARGE,
              //   fullWidthButton: true,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
