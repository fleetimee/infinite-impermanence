// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home/widget/components/home_search_nik/search_form.dart';
import 'package:akm/app/modules/home/widget/components/home_search_nik/search_result.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class HomeSearchNik extends StatelessWidget {
  final HomeController controller;

  const HomeSearchNik({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          color: blue400,
          elevation: 10,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/home/main_page/search.png", // Replace with your image asset
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Pencarian Berdasarkan Nomor Induk Kependudukan',
                        style: TextStyle(
                          fontSize: 30,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NikSearchForm(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GFButton(
                          text: 'Cari',
                          fullWidthButton: true,
                          color: primaryColor,
                          shape: GFButtonShape.pills,
                          onPressed: () {
                            controller.searchNik(
                              controller.nik.text,
                              context,
                            );
                          },
                          size: GFSize.LARGE,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NikSearchResult(
                    controller: controller,
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
