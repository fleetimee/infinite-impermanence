// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class Neraca extends StatelessWidget {
  const Neraca({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('1. Neraca'),
          // check if input neraca is not null then give success icon else give error icon
          debtor.inputNeraca != null
              ? const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                )
              : const Icon(
                  FontAwesomeIcons.exclamation,
                  color: Colors.red,
                ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16,
              ),
              // check if neraca is not empty
              debtor.inputNeraca != null
                  ? const SizedBox()
                  : Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(FontAwesomeIcons.chartLine),
                        label: const Text(
                          "Input Neraca",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Get.offAndToNamed(Routes.INPUT_NERACA,
                              // Send debtor id to input keuangan page
                              arguments: debtor.id);
                          // delete current controller from memory
                          Get.delete<DebiturRealController>();
                        },
                      ),
                    ),
              //check if neraca is empty
              debtor.inputNeraca == null
                  ? const SizedBox()
                  : Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(FontAwesomeIcons.eye),
                        label: const Text(
                          "Lihat Neraca",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.LIHAT_NERACA,
                              // Send debtor id to input keuangan page
                              arguments: debtor.inputNeraca);
                        },
                      ),
                    ),
              const SizedBox(
                width: 10.0,
              ),
              debtor.inputNeraca == null
                  ? const SizedBox()
                  : Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(FontAwesomeIcons.pencil),
                        label: const Text(
                          "Edit Neraca",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.EDIT_NERACA,
                              // Send debtor id to input keuangan page
                              arguments: debtor.inputNeraca);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
