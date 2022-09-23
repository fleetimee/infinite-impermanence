import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../common/style.dart';

class AnalisaJenisUsahaTile extends StatelessWidget {
  const AnalisaJenisUsahaTile({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('1. Analisa Jenis Usaha'),
          debtor.analisaJenisUsaha == null
              ? const Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.red,
                )
              : const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                ),
        ],
      ),
      children: [
        debtor.analisaJenisUsaha != null
            ? Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(FontAwesomeIcons.noteSticky),
                      label: const Text(
                        "Lihat",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: forButton2,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.LIHAT_BISNIS_ANALISIS,
                            arguments: debtor);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(FontAwesomeIcons.pencil),
                      label: const Text(
                        "Edit",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: forButton2,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                      label: const Text(
                        "Analisa",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: forButton2,
                      ),
                      onPressed: () {
                        Get.toNamed(
                          Routes.USAHA_ANALISIS,
                          arguments: debtor,
                        );
                        // Get.delete<DebiturRealController>();
                      },
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
