import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/media_docs_controller.dart';

class MediaDocsView extends GetView<MediaDocsController> {
  MediaDocsView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Gambar'),
        centerTitle: true,
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
                  FormBuilderFilePicker(
                    name: 'file',
                    allowedExtensions: const [
                      'pdf',
                    ],
                    maxFiles: 1,
                    validator: FormBuilderValidators.required(),
                    typeSelectors: [
                      TypeSelector(
                          type: FileType.custom,
                          selector: Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.filePdf,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Lampirkan Dokumen',
                              ),
                            ],
                          )),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gambar / Dokumen',
                      labelText: 'Lampiran',
                    ),
                    customFileViewerBuilder: customFileViewerBuilder,
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
                      // controller.saveMedia(data.id);
                    } else {
                      debugPrint(
                          controller.formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  },
                  text:
                      controller.isDocsProcessing.value ? 'Loading' : 'Upload',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customFileViewerBuilder(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> setter,
) {
  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final file = files![index];
      return ListTile(
        title: Text(file.name),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            files.removeAt(index);
            setter.call([...files]);
          },
        ),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.blueAccent,
    ),
    itemCount: files!.length,
  );
}
