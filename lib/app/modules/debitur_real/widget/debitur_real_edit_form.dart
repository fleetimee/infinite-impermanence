// 🐦 Flutter imports:
import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/modules/debitur_real/widget/debitur_real_text_label.dart';
import 'package:akm/app/widget/form/datepicker_field.dart';
import 'package:akm/app/widget/form/searchable_dropdown_field.dart';
import 'package:akm/app/widget/form/text_field.dart';
import 'package:akm/app/widget/generate_desc_button.dart';
import 'package:akm/app/widget/snackbar_simple.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DebiturEditForm extends StatelessWidget {
  final dynamic data;
  final DebiturRealController controller;

  const DebiturEditForm({
    super.key,
    required this.controller,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      onChanged: () {
        controller.formKey.currentState!.save();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const DebiturTitleTextLabel(
            text: 'Data Pribadi',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Peminjam Pertama',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'peminjam1',
                      controller: controller.peminjam1.value =
                          TextEditingController(
                        text: Get.arguments.peminjam1.toString(),
                      ),
                      hintText: 'Peminjam Pertama',
                      validator: FormBuilderValidators.required(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Asal KTP / Domisili 1',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'ktp1',
                      initialValue: data.ktp1,
                      onChanged: (value) {
                        controller.ktp1.value.text = value!;
                      },
                      onSaved: (value) {
                        controller.ktp1.value.text = value!;
                      },
                      validator: FormBuilderValidators.required(),
                      items: allProvinsi,
                      filterFn: (provinsi, filter) =>
                          provinsi.toLowerCase().contains(filter.toLowerCase()),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No KTP Peminjam Pertama',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_ktp1',
                controller: controller.noKtp1.value = TextEditingController(
                  text: data.noKtp1,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                hintText: 'No KTP Peminjam Pertama',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Peminjam Kedua',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'peminjam2',
                      controller: controller.peminjam2.value =
                          TextEditingController(
                        text: Get.arguments.peminjam2.toString(),
                      ),
                      hintText: 'Peminjam Kedua',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Asal KTP / Domisili 2',
                    ),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'ktp2',
                      initialValue: data.ktp2,
                      onChanged: (value) {
                        controller.ktp2.value.text = value!;
                      },
                      onSaved: (value) {
                        controller.ktp2.value.text = value!;
                      },
                      items: allProvinsi,
                      filterFn: (provinsi, filter) =>
                          provinsi.toLowerCase().contains(filter.toLowerCase()),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No KTP Peminjam Kedua (Opsional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_ktp2',
                controller: controller.noKtp2.value = TextEditingController(
                  text: data.noKtp2,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                hintText: 'No KTP Peminjam Kedua',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Peminjam Ketiga (Opsional)',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'peminjam3',
                      controller: controller.peminjam3.value =
                          TextEditingController(
                        text: Get.arguments.peminjam3.toString(),
                      ),
                      hintText: 'Peminjam Ketiga',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Peminjam Keempat (Opsional)',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'peminjam4',
                      controller: controller.peminjam4.value =
                          TextEditingController(
                        text: Get.arguments.peminjam4.toString(),
                      ),
                      hintText: 'Peminjam Keempat',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Nama Pemilik Agunan Pertama (Opsional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'pemilik_agunan_1',
                controller: controller.pemilikAgunan1.value =
                    TextEditingController(
                  text: data.pemilikAgunan1,
                ),
                hintText: 'Nama Pemilik Agunan Pertama',
              )
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Nama Pemilik Agunan Kedua (Opsional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'pemilik_agunan_2',
                controller: controller.pemilikAgunan2.value =
                    TextEditingController(
                  text: data.pemilikAgunan2,
                ),
                hintText: 'Nama Pemilik Agunan Kedua',
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No Telp Yang Bisa Dihubungi',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_telp',
                controller: controller.noHp.value = TextEditingController(
                  text: data.noHp,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                hintText: 'Masukkan No Handphone',
              ),
            ],
          ),
          const SizedBox(height: 30),
          const DebiturTitleTextLabel(
            text: 'Alamat Peminjam',
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Pertama (Wajib)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_1',
                    controller: controller.alamat1.value =
                        TextEditingController(
                      text: data.alamat1,
                    ),
                    keyboardType: TextInputType.multiline,
                    hintText: 'Masukkan Alamat Peminjam Pertama',
                    maxLines: 2,
                    alignLabelWithHint: true,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Kedua (Opsional)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_2',
                    controller: controller.alamat2.value =
                        TextEditingController(
                      text: data.alamat2,
                    ),
                    keyboardType: TextInputType.multiline,
                    hintText: 'Masukkan Alamat Peminjam Kedua',
                    maxLines: 2,
                    alignLabelWithHint: true,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                      text: 'Alamat Peminjam Ketiga (Opsional)'),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_3',
                    controller: controller.alamat3.value =
                        TextEditingController(
                      text: data.alamat3,
                    ),
                    keyboardType: TextInputType.multiline,
                    hintText: 'Masukkan Alamat Peminjam Ketiga',
                    maxLines: 2,
                    alignLabelWithHint: true,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Keempat (Opsional)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_4',
                    controller: controller.alamat4.value =
                        TextEditingController(
                      text: data.alamat4,
                    ),
                    keyboardType: TextInputType.multiline,
                    hintText: 'Masukkan Alamat Peminjam Keempat',
                    maxLines: 2,
                    alignLabelWithHint: true,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Data Pribadi Peminjam',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(text: 'Tempat Lahir'),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'tempat_lahir',
                      initialValue: data.tempatLahir,
                      items: allProvinsi,
                      filterFn: (provinsi, filter) =>
                          provinsi.toLowerCase().contains(filter.toLowerCase()),
                      onChanged: (value) {
                        controller.tempatLahir.value.text = value!;
                      },
                      onSaved: (value) {
                        controller.tempatLahir.value.text = value!;
                      },
                      validator: FormBuilderValidators.required(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(text: 'Tanggal Lahir'),
                    const SizedBox(height: 10),
                    FleetimeDatePicker(
                      name: 'tanggal_lahir',
                      initialValue: data.tanggalLahir,
                      onChanged: (value) {
                        controller.tanggalLahir.value = value!;
                        debugPrint(value.toString());

                        // get the year from value
                        final year = value.year;
                        // get the current year
                        final currentYear = DateTime.now().year;

                        // subtract the current year from the year of the value
                        final age = currentYear - year;

                        // set the age value
                        controller.umur.value.text = age.toString();
                      },
                      errorFormatText: 'Format tanggal salah',
                      errorInvalidText: 'Tanggal tidak valid',
                      hintText: 'Masukkan Tanggal Lahir',
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Umur (Otomatis)',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'umur',
                      readOnly: true,
                      controller: controller.umur.value = TextEditingController(
                        text: data.umur.toString(),
                      ),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.min(18,
                              errorText: 'Umur minimal 18 tahun'),
                          FormBuilderValidators.max(65,
                              errorText: 'Umur maksimal 65 tahun'),
                          FormBuilderValidators.maxLength(3,
                              errorText: 'Max 3 Karakter'),
                        ],
                      ),
                      keyboardType: TextInputType.number,
                      hintText: 'Masukkan Umur',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Status Keluarga',
                    ),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'status_keluarga',
                      initialValue: data.statusKeluarga,
                      items: controller.statusList,
                      onChanged: (value) {
                        controller.statusKeluargaInput.value = value!;
                      },
                      onSaved: (value) {
                        controller.statusKeluargaInput.value = value!;
                      },
                      filterFn: (status, filter) =>
                          status.toLowerCase().contains(filter.toLowerCase()),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Jumlah Tanggungan',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'jumlah_tanggungan',
                controller: controller.jumlahTanggungan.value =
                    TextEditingController(
                  text: data.jumlahTanggungan.toString(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(99,
                      errorText: 'Jumlah tanggungan maksimal 99 orang'),
                  FormBuilderValidators.maxLength(2,
                      errorText: 'Max 2 Karakter'),
                ]),
                keyboardType: TextInputType.number,
                hintText: 'Masukkan Jumlah Tanggungan',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                suffixText: 'Orang',
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No NPWP (Opsinal)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'npwp',
                controller: controller.npwp.value = TextEditingController(
                  text: data.npwp,
                ),
                validator: FormBuilderValidators.numeric(),
                keyboardType: TextInputType.number,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Masukkan No NPWP (Opsional)',
              )
            ],
          ),

          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Usaha Peminjam',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Lama Usaha',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'lamanya_berusaha',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2, errorText: 'Impposibru'),
                ]),
                controller: controller.lamanyaBerusaha.value =
                    TextEditingController(
                  text: data.lamanyaBerusaha.toString(),
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                hintText: 'Masukkan Lamanya Berusaha',
                suffixText: 'Tahun',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Lokasi Usaha',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'lokasi_usaha',
                controller: controller.lokasiUsaha.value =
                    TextEditingController(
                  text: data.lokasiUsaha,
                ),
                hintText: 'Masukkan Lokasi Usaha',
                alignLabelWithHint: true,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Jenis Usaha',
                    ),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'jenis_usaha',
                      initialValue: data.jenisUsaha,
                      items: controller.jenisUsahaList,
                      onChanged: (value) {
                        controller.jenisUsahaInput.value = value!;
                      },
                      onSaved: (value) {
                        controller.jenisUsahaInput.value = value!;
                      },
                      filterFn: (jenis, filter) =>
                          jenis.toLowerCase().contains(filter.toLowerCase()),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(text: 'Bidang Usaha'),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'bidang_usaha',
                      controller: controller.bidangUsaha.value =
                          TextEditingController(
                        text: data.bidangUsaha,
                      ),
                      hintText: 'Masukkan Bidang Usaha',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Jumlah Karyawan',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'jumlah_karyawan',
                controller: controller.jumlahKaryawan.value =
                    TextEditingController(
                  text: data.jumlahKaryawan.toString(),
                ),
                validator: FormBuilderValidators.numeric(),
                keyboardType: TextInputType.number,
                hintText: 'Masukkan Jumlah Karyawan',
                suffixText: 'Orang',
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Pendidikan Peminjam',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Pendidikan Terakhir Peminjam Pertama',
              ),
              const SizedBox(height: 10),
              FleetimeSearchableDropdown(
                name: 'pendidikan',
                initialValue: data.pendidikan,
                items: controller.pendidikanList,
                onChanged: (value) {
                  controller.pendidikanInput.value = value!;
                },
                onSaved: (value) {
                  controller.pendidikanInput.value = value!;
                },
                filterFn: (jenis, filter) =>
                    jenis.toLowerCase().contains(filter.toLowerCase()),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Pekerjaan Peminjam',
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Pekerjaan Peminjam Pertama',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'pekerjaan1',
                      controller: controller.pekerjaan1.value =
                          TextEditingController(
                        text: data.pekerjaan1,
                      ),
                      hintText: 'Masukkan Pekerjaan Peminjam Pertama',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Pekerjaan Peminjam Kedua',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'pekerjaan2',
                      controller: controller.pekerjaan2.value =
                          TextEditingController(
                        text: data.pekerjaan2,
                      ),
                      hintText: 'Masukkan Pekerjaan Peminjam Kedua',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Lainnya',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No SKPK (Optional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_skpk',
                controller: controller.noSkpk.value = TextEditingController(
                  text: data.noSkpk,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.numeric(),
                  ],
                ),
                keyboardType: TextInputType.number,
                hintText: 'Masukkan No SKPK',
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Current Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Tanggal Input Data',
              ),
              const SizedBox(height: 10),
              FleetimeDatePicker(
                errorFormatText: 'Format Tanggal Salah',
                errorInvalidText: 'Tanggal Tidak Valid',
                hintText: 'Masukkan Tanggal Input Data',
                name: 'tgl_sekarang',
                initialValue: data.tglSekarang,
                onChanged: (value) {
                  controller.tanggalSekarangInput.value = value!;
                  debugPrint(value.toString());
                },
                inputType: InputType.date,
                format: DateFormat('dd MMMM, yyyy'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Deskripsi Debitur',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'deskripsi_debitur',
                controller: controller.deskripsiDebitur.value =
                    TextEditingController(
                  text: data.deskripsiDebitur,
                ),
                maxLines: 5,
                hintText: 'Masukkan Deskripsi Debitur',
              ),
            ],
          ),
          const SizedBox(height: 16),

          ButtonGenDesc(
            text: 'Buat Deskripsi',
            icon: Icons.description,
            onPressed: () {
              controller.generateDescription();

              SnackbarSimple.show(context, 'Deskripsi berhasil dibuat');
            },
          ),
        ],
      ),
    );
  }
}
