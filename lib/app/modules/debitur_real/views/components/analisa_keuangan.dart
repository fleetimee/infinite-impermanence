import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AnalisaKeuanganTile extends StatelessWidget {
  const AnalisaKeuanganTile({
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
          const Text('4. Analisa Keuangan'),
          // check if input keuangan is not null then give success icon else give error icon
          debtor.analisaKeuangan != null
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
        debtor.inputKeuangan == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Input Keuangan terlebih dahulu',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              )
            : debtor.analisaKeuangan != null
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
                            Get.toNamed(
                              Routes.LIHAT_KEUANGAN_ANALISIS,
                              arguments: debtor,
                            );
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
                          onPressed: () {
                            // Get.toNamed(Routes.EDIT_RUGI_LABA,
                            //     // Send debtor id to input keuangan page
                            //     arguments: debtor.inputRugiLaba);
                          },
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
                            foregroundColor: forButton1,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.KEUANGAN_ANALISIS,
                                // Send debtor id to input keuangan page
                                arguments: debtor);
                          },
                        ),
                      ),
                    ],
                  ),
      ],
    );
  }
}
