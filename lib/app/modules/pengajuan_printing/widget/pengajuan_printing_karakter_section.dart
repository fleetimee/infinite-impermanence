import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_karakter_section/pengajuan_printing_karakter_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintKarakterSection extends StatelessWidget {
  const PrintKarakterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingKarakter(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 85,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: karakterPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: karakterPrintList[index].icon,
                subtitle: karakterPrintList[index].subtitle,
                title: karakterPrintList[index].title,
                onPressed: karakterPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
