// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/asuransi_controller.dart';

class LihatAsuransiView extends GetView<AsuransiController> {
  LihatAsuransiView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Premi & Asuransi'),
        centerTitle: true,
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
                        controller.deleteAsuransi(data.id, data.asuransi.id);
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
      body: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                    controller.namaPerusahaanDeskripsi,
                    style: Theme.of(context).textTheme.bodySmall?.merge(
                          const TextStyle(fontSize: 14),
                        ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    name: 'nama_perusahaan',
                    readOnly: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      labelText: 'Nama Perusahaan Asuransi',
                      border: OutlineInputBorder(),
                      hintText: 'JAMKRINDO, ASKRINDO, dll',
                    ),
                    controller: controller.namaPerusahaan =
                        TextEditingController(
                            text: data.asuransi.namaPerusahaan),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.premiDeskripsi,
                    style: Theme.of(context).textTheme.bodySmall?.merge(
                          const TextStyle(fontSize: 14),
                        ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    name: 'premi',
                    textAlign: TextAlign.right,
                    readOnly: true,
                    controller: controller.premi =
                        TextEditingController(text: data.asuransi.premi),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      labelText: 'Premi',
                      suffixText: '%',
                      border: OutlineInputBorder(),
                      hintText: '3.14 (Decimal memakai Titik)',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    controller.plafonKreditDeskripsi,
                    style: Theme.of(context).textTheme.bodySmall?.merge(
                          const TextStyle(fontSize: 14),
                        ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    readOnly: true,
                    name: 'plafonKredit',
                    controller: controller.plafonKredit =
                        MoneyMaskedTextController(
                            decimalSeparator: '',
                            thousandSeparator: '.',
                            precision: 0,
                            initialValue: double.parse(
                                data.inputKeuangan.kreditDiusulkan.toString())),
                    decoration: const InputDecoration(
                      labelText: 'Plafon Kredit',
                      prefixText: 'Rp. ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    readOnly: true,
                    name: 'jumlahAsuransi',
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Asuransi',
                      border: OutlineInputBorder(),
                      hintText: 'Hasil',
                      prefixText: 'Rp. ',
                    ),
                    controller: controller.jumlahAsuransi =
                        MoneyMaskedTextController(
                            decimalSeparator: '',
                            thousandSeparator: '.',
                            precision: 0,
                            initialValue:
                                double.parse(data.asuransi.totalAsuransi)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
