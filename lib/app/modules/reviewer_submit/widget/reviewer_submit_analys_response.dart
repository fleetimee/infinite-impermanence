// 🐦 Flutter imports:
import 'package:akm/app/modules/reviewer_submit/controllers/reviewer_submit_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class AnalysResponse extends StatelessWidget {
  const AnalysResponse({
    super.key,
    required this.controller,
    required this.subtitleStyle,
  });

  final ReviewerSubmitController controller;
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Card(
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
                text: 'Tanggapan Analis',
                type: GFTypographyType.typo3,
                showDivider: false,
              ),
              const SizedBox(height: 10),
              Text(
                'Ini adalah tanggapan analis terhadap pengajuan ini',
                style: subtitleStyle,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pengajuan.bahasanAnalis?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '${index + 1}. ${controller.pengajuan.bahasanAnalis?[index]}',
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
