import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

import '../controllers/media_controller.dart';

class MediaView extends GetView<MediaController> {
  MediaView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Gambar'),
      ),
      body: FormBuilder(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Animate(
                      child: const GFCard(
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    showOverlayImage: true,
                    imageOverlay: AssetImage(
                      'assets/images/home/bi_fast.png',
                    ),
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
                    name: 'keterangan',
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidFileLines,
                      ),
                      labelText: 'Keterangan',
                      border: OutlineInputBorder(),
                      hintText: 'Gambar / Dokumen',
                    ),
                    controller: controller.keterangan,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderImagePicker(
                    name: 'file',
                    bottomSheetPadding: const EdgeInsets.all(16),
                    fit: BoxFit.cover,
                    cameraLabel: const Text('Ambil Foto'),
                    previewAutoSizeWidth: true,
                    galleryLabel: const Text('Pilih dari Galeri'),
                    loadingWidget: ((context) => const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )),
                    placeholderWidget: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Lottie.asset(
                              'assets/images/home/upload-files.zip',
                              frameRate: FrameRate.max,
                              height: 112,
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
                              'Klik untuk memilih gambar / dokumen ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    imageQuality: 50,
                    showDecoration: true,
                    maxImages: 1,
                    validator: FormBuilderValidators.required(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gambar / Dokumen',
                    ),
                  )
                ],
              ),
              Obx(
                () => GFButton(
                  color: primaryColor,
                  size: GFSize.LARGE,
                  fullWidthButton: true,
                  onPressed: () {
                    if (controller.formKey.currentState?.saveAndValidate() ??
                        false) {
                      controller.saveMedia(data.id);
                    } else {
                      debugPrint(
                          controller.formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  },
                  text:
                      controller.isMediaProcessing.value ? 'Loading' : 'Upload',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
