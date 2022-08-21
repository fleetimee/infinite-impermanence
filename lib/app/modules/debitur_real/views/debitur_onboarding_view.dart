import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class DebiturOnboardingView extends GetView<DebiturRealController> {
  const DebiturOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/debitur_real/debitur_onboarding.svg',
            height: 450,
            fit: BoxFit.cover,
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.ADD_DEBITUR),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                // Add text and icon inside stack
                const Positioned(
                  bottom: 50,
                  right: 150,
                  child: Text(
                    'Tambah Debitur',
                    style: TextStyle(
                      fontSize: 30,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 50,
                  right: 50,
                  child: Icon(
                    Icons.add,
                    color: secondaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.DEBITUR_LIST),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      // Add text and icon inside stack
                      const Positioned(
                        bottom: 50,
                        right: 85,
                        child: Text(
                          'List',
                          style: TextStyle(
                            fontSize: 45,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 100,
                        right: 70,
                        child: Icon(
                          Icons.list_alt_rounded,
                          color: secondaryColor,
                          size: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    // Add text and icon inside stack
                    const Positioned(
                      bottom: 50,
                      right: 150,
                      child: Text(
                        'Tambah Debitur',
                        style: TextStyle(
                          fontSize: 30,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 50,
                      right: 50,
                      child: Icon(
                        Icons.add,
                        color: secondaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
