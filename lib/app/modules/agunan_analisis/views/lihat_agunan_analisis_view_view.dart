// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_analisis/controllers/agunan_analisis_controller.dart';

class LihatAgunanAnalisisViewView extends GetView<AgunanAnalisisController> {
  LihatAgunanAnalisisViewView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Agunan'),
        actions: [
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: Get.context!,
                      dialogType: DialogType.question,
                      animType: AnimType.bottomSlide,
                      dialogBackgroundColor: primaryColor,
                      titleTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      descTextStyle: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      title: 'Konfirmasi',
                      bodyHeaderDistance: 25,
                      desc: 'Apakah yakin untuk menghapus item ini ?',
                      btnOkOnPress: () {
                        controller.deleteAgunanAnalisis(
                            data.id, data.analisaAgunan.id);
                        Get.back();
                      },
                      btnOkText: 'Oke sip',
                      btnCancelText: 'Affa iyh',
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: const FaIcon(
              FontAwesomeIcons.solidTrashCan,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Animate(
                    child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Image.asset(
                      'assets/images/home/bannerr.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 200,
                    )
                        .animate()
                        .fadeIn() // uses `Animate.defaultDuration`
                        .scale() // inherits duration from fadeIn
                        .move(delay: 300.ms, duration: 600.ms),
                  ),
                ) // runs after the above w/new duration
                    // inherits the delay & duration from move,
                    ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Harap dibaca terlebih dahulu 💀',
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 500,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        GFListTile(
                          avatar: Text('1. '),
                          titleText:
                              'Sebelum melakukan analisa agunan, harap pastikan bahwa data agunan yang ada sudah benar dan lengkap.',
                          icon: Icon(Icons.info_outline),
                        ),
                        GFListTile(
                          avatar: Text('2. '),
                          titleText:
                              'Jika data agunan belum lengkap, harap segera menghubungi pihak terkait untuk memperbaiki data agunan.',
                          icon: Icon(Icons.info_outline),
                        ),
                        GFListTile(
                          avatar: Text('3. '),
                          titleText:
                              'Jika data agunan sudah lengkap, harap segera melakukan analisa agunan.',
                          icon: Icon(Icons.info_outline),
                        ),
                        GFListTile(
                          avatar: Text('4. '),
                          titleText:
                              'Jika ada data agunan yang salah atau ada yang mau ditambahkan, kalau sudah analisa agunan sebelumnnya silahkan hapus terlebih dahulu kemudian hitung ulang kembali untuk mendapatkan hasil yang terupdate',
                          icon: Icon(Icons.info_outline),
                        ),
                        GFListTile(
                          avatar: Text('5. '),
                          titleText:
                              'Jika ada data agunan tapi nilai agunan nya 0 saat menghitung, silahkan kembali ke panel debitur dan ulangi langkah perhitungan',
                          icon: Icon(Icons.info_outline),
                        ),
                        GFListTile(
                          avatar: Text('6. '),
                          titleText:
                              'Untuk menghitung analisa agunan dibutuhkan sekitar 7 detik, harap bersabar menunggu hingga proses selesai',
                          icon: Icon(Icons.info_outline),
                        ),
                      ],
                    ),
                  ),
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
                            children: [
                              const Center(
                                child: Text(
                                  'Yeay berhasil mendapatkan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'CRR Agunan 🎉🎉🎉',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Lottie.asset(
                                  'assets/images/home/agunan_promp.zip',
                                  frameRate: FrameRate.max,
                                  height: 280,
                                  repeat: true,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text(
                                      'Gagal memuat animasi',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    );
                                  },
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
