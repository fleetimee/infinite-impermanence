// 🐦 Flutter imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';

class HomeSearchNik extends StatelessWidget {
  final HomeController controller;

  const HomeSearchNik({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          color: blue400,
          elevation: 10,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/home/main_page/search.png", // Replace with your image asset
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Pencarian Berdasarkan Nomor Induk Kependudukan',
                        style: TextStyle(
                          fontSize: 30,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NikSearchForm(controller: controller),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GFButton(
                          text: 'Cari',
                          fullWidthButton: true,
                          color: primaryColor,
                          onPressed: () {},
                          size: GFSize.LARGE,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NikSearchResult(
                    controller: controller,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NikSearchResult extends StatelessWidget {
  const NikSearchResult({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.isSearchNikProcessing.value) {
            return const Center(
              child: BpdDiyLoader(),
            );
          } else {
            if (controller.listSearchNik.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      // add custom google font
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: controller.listSearchNik.length,
                itemBuilder: (context, index) {
                  return GFListTile(
                    color: Colors.black.withOpacity(0.5),
                    title: Text(
                      controller.listSearchNik[index].peminjam1!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    subTitle: Text(
                      controller.listSearchNik[index].bidangUsaha!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                    icon: GFButton(
                      onPressed: () {
                        // controller
                        //     .getDetailNik(controller
                        //         .listSearchNik[index]
                        //         .nik!)
                        //     .then((value) {
                        //   Get.toNamed(
                        //       '/detailNik/${controller.listSearchNik[index].nik}');
                        // });
                        controller.listSearchNik[index].userId ==
                                auth.currentUser?.uid
                            ? Get.toNamed(Routes.INSIGHT_DEBITUR,
                                arguments: controller.listSearchNik[index].id)
                            : AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.bottomSlide,
                                    title: 'Error',
                                    desc:
                                        'Anda tidak memiliki akses untuk melihat detail debitur ini',
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.red)
                                .show();
                      },
                      text: 'Detail',
                      color: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

class NikSearchForm extends StatelessWidget {
  const NikSearchForm({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: FormBuilderTextField(
        name: 'nik',
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // add custom google font
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        onEditingComplete: () {
          controller.searchNik(controller.nik.text);
        },
        controller: controller.nik,
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const Icon(
            Icons.numbers_outlined,
            color: Colors.black,
            size: 25,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.searchNik(controller.nik.text);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
          focusColor: Colors.red,
          fillColor: Colors.grey.shade300,
          hoverColor: Colors.red,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: 'Masukkan NIK',
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            // add custom google font
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
