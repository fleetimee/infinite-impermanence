import 'package:akm/app/modules/keuangan_analisis/views/components/asumsi_keuangan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/analisa_ratio.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/angsuran.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/data_keuangan.dart';
import 'package:akm/app/widget/drawer.dart';

import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisView extends GetView<KeuanganAnalisisController> {
  const KeuanganAnalisisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Analisis Keuangan'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: controller.tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: primaryColor,
                  ),
                  isScrollable: true,

                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Data Keuangan'),
                    Tab(text: 'Angsuran'),
                    Tab(text: 'Asumsi Keuangan'),
                    Tab(text: 'Analisa Ratio'),
                    Tab(text: 'Summary'),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: FormBuilder(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      DataKeuangan(),
                      Angsuran(),
                      AsumsiKeuangan(),
                      AnalisaRatio(),
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://wallpapercave.com/uwp/uwp2104971.png',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
