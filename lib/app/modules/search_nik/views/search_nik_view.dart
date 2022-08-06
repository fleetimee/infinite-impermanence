import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:akm/app/widget/color_button.dart';

import '../controllers/search_nik_controller.dart';

class SearchNikView extends GetView<SearchNikController> {
  const SearchNikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text("Search Debitur"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/search_section/search_header.png',
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                height: 300,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Masukkan NIK',
                  suffixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: controller.nikController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              colorButton(
                  context, controller.apicall.isFalse ? 'SEARCH' : 'PROSES',
                  () async {
                controller.callsearchNik();
              }),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                if (controller.apicall.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.currentNik.value == '') {
                  return const Center();
                }

                if (controller.currentNik.value ==
                    'Error: Exception: Failed to load post') {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'Oops, nik tidak boleh kosong',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'assets/images/search_section/search_404.png',
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                    ],
                  );
                }

                if (controller.currentNik.value ==
                    'Error: Bad state: No element') {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'Nik tidak ditemukan, silahkan buat disini',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'assets/images/search_section/search_404_2.png',
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.CREATE_DEBITUR);
                          },
                          child: const Text('Create Debitur')),
                    ],
                  );
                }

                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: Text(controller.namaDebitur.value),
                      subtitle: Text(controller.nomorDebitur.value),
                      onTap: () {
                        // Navigate to the second screen with the data
                      },
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(controller.namaDebitur.value[0]),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
