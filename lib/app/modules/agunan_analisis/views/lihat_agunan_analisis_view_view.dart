import 'package:akm/app/common/style.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LihatAgunanAnalisisViewView extends GetView {
  LihatAgunanAnalisisViewView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Agunan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Animate(
                    child: const GFCard(
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  showOverlayImage: true,
                  imageOverlay: NetworkImage(
                    'https://i0.wp.com/www.animegeek.com/wp-content/uploads/2022/08/Lycoris-Recoil-Season-2-release-date-Anime.jpg?resize=1024%2C576&ssl=1',
                  ),
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(136, 0, 0, 0),
                    BlendMode.darken,
                  ),
                  title: GFListTile(
                    title: Text(
                      'Analisa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 47,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  content: Text(
                    'Agunan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
                        .animate()
                        .fadeIn() // uses `Animate.defaultDuration`
                        .scale() // inherits duration from fadeIn
                        .move(
                            delay: 300.ms,
                            duration:
                                600.ms) // runs after the above w/new duration
                    // inherits the delay & duration from move,
                    ),

                const SizedBox(
                  height: 20.0,
                ),
                // FormBuilderTextField(
                //   name: 'crr_jenis_usaha',
                //   enabled: false,
                //   controller: controller.crrJenisUsaha =
                //       TextEditingController(
                //     text: data.analisaJenisUsaha.totalCrrUsaha.toString(),
                //   ),
                //   decoration: const InputDecoration(
                //       labelText: 'CRR Jenis Usaha',
                //       border: OutlineInputBorder()),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            GFButton(
              onPressed: () {
                showBarModalBottomSheet(
                  backgroundColor: secondaryColor,
                  bounce: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Center(
                                child: Text(
                                  'Yeay berhasil mendapatkan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'CRR Agunan 🎉🎉🎉',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: GFImageOverlay(
                                  height: 200,
                                  width: 350,
                                  shape: BoxShape.rectangle,
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/17/bb/14/17bb14d09f89ccc0efb7c30c3b49c926.jpg'),
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kredit yang diajukan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FormBuilderTextField(
                                name: 'kreditYangDiajukan',
                                readOnly: true,
                                initialValue: MoneyMaskedTextController(
                                  initialValue: double.parse(
                                      data.inputKeuangan.kreditDiusulkan),
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                ).text,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp .',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Agunan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FormBuilderTextField(
                                name: 'grandTotalAnalisis',
                                initialValue: MoneyMaskedTextController(
                                  initialValue: double.parse(
                                      data.analisaAgunan.totalAgunan),
                                  thousandSeparator: '.',
                                  decimalSeparator: '',
                                  precision: 0,
                                ).text,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp .',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rasio Agunan / Kredit',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FormBuilderTextField(
                                name: 'ratio',
                                textAlign: TextAlign.right,
                                readOnly: true,
                                initialValue:
                                    data.analisaAgunan.ratioAgunan.toString(),
                                decoration: const InputDecoration(
                                  suffixText: '%',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Total CRR:',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: FormBuilderTextField(
                                      name: 'crrAgunan',
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        // Disable underline
                                        border: InputBorder.none,
                                      ),
                                      initialValue: data
                                          .analisaAgunan.totalCrrAgunan
                                          .toString(),
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              text: 'Lihat Hasil',
              color: primaryColor,
              size: GFSize.LARGE,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
