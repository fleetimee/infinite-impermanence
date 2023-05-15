import 'package:akm/app/modules/pengajuan_printing/models/pengajuan_printing_model.dart';
import 'package:akm/app/modules/pengajuan_printing/widget/pengajuan_printing_reuseable_print_card.dart';
import 'package:flutter/material.dart';

class PrintUsahaSection extends StatelessWidget {
  const PrintUsahaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderPrintingUsaha(),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: usahaPrintList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return PengajuanPrintingReuseableCard(
                icon: usahaPrintList[index].icon,
                subtitle: usahaPrintList[index].subtitle,
                title: usahaPrintList[index].title,
                onPressed: usahaPrintList[index].onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}

class HeaderPrintingUsaha extends StatelessWidget {
  const HeaderPrintingUsaha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Print",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Analisa Jenis Usaha",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.local_convenience_store,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
