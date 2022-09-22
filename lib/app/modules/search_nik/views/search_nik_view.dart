// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
 import '../../../routes/app_pages.dart';
 import '../../../widget/color_button.dart';
import '../controllers/search_nik_controller.dart';

class SearchNikView extends GetView<SearchNikController> {
  const SearchNikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              colorButton(context,
                  controller.isSearchLoading.isFalse ? 'SEARCH' : 'PROSES',
                  () async {
                controller.callsearchNik();
              }),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                if (controller.isSearchLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.listDebtor.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data'),
                  );
                }

                // If Bad state: No Element in listDebtor

                // If list has no element then return empty list

                if (controller.listDebtor.isNotEmpty &&
                    controller.listDebtor.length > 1) {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'Data tidak ditemukan',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Image.asset(
                        'assets/images/search_section/search_404_2.png',
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Create Debitur')),
                    ],
                  );
                }

                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Found 1 result : ${controller.listDebtor[0].noKtp1}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text(
                        controller.listDebtor[0].peminjam1.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        controller.listDebtor[0].bidangUsaha.toString(),
                      ),
                      onTap: () {
                        Get.toNamed(
                          Routes.DEBITUR_DETAIL,
                          arguments: controller.listDebtor[0],
                        );
                      },
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 50,
                        child: Text(
                          controller.listDebtor[0].peminjam1
                              .toString()
                              .substring(0, 1),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
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
