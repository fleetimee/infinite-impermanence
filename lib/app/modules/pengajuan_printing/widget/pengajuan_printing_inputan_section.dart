import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_inputan_section/pengajuan_printing_inputan_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintInputanSection extends StatelessWidget {
  const PrintInputanSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingInputan(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 325,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: inputanPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: inputanPrintList[index].icon,
                subtitle: inputanPrintList[index].subtitle,
                title: inputanPrintList[index].title,
                onPressed: inputanPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
