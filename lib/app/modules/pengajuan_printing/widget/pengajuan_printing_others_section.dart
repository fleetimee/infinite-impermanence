import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_others_section/pengajuan_printing_others_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintOtherSection extends StatelessWidget {
  const PrintOtherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingOthers(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 280,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: othersPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: othersPrintList[index].icon,
                subtitle: othersPrintList[index].subtitle,
                title: othersPrintList[index].title,
                onPressed: othersPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
