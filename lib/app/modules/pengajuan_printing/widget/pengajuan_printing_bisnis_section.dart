import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_bisnis_section/pengajuan_print_bisnis_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintBisnisSection extends StatelessWidget {
  const PrintBisnisSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingBisnis(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bisnisPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: bisnisPrintList[index].icon,
                subtitle: bisnisPrintList[index].subtitle,
                title: bisnisPrintList[index].title,
                onPressed: bisnisPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
