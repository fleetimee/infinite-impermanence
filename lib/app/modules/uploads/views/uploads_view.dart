import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import 'package:get/get.dart';

import '../controllers/uploads_controller.dart';

class UploadsView extends GetView<UploadsController> {
  const UploadsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: const Text('Upload Berkas'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FormBuilder(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/images/upload/upload_header.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    height: 300,
                  ),
                  FormBuilderFilePicker(
                    name: "attachments",
                    previewImages: false,
                    withData: true,
                    allowMultiple: true,
                    allowedExtensions: const ['pdf', 'doc', 'docx'],
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.custom,
                        selector: Row(
                          children: const <Widget>[
                            Icon(Icons.add_circle),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Pilih Berkas"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FormBuilderSearchableDropdown<String>(
                    popupProps: const PopupProps.menu(showSearchBox: true),
                    name: 'searchable_dropdown_online',
                    onChanged: _onChanged,
                    asyncItems: (filter) async {
                      await Future.delayed(const Duration(seconds: 1));
                      return allDebiturs
                          .where((element) => element
                              .toLowerCase()
                              .contains(filter.toLowerCase()))
                          .toList();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Debitur',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // Make submit button
                  const SizedBox(
                    height: 100.0,
                  ),
                  colorButton(context, 'Submit', () {
                    Get.back();
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}

void _onChanged(dynamic val) => debugPrint(val.toString());

const allDebiturs = [
  'Novian Andika',
  'Sonia Eka P',
  'Lussy Ika',
  'Meliya Aja',
  'Monkey D Luffy',
];
