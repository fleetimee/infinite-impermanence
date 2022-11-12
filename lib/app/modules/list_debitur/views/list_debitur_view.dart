// 🐦 Flutter imports:
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  const ListDebiturView({Key? key}) : super(key: key);
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
                      width: 325,
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
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 285,
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
                                    color: GFColors.INFO,
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
                                    color: GFColors.INFO,
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
                                    color: GFColors.SECONDARY,
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
                                    color: GFColors.SECONDARY,
                                    icon: const Icon(
                                      FontAwesomeIcons.arrowUpAZ,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => controller.isSortTanggalDesc.value == false
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
                                    color: GFColors.SUCCESS,
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
                                    color: GFColors.SUCCESS,
                                    icon: const Icon(
                                      FontAwesomeIcons.arrowUpWideShort,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
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
                                    color: GFColors.DANGER,
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
                                    color: GFColors.DANGER,
                                    icon: const Icon(
                                      FontAwesomeIcons.arrowUp19,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.sort),
          ),
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
                                    avatar: const GFAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://avatars.githubusercontent.com/u/68892527?v=4',
                                      ),
                                      shape: GFAvatarShape.circle,
                                    ),
                                    color: secondaryColor,
                                    description: Text(
                                      'Tanggal Input : ${DateFormat('dd MMMM yyyy').format(
                                        DateTime.parse(
                                          controller
                                              .listDebitur[index].tglSekarang!
                                              .toString(),
                                        ),
                                      )}',
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    title: Text(
                                      controller.listDebitur[index].peminjam1!,
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    focusColor: primaryColor,
                                    subTitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Usaha : ${controller.listDebitur[index].bidangUsaha!}',
                                          style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          'Umur : ${controller.listDebitur[index].umur!}',
                                          style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
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
        onPressed: () {},
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
