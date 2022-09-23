import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/usaha_analisis_controller.dart';

class UsahaAnalisisView extends GetView<UsahaAnalisisController> {
  UsahaAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Usaha'),
        centerTitle: true,
      ),
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/home/usaha.svg',
                    fit: BoxFit.cover,
                  ),
                  FormBuilderTextField(
                    name: 'jenis_usaha',
                    decoration: const InputDecoration(
                      labelText: 'Jenis Usaha',
                      border: OutlineInputBorder(),
                    ),
                    controller: controller.jenisUsaha = TextEditingController(
                      text: data.jenisUsaha,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  FormBuilderTextField(
                    name: 'crr_jenis_usaha',
                    decoration: const InputDecoration(
                        labelText: 'CRR Jenis Usaha',
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Submit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
