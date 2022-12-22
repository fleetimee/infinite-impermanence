import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../controllers/pengajuan_submit_analis_controller.dart';

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

  DebiturInsight data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Analis > Reviewer'),
      ),
      body: FormBuilder(
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
                    'Plih Reviewer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FormBuilderSearchableDropdown<String>(
                    name: 'reviewers',
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
                  // const SizedBox(height: 16),
                  // const Text(
                  //   'Self Review ?',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // FormBuilderRadioGroup(
                  //   name: 'selfReview',
                  //   options: const [
                  //     FormBuilderFieldOption(
                  //       value: 'Ya',
                  //       child: Text('Ya'),
                  //     ),
                  //     FormBuilderFieldOption(
                  //       value: 'Tidak',
                  //       child: Text('Tidak'),
                  //     ),
                  //   ],
                  //   decoration: const InputDecoration(
                  //     border: // no border
                  //         InputBorder.none,
                  //   ),
                  // ),
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
                      controller.submitPengajuanAnalis();
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
    );
  }
}

// Fetch user dropdown api to l