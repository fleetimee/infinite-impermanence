// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

class ListRiwayatInput extends StatelessWidget {
  const ListRiwayatInput({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.refreshInputtan();
      },
      child: Scrollbar(
        child: ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.listMyInput.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                color: blue400,
                elevation: 6,
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  enableFeedback: true,
                  leading: RandomAvatar(
                    '${controller.listMyInput[index].peminjam1}',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.listMyInput[index].peminjam1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(controller.listMyInput[index].tglSekarang!),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Progress: ${(double.parse(controller.listMyInput[index].progress!) * 100).toStringAsFixed(0)} %',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: double.parse(
                                controller.listMyInput[index].progress!),
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              (double.parse(controller
                                              .listMyInput[index].progress!) >=
                                          0.1 &&
                                      double.parse(controller
                                              .listMyInput[index].progress!) <
                                          0.6)
                                  ? Colors.red
                                  : (double.parse(controller.listMyInput[index]
                                                  .progress!) >=
                                              0.6 &&
                                          double.parse(controller
                                                  .listMyInput[index]
                                                  .progress!) <
                                              1.0)
                                      ? Colors.yellow
                                      : Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    Get.toNamed(
                      Routes.INSIGHT_DEBITUR,
                      arguments: controller.listMyInput[index].id,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
