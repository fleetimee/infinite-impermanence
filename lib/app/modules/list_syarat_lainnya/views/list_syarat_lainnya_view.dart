import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:numerus/numerus.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../controllers/list_syarat_lainnya_controller.dart';

class ListSyaratLainnyaView extends GetView<ListSyaratLainnyaController> {
  ListSyaratLainnyaView({Key? key}) : super(key: key);

  final data = Get.arguments;

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
          title: const Text('Syarat - Syarat'),
          centerTitle: true,
        ),
        body: Obx(
          () {
            if (controller.isSyaratLainInputProcessing.value) {
              return const Center(
                child: SataniaLoading(),
              );
            } else {
              if (controller.listSyaratLainnya.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.listSyaratLainnya.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(20),
                            padding: const EdgeInsets.all(10),
                            spacing: 10,
                            onPressed: ((context) => {
                                  // showBarModalBottomSheet(
                                  //   clipBehavior: Clip.antiAlias,
                                  //   bounce: true,
                                  //   shape: const RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.vertical(
                                  //       top: Radius.circular(20),
                                  //     ),
                                  //   ),
                                  //   context: context,
                                  //   settings: RouteSettings(
                                  //       name: Routes.LIST_AGUNAN_CASH,
                                  //       arguments: [
                                  //         controller.listAgunanPeralatan[index],
                                  //         index,
                                  //       ]),
                                  //   builder: (context) =>
                                  //       FormUbahAgunanPeralatan(),
                                  //   isDismissible: false,
                                  // )
                                }),
                            backgroundColor: GFColors.WARNING,
                            foregroundColor: Colors.white,
                            icon: FontAwesomeIcons.pen,
                            label: 'Ubah',
                          ),
                          SlidableAction(
                            borderRadius: BorderRadius.circular(20),
                            padding: const EdgeInsets.all(10),
                            spacing: 10,
                            onPressed: ((context) => {
                                  // AwesomeDialog(
                                  //   context: Get.context!,
                                  //   dialogType: DialogType.question,
                                  //   animType: AnimType.bottomSlide,
                                  //   dialogBackgroundColor: primaryColor,
                                  //   titleTextStyle: GoogleFonts.poppins(
                                  //     color: secondaryColor,
                                  //     fontSize: 30,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  //   descTextStyle: GoogleFonts.poppins(
                                  //     color: secondaryColor,
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.w400,
                                  //   ),
                                  //   title: 'Konfirmasi',
                                  //   bodyHeaderDistance: 25,
                                  //   desc:
                                  //       'Apakah yakin untuk menghapus item ini ?',
                                  //   btnOkOnPress: () {
                                  //     controller.deleteAgunanPeralatan(
                                  //         data.id,
                                  //         controller
                                  //             .listAgunanPeralatan[index].id);
                                  //   },
                                  //   btnOkText: 'Oke sip',
                                  //   btnCancelText: 'Affa iyh',
                                  //   btnCancelOnPress: () {},
                                  // ).show()
                                }),
                            backgroundColor: GFColors.DANGER,
                            foregroundColor: Colors.white,
                            icon: FontAwesomeIcons.trash,
                            label: 'Hapus',
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GFListTile(
                          color: secondaryColor,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Agunan Peralatan ${(index + 1).toRomanNumeralString()}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          ),
                          subTitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'DATA JAMINAN',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                controller.listSyaratLainnya[index].keterangan
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
                        'Tidak ada data syarat lainnya yang terdaftar atau koneksi internet bermasalah',
                  ),
                );
              }
            }
          },
        ));
  }
}
