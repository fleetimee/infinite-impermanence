// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/list_debitur/views/list_debitur_view.dart';
import 'package:akm/app/routes/app_pages.dart';
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
          actions: [
            Obx(() {
              if (controller.isSyaratLainInputProcessing.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () {
                    showBarModalBottomSheet(
                      clipBehavior: Clip.antiAlias,
                      bounce: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      settings: RouteSettings(
                          name: Routes.LIST_SYARAT_LAINNYA, arguments: data),
                      builder: (context) => FormTambahSyaratLainnya(),
                    );
                  },
                  icon: const Icon(FontAwesomeIcons.plus),
                );
              }
            })
          ],
        ),
        body: Obx(
          () {
            if (controller.isSyaratLainInputProcessing.value) {
              return const Center(
                child: BpdDiyLoader(),
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
                                  showBarModalBottomSheet(
                                    clipBehavior: Clip.antiAlias,
                                    bounce: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    context: context,
                                    settings: RouteSettings(
                                        name: Routes.LIST_SYARAT_LAINNYA,
                                        arguments: [
                                          controller.listSyaratLainnya[index],
                                          index,
                                        ]),
                                    builder: (context) =>
                                        FormUbahSyaratLainnya(),
                                  )
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
                                    desc:
                                        'Apakah yakin untuk menghapus item ini ?',
                                    btnOkOnPress: () {
                                      controller.deleteSyaratLainnya(
                                          data,
                                          controller
                                              .listSyaratLainnya[index].id);
                                    },
                                    btnOkText: 'Oke sip',
                                    btnCancelText: 'Affa iyh',
                                    btnCancelOnPress: () {},
                                  ).show()
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
                          avatar: GFAvatar(
                            backgroundColor: primaryColor,
                            child: Text(
                              '# ${index + 1}',
                              style: const TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.listSyaratLainnya[index].keterangan}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'Tidak ada data',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Lottie.asset(
                            'assets/images/home/404.zip',
                            frameRate: FrameRate.max,
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
                        const Center(
                          child: Text(
                            'Tidak ada data yang ditemukan atau syarat lainnya belum diinputkan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: secondaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}

class FormUbahSyaratLainnya extends StatelessWidget {
  FormUbahSyaratLainnya({Key? key}) : super(key: key);

  final controller = Get.put(ListSyaratLainnyaController());
  final data = Get.arguments[0];
  final index = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Form Ubah Syarat Lainnya',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              FormBuilder(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: FormUpdateSyaratLainnya(controller: controller),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: GFButton(
                onPressed: () {
                  if (controller.formKey.currentState?.saveAndValidate() ??
                      false) {
                    controller.updateSyaratLainnya(
                        data.debiturId,
                        int.parse(
                            controller.listSyaratLainnya[index].id.toString()));
                    Get.back();
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                  } else {
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                    debugPrint('validation failed');
                  }
                },
                text: 'Simpan',
                color: primaryColor,
                fullWidthButton: true,
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormUpdateSyaratLainnya extends StatelessWidget {
  FormUpdateSyaratLainnya({Key? key, required this.controller})
      : super(key: key);

  final ListSyaratLainnyaController controller;
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Syarat Lainnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'deskripsi_pendek',
                maxLines: 3,
                initialValue: data[0].keterangan.toString(),
                decoration: const InputDecoration(
                  labelText: 'Syarat',
                  alignLabelWithHint: true,
                  hintText: 'Memiliki rekening tabungan di PT BANK BPD DIY',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FormTambahSyaratLainnya extends StatelessWidget {
  FormTambahSyaratLainnya({Key? key}) : super(key: key);

  final controller = Get.put(ListSyaratLainnyaController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Form Tambah Syarat Lainnya',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              FormBuilder(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: FormInputSyaratLainnya(controller: controller),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: GFButton(
                onPressed: () {
                  if (controller.formKey.currentState?.saveAndValidate() ??
                      false) {
                    controller.saveSyaratlainnya(data);
                    Get.back();
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                  } else {
                    debugPrint(
                        controller.formKey.currentState?.value.toString());
                    debugPrint('validation failed');
                  }
                },
                text: 'Simpan',
                color: primaryColor,
                fullWidthButton: true,
                elevation: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormInputSyaratLainnya extends StatelessWidget {
  FormInputSyaratLainnya({Key? key, required this.controller})
      : super(key: key);

  final ListSyaratLainnyaController controller;
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Syarat Lainnya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'deskripsi_pendek',
                maxLines: 3,
                controller: controller.keterangan,
                decoration: const InputDecoration(
                  labelText: 'Syarat',
                  alignLabelWithHint: true,
                  hintText: 'Memiliki rekening tabungan di PT BANK BPD DIY',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
