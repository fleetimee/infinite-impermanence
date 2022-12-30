import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../controllers/pengajuan_submit_analis_controller.dart';

// ignore: must_be_immutable
class PengajuanSubmitAnalisView
    extends GetView<PengajuanSubmitAnalisController> {
  PengajuanSubmitAnalisView({Key? key}) : super(key: key);

  Future<List<String>> _getItems() async {
    final httpClient = http.Client();
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}firebase-remote/reviewers'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*'
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('data: $data');
        var uid = data['data'].map<String>((e) => e['uid'].toString()).toList();
        var displayName = data['data']
            .map<String>((e) => e['displayName'].toString())
            .toList();

        var combined = displayName
            .map<String>((e) => '$e : ${uid[displayName.indexOf(e)]}')
            .toList();

        return combined;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // List<Widget> formBuilderFields = List.empty(growable: true);

  Widget myWidget(int num) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: FormBuilderTextField(
            name: 'name$num',
            maxLines: 3,
            onChanged: (value) {
              debugPrint('value: $value');
            },
            validator: FormBuilderValidators.required(),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Poin ${num + 1}',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // make list of strings
  var list = List.empty(growable: true).obs;

  DebiturInsight data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Analis > Reviewer'),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GFTypography(
                      text: 'Submit Pengajuan ${data.peminjam1}',
                      type: GFTypographyType.typo1,
                      backgroundImage: const NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tgl Pengajuan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderDateTimePicker(
                      name: 'tglPengajuan',
                      inputType: InputType.date,
                      format: DateFormat('dd-MM-yyyy'),
                      validator: FormBuilderValidators.required(),
                      resetIcon: const Icon(Icons.clear),
                      decoration: const InputDecoration(
                        hintText: 'Pilih Tanggal Pengajuan',
                        prefixIcon: Icon(Icons.date_range),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        border: // no border
                            OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'Plih Reviewer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FormBuilderSearchableDropdown<String>(
                      name: 'reviewers',
                      validator: FormBuilderValidators.required(),
                      popupProps: const PopupProps.menu(showSearchBox: true),
                      asyncItems: (filter) {
                        return _getItems();
                      },
                      clearButtonProps: const ClearButtonProps(
                        icon: Icon(Icons.clear),
                        color: Colors.red,
                      ),
                      itemAsString: (item) {
                        // hide the uid from screen
                        return item.split(':')[0];
                      },
                      onChanged: (value) {
                        debugPrint('value: $value');
                      },
                      decoration: const InputDecoration(
                        border: // no border
                            InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Pilih Reviewer',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bahasan Analis',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            GFIconButton(
                              shape: GFIconButtonShape.circle,
                              size: GFSize.SMALL,
                              color: GFColors.SUCCESS,
                              onPressed: () {
                                list.add(
                                  // Get dynamic string from textfield
                                  controller.formKey.currentState
                                      ?.fields['name']?.value,
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GFIconButton(
                              color: GFColors.DANGER,
                              size: GFSize.SMALL,
                              shape: GFIconButtonShape.circle,
                              onPressed: () {
                                list.removeLast();
                                controller.formKey.currentState
                                    ?.removeInternalFieldValue(
                                        'name${list.length}',
                                        isSetState: true);
                                debugPrint('list: $list');
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // GFButton(onPressed: (() => list.clear()), text: 'Clear'),

                    Obx(() {
                      if (list.isEmpty) {
                        return Column(
                          children: const [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: Text(
                                'Tambahkan Bahasan Analis',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: 400,
                          child: Scrollbar(
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return myWidget(index);
                              },
                            ),
                          ),
                        );
                      }
                    }),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Pastikan data yang anda input sudah lengkap dan benar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GFButton(
                      onPressed: () {
                        if (controller.formKey.currentState
                                ?.saveAndValidate() ??
                            false) {
                          // debugPrint(
                          //     'form data: ${controller.formKey.currentState!.value}');

                          // Intitial map
                          var list = controller.formKey.currentState!.value;

                          // Transform map to list
                          var list2 = list.entries.toList();

                          // // remove MapEntry and key
                          list2.removeWhere((element) =>
                              element.key == 'reviewers' ||
                              element.key == 'tglPengajuan');

                          // debugPrint('list2: $list2');

                          // Transform list2 to list of string
                          var list3 = list2.map((e) => e.value).toList();

                          // list3.removeWhere((element) => element.k)

                          // transform list3 to string
                          list3 = list3.map((e) => e.toString()).toList();

                          controller.bahasanAnalis = list3;

                          var listFinal = controller.bahasanAnalis;

                          debugPrint(listFinal.toString());

                          controller.submitPengajuanAnalis();
                          Get.back();
                        } else {
                          Get.dialog(
                            const AlertDialog(
                              title: Text('Error'),
                              content: Text('Please fill all the fields'),
                            ),
                          );
                        }
                      },
                      text: 'Submit',
                      fullWidthButton: true,
                      color: primaryColor,
                      size: GFSize.LARGE,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Fetch user dropdown api to l
