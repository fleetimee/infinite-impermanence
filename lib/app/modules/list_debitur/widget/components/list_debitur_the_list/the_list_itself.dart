// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/controllers/list_debitur_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';
import 'package:random_avatar/random_avatar.dart';

// 🌎 Project imports:

class ListAllDebitur extends StatelessWidget {
  const ListAllDebitur({
    super.key,
    required this.controller,
  });

  final ListDebiturController controller;

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = const TextStyle(
      fontSize: 15,
      color: Colors.white,
    );
    return Scrollbar(
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.listDebitur.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              color: Colors.blue[900]?.withOpacity(0.9),
              elevation: 6,
              child: ListTile(
                  leading: RandomAvatar(
                    '${controller.listDebitur[index].peminjam1}',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                  enableFeedback: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.listDebitur[index].peminjam1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(controller.listDebitur[index].tglSekarang!),
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
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.30),
                          1: FlexColumnWidth(0.03),
                          2: FlexColumnWidth(0.67),
                        },
                        children: [
                          TableRow(
                            children: [
                              Text(
                                'Domisili',
                                style: subtitleStyle,
                              ),
                              Text(
                                ':',
                                style: subtitleStyle,
                              ),
                              Text(
                                '${controller.listDebitur[index].ktp1}',
                                style: subtitleStyle,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text(
                                'Bidang Usaha',
                                style: subtitleStyle,
                              ),
                              Text(
                                ':',
                                style: subtitleStyle,
                              ),
                              Text(
                                '${controller.listDebitur[index].bidangUsaha}',
                                style: subtitleStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Progress: ${(double.parse(controller.listDebitur[index].progress!) * 100).toStringAsFixed(0)} %',
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
                                controller.listDebitur[index].progress!),
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              (double.parse(controller
                                              .listDebitur[index].progress!) >=
                                          0.1 &&
                                      double.parse(controller
                                              .listDebitur[index].progress!) <
                                          0.6)
                                  ? Colors.red
                                  : (double.parse(controller.listDebitur[index]
                                                  .progress!) >=
                                              0.6 &&
                                          double.parse(controller
                                                  .listDebitur[index]
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
                  )),
            ),
          );
        },
      ),
    );
  }
}
