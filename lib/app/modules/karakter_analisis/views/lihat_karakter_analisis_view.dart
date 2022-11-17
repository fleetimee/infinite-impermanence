// ignore_for_file: avoid_print

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../controllers/karakter_analisis_controller.dart';

class LihatKarakterAnalisisView extends GetView<KarakterAnalisisController> {
  LihatKarakterAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                        controller
                            .deleteAnalisaKarakter(data.analisaKarakter.id);
                        // controller.purgeProgressBar(data.id);
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
        elevation: 0.0,
        backgroundColor: primaryColor.withOpacity(0.3),
        title: const Text(
          "Karakter Analisis",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120 + MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: AssetImage('assets/image/gradient/15.png'),
                          image: NetworkImage(
                            "https://wallpaperaccess.com/full/1601031.jpg",
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: primaryColor.withOpacity(0.85),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: controller.formKey,
                onChanged: () {
                  controller.formKey.currentState!.save();
                  debugPrint(controller.formKey.currentState!.value.toString());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Data Analisa Karakter',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Berikut beberapa parameter yang harus diinputkan untuk mengetahui karakter debitur.',
                      style: TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.fade,
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Visibility(
                      visible: false,
                      child: FormBuilderTextField(
                        name: 'debiturId',
                        controller: controller.debiturId =
                            TextEditingController(
                          text: data.id.toString(),
                        ),
                      ),
                    ),
                    FormBuilderTextField(
                      readOnly: true,
                      name: 'nilai_umur',
                      controller: controller.nilaiUmur = TextEditingController(
                        text: data.umur.toString(),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Umur',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderDropdown(
                      enabled: false,
                      name: 'pendidikan',
                      initialValue: data.pendidikan,
                      onChanged: (value) {
                        controller.pendidikanInput.value = value.toString();
                      },
                      onSaved: (value) {
                        controller.pendidikanInput.value = value.toString();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Pendidikan',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      items: controller.pendidikanList
                          .map(
                            (element) => DropdownMenuItem(
                              value: element,
                              child: Text(element),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      name: 'lamanya_berusaha',
                      readOnly: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.maxLength(2,
                            errorText: 'Impposibru'),
                      ]),
                      controller: controller.lamanyaBerusaha =
                          TextEditingController(
                        text: data.lamanyaBerusaha.toString(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Lamanya Berusaha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderSlider(
                      divisions: 19,
                      enabled: false,
                      initialValue:
                          double.parse(data.analisaKarakter.scoreUlet),
                      min: 0,
                      max: 95,
                      onChanged: (double? value) {
                        controller.uletDalamBisnis.value = value!;
                      },
                      name: 'ulet',
                      decoration: InputDecoration(
                        labelText: 'Ulet Dalam Bisnis',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'keterangan_ulet',
                      enabled: false,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      controller: controller.keteranganUletDalamBisnis =
                          TextEditingController(
                        text: data.analisaKarakter.keteranganUlet,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    FormBuilderSlider(
                      divisions: 19,
                      enabled: false,
                      initialValue:
                          double.parse(data.analisaKarakter.scoreKaku),
                      min: 0,
                      max: 95,
                      onChanged: (double? value) {
                        controller.kakuFleksibel.value = value!;
                        print(controller.kakuFleksibel.value);
                      },
                      name: 'kaku',
                      decoration: InputDecoration(
                        labelText: 'Kaku / Fleksibel',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'keterangan_kaku',
                      enabled: false,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      controller: controller.keteranganKakuFleksibel =
                          TextEditingController(
                        text: data.analisaKarakter.keteranganKaku,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    FormBuilderSlider(
                      divisions: 19,
                      enabled: false,
                      initialValue:
                          double.parse(data.analisaKarakter.scoreKreatif),
                      min: 0,
                      max: 95,
                      onChanged: (double? value) {
                        controller.inovatifKreatif.value = value!;
                        print(controller.inovatifKreatif.value);
                      },
                      name: 'kreatif',
                      decoration: InputDecoration(
                        labelText: 'Kreatif / Inovatif',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'keterangan_inovatif',
                      enabled: false,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      controller: controller.keteranganInovatifKreatif =
                          TextEditingController(
                        text: data.analisaKarakter.keteranganKreatif,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    FormBuilderSlider(
                      divisions: 19,
                      enabled: false,
                      initialValue:
                          double.parse(data.analisaKarakter.scoreKejujuran),
                      min: 0,
                      max: 95,
                      onChanged: (double? value) {
                        controller.jujur.value = value!;
                        print(controller.jujur.value);
                      },
                      name: 'jujur',
                      decoration: InputDecoration(
                        labelText: 'Memiliki kejujuran dalam bisnis',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'keterangan_jujur',
                      enabled: false,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      controller: controller.keteranganJujur =
                          TextEditingController(
                              text: data.analisaKarakter.keteranganKejujuran),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    FormBuilderTextField(
                      readOnly: true,
                      keyboardType: TextInputType.multiline,
                      controller: controller.deskripsi = TextEditingController(
                        text: data.analisaKarakter.deskripsiKarakter,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                      name: 'deskripsi_karakter',
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi Bisnis Pemohon',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 10,
                      textInputAction: TextInputAction.newline,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // OutlinedButton.icon(
                    //   icon: const Icon(Icons.check),
                    //   label: const Text(
                    //     "Lihat CRR",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.w500, fontSize: 20),
                    //   ),
                    //   style: OutlinedButton.styleFrom(
                    //       foregroundColor: secondaryColor,
                    //       backgroundColor: primaryColor,
                    //       shape: const StadiumBorder(),
                    //       maximumSize: const Size.fromWidth(double.infinity),
                    //       fixedSize: const Size(500, 50)),
                    //   onPressed: () {
                    //     showBarModalBottomSheet(
                    //       backgroundColor: secondaryColor,
                    //       bounce: true,
                    //       context: context,
                    //       builder: (context) {
                    //         return Container(
                    //           padding: const EdgeInsets.all(32),
                    //           child: FormBuilder(
                    //             child: Column(
                    //               mainAxisSize: MainAxisSize.min,
                    //               children: <Widget>[
                    //                 const SizedBox(
                    //                   height: 20,
                    //                 ),
                    //                 FormBuilderTextField(
                    //                   enabled: false,
                    //                   initialValue: data.analisaKarakter.crrUmur
                    //                       .toString(),
                    //                   name: 'umur_crr',
                    //                   textAlign: TextAlign.center,
                    //                   decoration: InputDecoration(
                    //                     border: const OutlineInputBorder(),
                    //                     labelText: 'Umur CRR',
                    //                     labelStyle: GoogleFonts.poppins(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w600,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 20.0,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data
                    //                             .analisaKarakter.crrPendidikan
                    //                             .toString(),
                    //                         name: 'pendidikan_crr',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Pendidikan CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     const VerticalDivider(
                    //                       color: Colors.black,
                    //                     ),
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data.analisaKarakter
                    //                             .crrLamanyaBerusaha
                    //                             .toString(),
                    //                         name: 'pengalaman_crr',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Pengalaman CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 20,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data
                    //                             .analisaKarakter.crrUlet
                    //                             .toString(),
                    //                         name: 'Keuletan CRR',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Keuletan CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     const VerticalDivider(
                    //                       color: Colors.black,
                    //                     ),
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data
                    //                             .analisaKarakter.crrKaku
                    //                             .toString(),
                    //                         name: 'Flexible CRR',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Flexible CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 20,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data
                    //                             .analisaKarakter.crrKreatif
                    //                             .toString(),
                    //                         name: 'inovatif_crr',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Inovatif CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     const VerticalDivider(
                    //                       color: Colors.black,
                    //                     ),
                    //                     Expanded(
                    //                       child: FormBuilderTextField(
                    //                         enabled: false,
                    //                         initialValue: data
                    //                             .analisaKarakter.crrKejujuran
                    //                             .toString(),
                    //                         name: 'jujur_crr',
                    //                         decoration: InputDecoration(
                    //                           border:
                    //                               const OutlineInputBorder(),
                    //                           labelText: 'Jujur CRR',
                    //                           labelStyle: GoogleFonts.poppins(
                    //                             fontSize: 15,
                    //                             fontWeight: FontWeight.w600,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 50,
                    //                 ),
                    //                 Text(
                    //                   data.analisaKarakter.totalCrrKarakter
                    //                       .toString(),
                    //                   style: GoogleFonts.poppins(
                    //                     fontSize: 35,
                    //                     fontWeight: FontWeight.w600,
                    //                     color: // Make text green if value exceed 65 and red if below 65
                    //                         double.parse(data.analisaKarakter
                    //                                     .totalCrrKarakter) >=
                    //                                 65.0
                    //                             ? Colors.green
                    //                             : Colors.red,
                    //                   ),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 20,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    GFButton(
                      onPressed: () {
                        showBarModalBottomSheet(
                          backgroundColor: secondaryColor,
                          bounce: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              child: FormBuilder(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Berikut adalah ringkasan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'CRR Karakter 🎉🎉🎉',
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
                                            'assets/images/home/karakter_promp.zip',
                                            frameRate: FrameRate.max,
                                            height: 280,
                                            fit: BoxFit.cover,
                                            repeat: true,
                                            errorBuilder:
                                                (context, error, stackTrace) {
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        FormBuilderTextField(
                                          enabled: false,
                                          initialValue: data
                                              .analisaKarakter.crrUmur
                                              .toString(),
                                          name: 'umur_crr',
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            labelText: 'Umur CRR',
                                            labelStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter
                                                    .crrPendidikan
                                                    .toString(),
                                                name: 'pendidikan_crr',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Pendidikan CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter
                                                    .crrLamanyaBerusaha
                                                    .toString(),
                                                name: 'pengalaman_crr',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Pengalaman CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter.crrUlet
                                                    .toString(),
                                                name: 'Keuletan CRR',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Keuletan CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter.crrKaku
                                                    .toString(),
                                                name: 'Flexible CRR',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Flexible CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter.crrKreatif
                                                    .toString(),
                                                name: 'inovatif_crr',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Inovatif CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.black,
                                            ),
                                            Expanded(
                                              child: FormBuilderTextField(
                                                enabled: false,
                                                initialValue: data
                                                    .analisaKarakter
                                                    .crrKejujuran
                                                    .toString(),
                                                name: 'jujur_crr',
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  labelText: 'Jujur CRR',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Text(
                                        'Total CRR : ${data.analisaKarakter.totalCrrKarakter}',
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: 'Cek CRR',
                      color: primaryColor,
                      size: GFSize.LARGE,
                      fullWidthButton: true,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// convert string to double
