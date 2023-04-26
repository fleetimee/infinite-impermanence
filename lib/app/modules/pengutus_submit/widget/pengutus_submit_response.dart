// 🐦 Flutter imports:
import 'package:akm/app/modules/pengutus_submit/controllers/pengutus_submit_controller.dart';
import 'package:akm/app/widget/dialog_box.dart';
import 'package:akm/app/widget/simple_snackbar.dart';
import 'package:akm/app/widget/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:

class PengutusSubmitResponse extends StatelessWidget {
  const PengutusSubmitResponse({
    super.key,
    required this.controller,
    required this.subtitleStyle,
  });

  final PengutusSubmitController controller;
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    Widget responseList(int num) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DebiturTextLabel(
              text: 'Tanggapan Pengutus ${num + 1}',
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'name$num',
              textInputAction: TextInputAction.next,
              maxLines: 3,
              onChanged: (value) {
                debugPrint('value: $value');
              },
              validator: FormBuilderValidators.required(),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                filled: true,
                fillColor: Colors.grey.shade400,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }

    var list = List.empty(growable: true).obs;

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
              text: 'Tanggapan Pemutus',
              type: GFTypographyType.typo3,
              showDivider: false,
            ),
            const SizedBox(height: 10),
            Text(
              'Ini merupakan catatan pemutus untuk debitur ini',
              style: subtitleStyle,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                Row(
                  children: [
                    GFIconButton(
                      shape: GFIconButtonShape.circle,
                      size: GFSize.SMALL,
                      color: Colors.pink,
                      onPressed: () {
                        list.add(
                          // Get dynamic string from textfield
                          controller
                              .formKey.currentState?.fields['name']?.value,
                        );

                        CustomSnackBarPink.show(
                            context, 'Poin nomor ${list.length} ditambahkan');
                      },
                      icon: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GFIconButton(
                      color: GFColors.LIGHT,
                      size: GFSize.SMALL,
                      shape: GFIconButtonShape.circle,
                      onPressed: () {
                        if (list.isEmpty) {
                          ErrorDialogPink(
                            title: 'Tidak ada poin yang bisa dihapus',
                            desc: 'Silahkan tambahkan poin terlebih dahulu',
                            context: context,
                            btnOkOnPress: () {},
                          ).show();

                          return;
                        } else {
                          list.removeLast();
                          controller.formKey.currentState
                              ?.removeInternalFieldValue('name${list.length}',
                                  isSetState: true);

                          debugPrint('list: $list');

                          CustomSnackBarPink.show(
                              context, 'Poin nomor ${list.length + 1} dihapus');
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (list.isEmpty) {
                return Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                        'assets/images/home/list_response.zip',
                        repeat: false,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Error');
                        },
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              } else {
                return SizedBox(
                  height: 400,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return responseList(index);
                      },
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
