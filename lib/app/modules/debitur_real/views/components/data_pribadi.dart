// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';

class DataPribadi extends StatelessWidget {
  const DataPribadi({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.people),
      title: const Text(
        'Data Pribadi Debitur',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text(
                    "Lihat Data",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Get.toNamed(
                      Routes.DEBITUR_DETAIL_BANGET,
                      arguments: debtor.id,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text(
                    "Edit Debitur",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.DEBITUR_EDIT, arguments: debtor);
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
