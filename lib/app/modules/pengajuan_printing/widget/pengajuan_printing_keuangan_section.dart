import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_keuangan_section/pengajuan_printing_keuangan_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintKeuanganSection extends StatelessWidget {
  const PrintKeuanganSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingKeuangan(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: keuanganPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: keuanganPrintList[index].icon,
                subtitle: keuanganPrintList[index].subtitle,
                title: keuanganPrintList[index].title,
                onPressed: keuanganPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
