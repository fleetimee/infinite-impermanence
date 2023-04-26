// 🐦 Flutter imports:
import 'package:akm/app/widget/dialog_box.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class PengutusSubmitDecision extends StatelessWidget {
  const PengutusSubmitDecision({
    super.key,
    required this.subtitleStyle,
  });

  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GFTypography(
              text: 'Putusan',
              type: GFTypographyType.typo3,
              showDivider: false,
            ),
            const SizedBox(height: 10),
            Text(
              'Berdasarkan hasil penilaian, apakah anda menyetujui atau menolak pengajuan debitur ini ?',
              style: subtitleStyle,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: FormBuilderDropdown(
                name: 'putusan',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                alignment: Alignment.centerLeft,
                decoration: const InputDecoration(
                  hintText: 'TERIMA / TOLAK ?',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value == 'DONE') {
                    SuccessDialogPink(
                      context: context,
                      title: 'Berhasil',
                      desc:
                          'Pengajuan debitur ini ditandai dengan status DITERIMA, double check kembali !',
                      btnOkOnPress: () {},
                    ).show();
                  } else if (value == 'REJECTED') {
                    SuccessDialogPink(
                      context: context,
                      title: 'Berhasil',
                      desc:
                          'Pengajuan debitur ini ditandai dengan status DITOLAK, double check kembali !',
                      btnOkOnPress: () {},
                    ).show();
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: 'DONE',
                    child: Text(
                      'TERIMA',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'REJECTED',
                    child: Text(
                      'TOLAK',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
