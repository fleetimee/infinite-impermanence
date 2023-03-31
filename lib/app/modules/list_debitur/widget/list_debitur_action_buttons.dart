// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../controllers/list_debitur_controller.dart';

List<Widget> listDebiturActionsButtons(
  BuildContext context,
  ListDebiturController controller,
) {
  return [
    Obx(
      () => controller.isSearchPressed.value == true
          ? Row(
              children: [
                SizedBox(
                  width: 275,
                  child: FormBuilder(
                    key: controller.formKey,
                    child: FormBuilderTextField(
                      name: 'search',
                      autofocus: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Cari Nama Debitur',
                        suffixIcon: IconButton(
                            onPressed: (() => {
                                  if (controller.formKey.currentState
                                          ?.saveAndValidate() ??
                                      false)
                                    {
                                      debugPrint(controller
                                          .formKey.currentState?.value
                                          .toString())
                                    }
                                  else
                                    {
                                      debugPrint(controller
                                          .formKey.currentState?.value
                                          .toString())
                                    }
                                }),
                            icon: const Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.white,
                              size: 18,
                            )),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        alignLabelWithHint: true,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      // onChanged: (value) => controller.searchDebitur(
                      //     1.toString(), 'id,ASC', value.toString()),
                      onSubmitted: (value) {
                        controller.searchDebitur(
                            1.toString(), 'id,ASC', value.toString());
                      },
                      onSaved: (value) {
                        controller.searchDebitur(
                            1.toString(), 'id,ASC', value.toString());
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.isSearchPressed(false);
                    controller.getAllDebitur(1.toString(), 'id,ASC');
                  },
                  icon: const Icon(Icons.close),
                ),
              ]
                  .animate(interval: 50.ms)
                  .fadeIn(duration: 300.ms, delay: 200.ms)
                  .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
                  .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
            )
          : IconButton(
              onPressed: () {
                controller.isSearchPressed(true);
              },
              icon: const Icon(Icons.search),
            ),
    ),
    IconButton(
      onPressed: () {
        controller.isSearchPressed.value == true
            ? Get.snackbar(
                'Info',
                'Sort tidak bisa digunakan saat pencarian sedang aktif',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.blue,
                colorText: Colors.white,
                icon: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              )
            : showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 395,
                    color: Colors.blue.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => controller.isSortIdDesc.value == false
                              ? GFButton(
                                  onPressed: () {
                                    controller.sortByIdDesc(
                                        1.toString(), 'id,DESC');
                                    // Get.back();
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowDown91,
                                    color: Colors.white,
                                  ),
                                  // text: 'Sort by ID (Descending)',
                                  child: const Text(
                                    'Sort by ID (Descending)',
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              : GFButton(
                                  onPressed: () {
                                    controller.sortByIdAsc(
                                        1.toString(), 'id,ASC');
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  text: 'Sort by ID (Ascending)',
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowUp19,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => controller.isSortNameDesc.value == false
                              ? GFButton(
                                  onPressed: () {
                                    controller.sortByNamaDesc(
                                        1.toString(), 'peminjam1,DESC');
                                    // Get.back();
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowDownZA,
                                    color: Colors.white,
                                  ),
                                  // text: 'Sort by ID (Descending)',
                                  child: const Text(
                                    'Sort by Nama (Descending)',
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              : GFButton(
                                  onPressed: () {
                                    controller.sortByNamaAsc(
                                        1.toString(), 'peminjam1,ASC');
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  text: 'Sort by Nama (Ascending)',
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowUpAZ,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Obx(() => controller.isSortTanggalDesc.value == false
                            ? GFButton(
                                onPressed: () {
                                  controller.sortByTanggalInputDesc(
                                      1.toString(), 'tgl_sekarang,DESC');
                                  // Get.back();
                                },
                                elevation: 10,
                                size: GFSize.LARGE,
                                shape: GFButtonShape.pills,
                                fullWidthButton: true,
                                color: GFColors.FOCUS,
                                icon: const Icon(
                                  FontAwesomeIcons.arrowDownShortWide,
                                  color: Colors.white,
                                ),
                                // text: 'Sort by ID (Descending)',
                                child: const Text(
                                  'Sort by Tanggal (Descending)',
                                  textAlign: TextAlign.left,
                                ),
                              )
                            : GFButton(
                                onPressed: () {
                                  controller.sortByTanggalInputAsc(
                                      1.toString(), 'tgl_sekarang,ASC');
                                },
                                elevation: 10,
                                size: GFSize.LARGE,
                                text: 'Sort by Tanggal (Ascending)',
                                shape: GFButtonShape.pills,
                                fullWidthButton: true,
                                color: GFColors.FOCUS,
                                icon: const Icon(
                                  FontAwesomeIcons.arrowUpWideShort,
                                  color: Colors.white,
                                ),
                              )),
                        const SizedBox(height: 16),
                        Obx(
                          () => controller.isSortUmurDesc.value == false
                              ? GFButton(
                                  onPressed: () {
                                    controller.sortByUmurDesc(
                                        1.toString(), 'umur,DESC');
                                    // Get.back();
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowDown91,
                                    color: Colors.white,
                                  ),
                                  // text: 'Sort by ID (Descending)',
                                  child: const Text(
                                    'Sort by Umur (Descending)',
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              : GFButton(
                                  onPressed: () {
                                    controller.sortByUmurAsc(
                                        1.toString(), 'umur,ASC');
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  text: 'Sort by Umur (Ascending)',
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowUp19,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => controller.isSortPlafondDesc.value == false
                              ? GFButton(
                                  onPressed: () {
                                    controller.sortByPlafonDesc(1.toString(),
                                        'inputKeuangan.kredit_diusulkan,DESC');
                                    // Get.back();
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowDown91,
                                    color: Colors.white,
                                  ),
                                  // text: 'Sort by ID (Descending)',
                                  child: const Text(
                                    'Sort by Plafond (Descending)',
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              : GFButton(
                                  onPressed: () {
                                    controller.sortByPlafonAsc(1.toString(),
                                        'inputKeuangan.kredit_diusulkan,ASC');
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  text: 'Sort by Plafond (Ascending)',
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowUp19,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => controller.isSortProgressDesc.value == false
                              ? GFButton(
                                  onPressed: () {
                                    controller.sortByProgressDesc(
                                        1.toString(), 'progress,DESC');
                                    // Get.back();
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowDown91,
                                    color: Colors.white,
                                  ),
                                  // text: 'Sort by ID (Descending)',
                                  child: const Text(
                                    'Sort by Progress (Descending)',
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              : GFButton(
                                  onPressed: () {
                                    controller.sortByProgressAsc(
                                        1.toString(), 'progress,ASC');
                                  },
                                  elevation: 10,
                                  size: GFSize.LARGE,
                                  text: 'Sort by Progress (Ascending)',
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                  color: GFColors.FOCUS,
                                  icon: const Icon(
                                    FontAwesomeIcons.arrowUp19,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
      icon: const Icon(Icons.sort),
    ),
    IconButton(
      onPressed: () {
        controller.getAllDebitur(1.toString(), 'id,ASC');
      },
      icon: const Icon(
        FontAwesomeIcons.arrowsRotate,
        color: Colors.white,
        size: 20,
      ),
    ),
  ];
}
