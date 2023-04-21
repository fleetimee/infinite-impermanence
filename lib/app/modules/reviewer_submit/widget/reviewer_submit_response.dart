// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/widget/text_label.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

// 🌎 Project imports:
import '../../../widget/simple_snackbar.dart';
import '../controllers/reviewer_submit_controller.dart';

class ReviewerSubmitResponse extends StatelessWidget {
  const ReviewerSubmitResponse({
    super.key,
    required this.controller,
    required this.subtitleStyle,
  });

  final ReviewerSubmitController controller;
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
              text: 'Tanggapan Reviewer ${num + 1}',
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
                fillColor: Colors.grey.shade300,
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

    return Container(
      color: Colors.grey[200],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const GFTypography(
                text: 'Tanggapan Reviewer',
                type: GFTypographyType.typo3,
                showDivider: false,
              ),
              const SizedBox(height: 10),
              Text(
                'Ini merupakan catatan dari reviewer terhadap pengajuan debitur',
                style: subtitleStyle,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    Row(
                      children: [
                        GFIconButton(
                          shape: GFIconButtonShape.circle,
                          size: GFSize.SMALL,
                          color: primaryColor,
                          onPressed: () {
                            list.add(
                              // Get dynamic string from textfield
                              controller
                                  .formKey.currentState?.fields['name']?.value,
                            );

                            CustomSnackBar.show(context,
                                'Poin nomor ${list.length} ditambahkan');
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
                            list.removeLast();
                            controller.formKey.currentState
                                ?.removeInternalFieldValue('name${list.length}',
                                    isSetState: true);
                            debugPrint('list: $list');

                            CustomSnackBar.show(context,
                                'Poin nomor ${list.length + 1} dihapus');
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
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
      ),
    );
  }
}
