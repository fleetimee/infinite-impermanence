// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/widget/drawer.dart';
import '../controllers/uploads_controller.dart';

class UploadsView extends GetView<UploadsController> {
  const UploadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        elevation: 10,
        onPressed: () {
          AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Success',
            desc: 'Data berhasil diupload',
            dialogBackgroundColor: primaryColor,
            titleTextStyle: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            descTextStyle: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            btnOkOnPress: () {
              Get.back();
            },
          ).show();
        },
        heroTag: 'add',
        child: const Icon(FontAwesomeIcons.paperPlane, color: secondaryColor),
      ),
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Upload Berkas'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FormBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/upload/upload.svg',
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'Data Pribadi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'ktp',
                    decoration: InputDecoration(
                      labelText: 'KTP',
                      alignLabelWithHint: true,
                      hintText: 'KTP',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxFiles: null,
                    allowMultiple: true,
                    previewImages: true,
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.any,
                        selector: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih KTP',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'kk',
                    decoration: InputDecoration(
                      labelText: 'Kartu Keluarga (Max 2 file)',
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxFiles: 2,
                    allowMultiple: true,
                    previewImages: true,
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.any,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih Kartu Keluarga',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'surat_nikah',
                    decoration: InputDecoration(
                      labelText: 'Surat Nikah (Opsional)',
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxFiles: 2,
                    allowMultiple: true,
                    previewImages: true,
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.any,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih Surat Nikah',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'surat_cerai_kematian',
                    decoration: InputDecoration(
                      labelText: 'Surat Cerai/Kematian (Opsional)',
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxFiles: 1,
                    allowMultiple: true,
                    previewImages: true,
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.any,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih Surat Cerai/Kematian',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'npwp',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'NPWP (Opsional)',
                      labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxFiles: null,
                    allowMultiple: true,
                    previewImages: true,
                    allowedExtensions: const ['pdf', 'doc', 'docx'],
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.custom,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih NPWP',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Berkas Agunan',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  FormBuilderImagePicker(
                    name: 'singlePhotoWithDecoration',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Foto Agunan',
                      labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    showDecoration: true,
                    maxImages: 10,
                    previewAutoSizeWidth: true,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'berkas_agunan',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Berkas Agunan',
                      labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxFiles: 10,
                    allowMultiple: true,
                    previewImages: true,
                    allowedExtensions: const ['pdf', 'doc', 'docx'],
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.custom,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih Berkas Agunan',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Lokasi Agunan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          enabled: false,
                          controller: controller.longtitude,
                          name: 'longitude',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Longitude',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          controller: controller.latitude,
                          name: 'latitude',
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Latitude',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    name: 'alamat',
                    enabled: false,
                    maxLines: 3,
                    controller: controller.alamat,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Alamat',
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.map_rounded),
                    label: const Text(
                      "Buka Map Agunan",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: secondaryColor,
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        maximumSize: const Size.fromWidth(double.infinity),
                        fixedSize: const Size(500, 50)),
                    onPressed: () {
                      showBarModalBottomSheet(
                        context: context,
                        bounce: true,
                        isDismissible: false,
                        enableDrag: false,
                        builder: (context) {
                          return OpenStreetMapSearchAndPick(
                            center: LatLong(
                                -7.7747316642396145, 110.38882218222294),
                            buttonColor: primaryColor,
                            buttonText: 'Pilih Lokasi',
                            onPicked: (pickedData) {
                              controller.latitude.text =
                                  pickedData.latLong.latitude.toString();
                              controller.longtitude.text =
                                  pickedData.latLong.longitude.toString();
                              controller.alamat.text = pickedData.address;
                              showToast(
                                'Lokasi Alamat Dipilih : ${controller.alamat.text}',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor,
                                ),
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: const Duration(seconds: 1),
                                duration: const Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Text(
                    'Berkas Usaha',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  FormBuilderImagePicker(
                    name: 'foto_usaha',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Foto Usaha',
                      labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    showDecoration: true,
                    maxImages: 10,
                    previewAutoSizeWidth: true,
                    imageQuality: 50,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderFilePicker(
                    name: 'surat_keterangan_usaha',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Surat Keterangan Usaha',
                      labelStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxFiles: null,
                    allowMultiple: true,
                    previewImages: true,
                    allowedExtensions: const ['pdf', 'doc', 'docx'],
                    onChanged: (val) => debugPrint(val.toString()),
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.custom,
                        selector: Row(
                          children: const [
                            Icon(FontAwesomeIcons.upload),
                            SizedBox(width: 25),
                            Text(
                              'Pilih Surat Keterangan Usaha',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                    onFileLoading: (val) {
                      debugPrint(val.toString());
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Lokasi Usaha',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          enabled: false,
                          controller: controller.longtitudeUsaha,
                          name: 'longitude_usaha',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Longitude',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          controller: controller.latitudeUsaha,
                          name: 'latitude_usaha',
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Latitude',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    name: 'alamat_usaha',
                    enabled: false,
                    maxLines: 3,
                    controller: controller.alamatUsaha,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Alamat Usaha',
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.map_rounded),
                    label: const Text(
                      "Buka Map Usaha",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: secondaryColor,
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        maximumSize: const Size.fromWidth(double.infinity),
                        fixedSize: const Size(500, 50)),
                    onPressed: () {
                      showBarModalBottomSheet(
                        context: context,
                        bounce: true,
                        isDismissible: false,
                        enableDrag: false,
                        builder: (context) {
                          return OpenStreetMapSearchAndPick(
                            center: LatLong(
                                -7.7747316642396145, 110.38882218222294),
                            buttonColor: primaryColor,
                            buttonText: 'Pilih Lokasi',
                            onPicked: (pickedData) {
                              controller.latitudeUsaha.text =
                                  pickedData.latLong.latitude.toString();
                              controller.longtitudeUsaha.text =
                                  pickedData.latLong.longitude.toString();
                              controller.alamatUsaha.text = pickedData.address;
                              showToast(
                                'Lokasi Alamat Dipilih : ${controller.alamatUsaha.text}',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor,
                                ),
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: const Duration(seconds: 1),
                                duration: const Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        // child: Column(
        //   children: [
        //     OpenStreetMapSearchAndPick(
        //         center: LatLong(23, 89),
        //         buttonColor: Colors.blue,
        //         buttonText: 'Set Current Location',
        //         onPicked: (pickedData) {
        //           print(pickedData.latLong.latitude);
        //           print(pickedData.latLong.longitude);
        //           print(pickedData.address);
        //         })
        //   ],
        // ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: const Text('A'),
    //   ),
    // body: OpenStreetMapSearchAndPick(
    //   center: LatLong(-7.7747316642396145, 110.38882218222294),
    //   buttonColor: primaryColor,
    //   buttonText: 'Pilih Lokasi',
    //   onPicked: (pickedData) {
    //     print(pickedData.latLong.latitude);
    //     print(pickedData.latLong.longitude);
    //     print(pickedData.address);
    //   },
    // ),
    // );
  }
}

const allDebiturs = [
  'Novian Andika',
  'Lussy Ika',
  'Meliya Aja',
  'Monkey D Luffy',
];
