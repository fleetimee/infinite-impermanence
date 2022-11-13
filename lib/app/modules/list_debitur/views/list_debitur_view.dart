// 🐦 Flutter imports:
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/list_debitur_controller.dart';

class ListDebiturView extends GetView<ListDebiturController> {
  ListDebiturView({Key? key}) : super(key: key);

  var umur = '';
  var asal = '';
  var tanggal = '';
  var plafond = '';
  var jenisUsaha = '';

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
      ),
      appBar: AppBar(
        // convert automaticallyimplyleading to widget

        title: Obx(() => controller.isSearchPressed.value == true
            ? const Text('')
            : const Text('Search')),
        actions: [
          Obx(() => controller.isSearchPressed.value == true
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
                      .shimmer(
                          blendMode: BlendMode.srcOver, color: Colors.white12)
                      .move(
                          begin: const Offset(-16, 0),
                          curve: Curves.easeOutQuad),
                )
              : IconButton(
                  onPressed: () {
                    controller.isSearchPressed(true);
                  },
                  icon: const Icon(Icons.search),
                )),
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
                              Obx(() => controller.isSortTanggalDesc.value ==
                                      false
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
                                () =>
                                    controller.isSortPlafondDesc.value == false
                                        ? GFButton(
                                            onPressed: () {
                                              controller.sortByPlafonDesc(
                                                  1.toString(),
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
                                              controller.sortByPlafonAsc(
                                                  1.toString(),
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
                                () => controller.isSortProgressDesc.value ==
                                        false
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
              ))
        ],
      ),
      body: Obx(
        () {
          if (controller.isDataProcessing.value) {
            return const Center(
              child: SataniaLoading(),
            );
          } else {
            if (controller.listDebitur.isNotEmpty) {
              return Column(
                children: [
                  Animate(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      showOverlayImage: true,
                      imageOverlay: const AssetImage(
                        'assets/images/home/kantor-cabang.png',
                      ),
                      colorFilter: const ColorFilter.mode(
                        Color.fromARGB(136, 0, 0, 0),
                        BlendMode.darken,
                      ),
                      title: GFListTile(
                        // color: // White with opactity
                        //     Colors.white.withOpacity(0.5),
                        title: Text(
                          'Ada ${controller.listDebitur.length} debitur yang terdaftar',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 47,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: const Text(
                        'Klik tombol details untuk mulai menginputkan data analisa debitur',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
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
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.listDebitur.length,
                        itemBuilder: (context, index) {
                          if (index == controller.listDebitur.length - 1 &&
                              controller.isMoreDataAvailable.value == true) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  GFListTile(
                                    avatar: GFAvatar(
                                      shape: GFAvatarShape.standard,
                                      backgroundColor: primaryColor,
                                      radius: 40,
                                      child: Text(
                                        controller.listDebitur[index].peminjam1
                                                ?.substring(0, 1)
                                                .toUpperCase() ??
                                            '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    color: secondaryColor,
                                    description: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.calendarCheck,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              DateFormat('dd MMMM yyyy').format(
                                                DateTime.parse(
                                                  controller.listDebitur[index]
                                                      .tglSekarang!
                                                      .toString(),
                                                ),
                                              ),
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .listDebitur[index].peminjam1!,
                                          style: const TextStyle(
                                              color: primaryColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start, // aligns the text to the left
                                            children: [
                                              Row(
                                                children: [
                                                  GFButtonBadge(
                                                    size: 1,
                                                    onPressed: null,
                                                    text:
                                                        '${((double.parse(controller.listDebitur[index].progress.toString())) * 100).toStringAsFixed(0)}%',
                                                    color: GFColors.SUCCESS,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  GFButtonBadge(
                                                    size: 1,
                                                    onPressed: null,
                                                    text: controller
                                                                .listDebitur[
                                                                    index]
                                                                .inputKeuangan ==
                                                            null
                                                        ? 'Belum Input'
                                                        : '${controller.listDebitur[index].inputKeuangan!.digunakanUntuk}',
                                                    color: GFColors.WARNING,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const GFButtonBadge(
                                                    size: 1,
                                                    onPressed: null,
                                                    text: 'UMKM',
                                                    color: GFColors.INFO,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  GFButtonBadge(
                                                    size: 1,
                                                    onPressed: null,
                                                    text:
                                                        '${controller.listDebitur[index].jenisUsaha}',
                                                    color: GFColors.DANGER,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    focusColor: primaryColor,
                                    subTitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Usaha',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(width: 8),
                                            SizedBox(
                                              width: 160,
                                              child: Text(
                                                ': ${controller.listDebitur[index].bidangUsaha!}',
                                                style: const TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Umur',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              ': ${controller.listDebitur[index].umur!}',
                                              style: const TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Asal',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(width: 25),
                                            Text(
                                              ': ${controller.listDebitur[index].ktp1!}',
                                              style: const TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Plafon',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              ': ${controller.listDebitur[index].inputKeuangan == null ? 'Belum Input' : MoneyMaskedTextController(
                                                  decimalSeparator: '',
                                                  thousandSeparator: '.',
                                                  leftSymbol: 'Rp ',
                                                  precision: 0,
                                                  initialValue: double.parse(
                                                      controller
                                                          .listDebitur[index]
                                                          .inputKeuangan!
                                                          .kreditDiusulkan
                                                          .toString()),
                                                ).text}',
                                              style: const TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    icon: GFButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.INSIGHT_DEBITUR,
                                            arguments: controller
                                                .listDebitur[index].id);
                                      },
                                      text: 'Details',
                                      color: primaryColor,
                                      type: GFButtonType.outline,
                                    ),
                                  ),
                                ].animate(
                                  interval: 100.ms,
                                  effects: [
                                    const FadeEffect(),
                                    const ScaleEffect(),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: EmptyWidget(
                  image: 'assets/images/home/satania-crying.png',
                  title: 'Tidak ada data',
                  titleTextStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: secondaryColor,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: secondaryColor,
                  ),
                  hideBackgroundAnimation: true,
                  subTitle:
                      'Tidak ada data debitur yang terdaftar atau koneksi internet bermasalah',
                ),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                height: 750,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilder(
                      key: controller.filterKey,
                      skipDisabled: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Umur',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller.isFilterUmurPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterUmurPressed.value =
                                        value!;
                                    if (controller.isFilterUmurPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['umur']
                                          ?.reset();
                                      controller.filterUmurInput.clear();
                                      umur = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderTextField(
                                    name: 'umur',
                                    controller: controller.filterUmurInput,
                                    decoration: const InputDecoration(
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.odnoklassniki),
                                      hintText: 'Filter berdasarkan Umur',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    enabled:
                                        controller.isFilterUmurPressed.value,

                                    onSaved: (value) {
                                      if (value != '') {
                                        umur =
                                            '${'&filter'}=umur||${'eq'}||$value';
                                      }
                                    },

                                    // onSubmitted: (value) {
                                    //   umur =
                                    //       '${'&filter'}=umur||${'eq'}||$value';
                                    // },
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Domisili',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller.isFilterAsalPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterAsalPressed.value =
                                        value!;

                                    if (controller.isFilterAsalPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['domisili']
                                          ?.reset();
                                      controller.filterDomisiliInput.clear();
                                      asal = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderSearchableDropdown<String>(
                                    name: 'domisili',
                                    enabled:
                                        controller.isFilterAsalPressed.value,

                                    onSaved: (value) {
                                      if (value != null) {
                                        asal =
                                            '${'&filter'}=ktp1||${'eq'}||$value';
                                      }
                                    },
                                    // onChanged: (value) {
                                    //   asal =
                                    //       '${'&filter'}=ktp1||${'eq'}||$value';
                                    // },

                                    items: allProvinsi,
                                    popupProps: const PopupProps.menu(
                                        showSearchBox: true),
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      hintText: 'Search',
                                      labelText: 'Search',
                                    ),
                                    filterFn: (provinsi, filter) => provinsi
                                        .toLowerCase()
                                        .contains(filter.toLowerCase()),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18),
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.addressBook),
                                      hintText: 'Filter berdasarkan Domisili',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Tanggal',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value:
                                      controller.isFilterTanggalPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterTanggalPressed.value =
                                        value!;

                                    if (controller
                                            .isFilterTanggalPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['date']
                                          ?.reset();
                                      controller.filterRangeTanggalInput
                                          .clear();
                                      tanggal = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderDateRangePicker(
                                    name: 'date',
                                    // valueTransformer: (value) {
                                    //   if (value != null) {
                                    //     tanggal =
                                    //         '${'&filter'}=tanggal||${'eq'}||${value.start.toIso8601String()}||${'and'}||${'tanggal'}||${'eq'}||${value.end.toIso8601String()}';
                                    //   }
                                    // },
                                    currentDate: DateTime.now(),
                                    format: DateFormat('dd MMMM yyyy'),
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2050),
                                    onChanged: (value) {
                                      debugPrint(value.toString());
                                    },
                                    onSaved: (value) {
                                      if (value != null) {
                                        tanggal =
                                            '${'&filter'}=tgl_sekarang||${'between'}||${value.start.toIso8601String()},${value.end.toIso8601String()}';
                                      }
                                    },
                                    enableInteractiveSelection: true,
                                    enabled:
                                        controller.isFilterTanggalPressed.value,
                                    decoration: const InputDecoration(
                                      hintText: 'Filter berdasarkan Tanggal',
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.calendar),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Jenis Usaha',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Row(
                              children: [
                                Checkbox(
                                  value: controller
                                      .isFilterJenisUsahaPressed.value,
                                  onChanged: (value) {
                                    controller.isFilterJenisUsahaPressed.value =
                                        value!;

                                    if (controller
                                            .isFilterJenisUsahaPressed.value ==
                                        false) {
                                      controller.filterKey.currentState!
                                          .fields['jenis_usaha']
                                          ?.reset();
                                      controller.filterJenisUsaha.clear();
                                      jenisUsaha = '';
                                    }
                                    // umur = '${'&filter'}=umur||${'eq'}||$value';
                                    debugPrint(value.toString());
                                  },
                                ),
                                Expanded(
                                  child: FormBuilderSearchableDropdown<String>(
                                    name: 'jenis_usaha',
                                    enabled: controller
                                        .isFilterJenisUsahaPressed.value,
                                    onSaved: (value) {
                                      if (value != null) {
                                        jenisUsaha =
                                            '${'&filter'}=jenis_usaha||${'eq'}||$value';
                                      }
                                    },
                                    // onChanged: (value) {
                                    //   jenisUsaha =
                                    //       '${'&filter'}=jenis_usaha||${'eq'}||$value';
                                    // },
                                    items: jenisUsahaList,
                                    popupProps: const PopupProps.menu(
                                        showSearchBox: true),
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      hintText: 'Search',
                                      labelText: 'Search',
                                    ),
                                    filterFn: (jenisUsaha, filter) => jenisUsaha
                                        .toLowerCase()
                                        .contains(filter.toLowerCase()),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18),
                                      prefixIcon:
                                          Icon(FontAwesomeIcons.tractor),
                                      hintText:
                                          'Filter berdasarkan Jenis Usaha',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Plafond',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Column(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: controller
                                          .isFilterPlafondPressed.value,
                                      onChanged: (value) {
                                        controller.isFilterPlafondPressed
                                            .value = value!;

                                        if (controller
                                                .isFilterPlafondPressed.value ==
                                            false) {
                                          controller.filterKey.currentState!
                                              .fields['plafond']
                                              ?.reset();
                                          controller.filterPlafondInput.clear();
                                          plafond = '';
                                        }
                                        // umur = '${'&filter'}=umur||${'eq'}||$value';
                                        debugPrint(value.toString());
                                      },
                                    ),
                                    Expanded(
                                      // child: FormBuilderDateRangePicker(
                                      //   name: 'date',
                                      //   // valueTransformer: (value) {
                                      //   //   if (value != null) {
                                      //   //     tanggal =
                                      //   //         '${'&filter'}=tanggal||${'eq'}||${value.start.toIso8601String()}||${'and'}||${'tanggal'}||${'eq'}||${value.end.toIso8601String()}';
                                      //   //   }
                                      //   // },
                                      //   currentDate: DateTime.now(),
                                      //   format: DateFormat('dd MMMM yyyy'),
                                      //   firstDate: DateTime(1970),
                                      //   lastDate: DateTime(2050),
                                      //   onChanged: (value) {
                                      //     debugPrint(value.toString());
                                      //   },
                                      //   onSaved: (value) {
                                      //     if (value != null) {
                                      //       tanggal =
                                      //           '${'&filter'}=tgl_sekarang||${'between'}||${value.start.toIso8601String()},${value.end.toIso8601String()}';
                                      //     }
                                      //   },
                                      //   enableInteractiveSelection: true,
                                      //   enabled: controller
                                      //       .isFilterTanggalPressed.value,
                                      //   decoration: const InputDecoration(
                                      //     hintText:
                                      //         'Filter berdasarkan Tanggal',
                                      //     prefixIcon:
                                      //         Icon(FontAwesomeIcons.calendar),
                                      //     border: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(10),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // child: FormBuilderRangeSlider(
                                      //   name: 'plafond',
                                      //   min: 0.0,
                                      //   max: 100.0,
                                      //   enabled:
                                      //       controller.isFilterPlafondPressed.value,
                                      //   divisions: 100,
                                      //   onChanged: (value) {
                                      //     debugPrint(value.toString());
                                      //   },
                                      //   onSaved: (value) {
                                      //     // if (value != null) {
                                      //     //   plafond =
                                      //     //       '${'&filter'}=plafond||${'between'}||${value.start},${value.end}';
                                      //     // }
                                      //   },
                                      //   decoration: const InputDecoration(
                                      //     hintText: 'Filter berdasarkan Plafond',
                                      //     prefixIcon:
                                      //         Icon(FontAwesomeIcons.moneyBill),
                                      //     border: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.all(
                                      //         Radius.circular(10),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      child: FormBuilderRangeSlider(
                                        name: 'plafond',
                                        enabled: controller
                                            .isFilterPlafondPressed.value,
                                        // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                                        // onChanged: _onChanged,
                                        initialValue: const RangeValues(0, 100),

                                        min: 0.0,
                                        max: 1000000000.0,
                                        displayValues: DisplayValues.current,
                                        divisions: 200,
                                        onChanged: (value) {
                                          debugPrint(value.toString());
                                        },

                                        numberFormat:
                                            NumberFormat.simpleCurrency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          name: 'Rp. ',
                                        ),
                                        activeColor: primaryColor,

                                        inactiveColor: Colors.pink[100],
                                        onSaved: (value) {
                                          if (value ==
                                              const RangeValues(0, 100)) {
                                            plafond = '';
                                          } else {
                                            plafond =
                                                '${'&filter'}=inputKeuangan.kredit_diusulkan||${'between'}||${value?.start.toStringAsFixed(0)},${value?.end.toStringAsFixed(0)}';
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Range Plafond',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GFButton(
                          onPressed: () {
                            if (controller.filterKey.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              controller.filter(1.toString(), 'id,ASC', umur,
                                  asal, tanggal, plafond, jenisUsaha);
                              Get.back();
                              debugPrint(controller
                                  .filterKey.currentState?.value
                                  .toString());
                            } else {
                              debugPrint(controller
                                  .filterKey.currentState?.value
                                  .toString());
                            }
                          },
                          fullWidthButton: true,
                          color: primaryColor,
                          text: 'Filter',
                          size: GFSize.LARGE,
                          shape: GFButtonShape.pills,
                        ),
                        GFButton(
                          onPressed: () {
                            controller.getAllDebitur(1.toString(), 'id,ASC');
                            controller.isFilterAsalPressed(false);
                            controller.isFilterUmurPressed(false);
                            controller.isFilterTanggalPressed(false);
                            controller.isFilterPlafondPressed(false);
                            controller.isFilterJenisUsahaPressed(false);

                            Get.back();
                          },
                          text: 'Reset',
                          size: GFSize.LARGE,
                          shape: GFButtonShape.pills,
                          type: GFButtonType.outline,
                          fullWidthButton: true,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        label: const Text('Filter'),
        icon: const Icon(FontAwesomeIcons.filter),
        backgroundColor: primaryColor,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}

class SataniaLoading extends StatelessWidget {
  const SataniaLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFLoader(
          type: GFLoaderType.custom,
          child: ClipOval(
              child: const Image(
            image: AssetImage(
              'assets/images/home/logo.png',
            ),
            height: 250,
          )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color: secondaryColor)
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                  .slide()),
        ),
      ],
    );
  }
}
