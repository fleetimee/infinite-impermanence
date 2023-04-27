import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/components/pengajuan_print_gallery_section/pengajuan_print_gallery_section_header.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintAgunanGallery extends StatelessWidget {
  const PrintAgunanGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingGallery(),
        const SizedBox(height: 5),
        SizedBox(
          height: 170,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: galleryPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: galleryPrintList[index].icon,
                subtitle: galleryPrintList[index].subtitle,
                title: galleryPrintList[index].title,
                onPressed: galleryPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
