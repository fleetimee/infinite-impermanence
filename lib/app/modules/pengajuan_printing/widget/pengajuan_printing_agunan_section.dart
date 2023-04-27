import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_agunan_section/pengajuan_print_agunan_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintAgunanSection extends StatelessWidget {
  const PrintAgunanSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingAgunan(),
        const SizedBox(height: 5),
        SizedBox(
          height: 170,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: agunanPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: agunanPrintList[index].icon,
                subtitle: agunanPrintList[index].subtitle,
                title: agunanPrintList[index].title,
                onPressed: agunanPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
