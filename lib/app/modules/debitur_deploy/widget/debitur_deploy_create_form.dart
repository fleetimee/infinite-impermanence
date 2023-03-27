import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_deploy/controllers/debitur_deploy_controller.dart';
import 'package:akm/app/widget/form/datepicker_field.dart';
import 'package:akm/app/widget/form/searchable_dropdown_field.dart';
import 'package:akm/app/widget/form/text_field.dart';
import 'package:akm/app/widget/generate_desc_button.dart';
import 'package:akm/app/widget/snackbar_simple.dart';
import 'package:akm/app/widget/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DebiturDeployCreateForm extends StatelessWidget {
  final DebiturDeployController controller;

  /// Create Debitur Form
  /// [controller] is the controller of the form
  const DebiturDeployCreateForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      autovalidateMode: AutovalidateMode.disabled,
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const DebiturTitleTextLabel(
            text: 'Peminjam Pertama',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text: 'Detail untuk Peminjam Pertama',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Nama Peminjam Pertama',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'peminjam1',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.peminjam1.value,
                validator: FormBuilderValidators.required(),
                hintText: 'Masukkan Nama Peminjam Pertama',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Asal KTP / Domisili Peminjam Pertama',
              ),
              const SizedBox(height: 10),
              FleetimeSearchableDropdown(
                name: 'ktp1',
                onChanged: (value) {
                  controller.ktp1.value.text = value!;
                },
                validator: FormBuilderValidators.required(),
                filterFn: (provinsi, filter) =>
                    provinsi.toLowerCase().contains(filter.toLowerCase()),
                items: allProvinsi,
                hintText: 'Pilih Provinsi',
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
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.noKtp1.value,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(16),
                ]),
                hintText: 'Masukkan No KTP Peminjam Pertama',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No Telp Peminjam Pertama',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'noTelp',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.noHp.value,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(13),
                ]),
                hintText: 'Masukkan No Handphone',
                keyboardType: TextInputType.number,
              ),
            ],
          ),

          const SizedBox(height: 16),
          const DebiturTitleTextLabel(
            text: 'Peminjam Kedua (Opsional)',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text: 'Detail untuk peminjam kedua (jika ada)',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Nama Peminjam Kedua (jika ada)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'peminjam2',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.peminjam2.value,
                hintText: 'Masukkan Nama Peminjam Kedua',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Asal KTP / Domisili Peminjam Kedua (jika ada)',
              ),
              const SizedBox(height: 10),
              FleetimeSearchableDropdown(
                name: 'ktp2',
                onChanged: (value) {
                  if (value != null) {
                    controller.ktp2.value.text = value;
                  } else {
                    controller.ktp2.value.text = '-';
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    controller.ktp2.value.text = value;
                  } else {
                    controller.ktp2.value.text = '-';
                  }
                },
                filterFn: (provinsi, filter) =>
                    provinsi.toLowerCase().contains(filter.toLowerCase()),
                items: allProvinsi,
                hintText: 'Pilih Provinsi',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No KTP Peminjam Kedua (jika ada)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_ktp2',
                controller: controller.noKtp2.value,
                hintText: 'Masukkan No KTP Peminjam Kedua',
                keyboardType: TextInputType.number,
              ),
            ],
          ),

          Visibility(
            visible: false,
            maintainState: true,
            child: Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'peminjam3',
                    controller: controller.peminjam3.value,
                    decoration: const InputDecoration(
                      labelText: 'Peminjam 3',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan Peminjam 3',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          Visibility(
            visible: false,
            maintainState: true,
            child: Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'peminjam4',
                    controller: controller.peminjam4.value,
                    decoration: const InputDecoration(
                      labelText: 'Peminjam 4',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan Peminjam 4',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Pemilik Agunan',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text: 'Diisi dengan nama pemilik agunan (bisa dikosongkan)',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Pemilik Agunan Pertama',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'pemilik_agunan_1',
                      controller: controller.pemilikAgunan1.value,
                      hintText: 'Masukkan Nama Pemilik Agunan Pertama',
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
                      text: 'Pemilik Agunan Kedua',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'pemilik_agunan_2',
                      controller: controller.pemilikAgunan2.value,
                      hintText: 'Masukkan Nama Pemilik Agunan Kedua',
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Alamat Peminjam',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text:
                'Diisi dengan alamat peminjam (Alamat kedua sampai keempat bisa dikosongkan)',
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Pertama (wajib)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_1',
                    controller: controller.alamat1.value,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    hintText: 'Masukkan Alamat Peminjam Pertama',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Kedua (opsional)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_2',
                    controller: controller.alamat2.value,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    hintText: 'Masukkan Alamat Peminjam Kedua (jika ada)',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Ketiga (opsional)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_3',
                    controller: controller.alamat3.value,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    hintText: 'Masukkan Alamat Peminjam Ketiga (jika ada)',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DebiturTextLabel(
                    text: 'Alamat Peminjam Keempat (opsional)',
                  ),
                  const SizedBox(height: 10),
                  FleetimeTextField(
                    name: 'alamat_4',
                    controller: controller.alamat4.value,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    hintText: 'Masukkan Alamat Peminjam Keempat (jika ada)',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Data Pribadi Peminjam',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text:
                'Diisi dengan data pribadi peminjam, NPWP jika tidak ada, bisa dikosongkan',
          ),
          Text(
            'NPWP jika tidak ada, bisa dikosongkan',
            style: Theme.of(context).textTheme.bodySmall?.merge(
                  const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(
                      text: 'Tempat Lahir',
                    ),
                    const SizedBox(height: 10),
                    FleetimeSearchableDropdown(
                      name: 'tempat_lahir',
                      onChanged: (value) {
                        controller.tempatLahir.value.text = value!;
                        debugPrint(value);
                      },
                      validator: FormBuilderValidators.required(),
                      items: allProvinsi,
                      hintText: 'Pilih Tempat Lahir',
                      filterFn: (provinsi, filter) =>
                          provinsi.toLowerCase().contains(filter.toLowerCase()),
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
                      onChanged: (value) {
                        controller.tanggalLahir.value = value!;
                        debugPrint(value.toString());

                        // get the year from value
                        final year = value.year;
                        // get the current year
                        final currentYear = DateTime.now().year;

                        // subtract the current year from the year of the value
                        final age = currentYear - year;

                        // set the age
                        controller.umur.value.text = age.toString();
                      },
                      errorFormatText: 'Format tanggal salah',
                      errorInvalidText: 'Tanggal tidak valid',
                      inputType: InputType.date,
                      hintText: 'Masukkan Tanggal Lahir',
                      format: DateFormat('dd-MM-yyyy'),
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
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.umur.value,
                      keyboardType: TextInputType.number,
                      hintText: 'Umur (Otomatis)',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(18,
                            errorText: 'Umur minimal 18 tahun'),
                        FormBuilderValidators.max(65,
                            errorText: 'Umur maksimal 65 tahun'),
                        FormBuilderValidators.maxLength(3,
                            errorText: 'Max 3 Karakter'),
                      ]),
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
                      onChanged: (value) {
                        controller.statusKeluargaInput.value = value!;
                        debugPrint(value);
                      },
                      items: controller.statusList,
                      hintText: 'Pilih Status Keluarga',
                      filterFn: (status, filter) =>
                          status.toLowerCase().contains(filter.toLowerCase()),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Jumlah Tanggungan',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'jumlah_tanggungan',
                controller: controller.jumlahTanggungan.value,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Masukkan Jumlah Tanggungan',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(99,
                      errorText: 'Jumlah tanggungan maksimal 99 orang'),
                  FormBuilderValidators.maxLength(2,
                      errorText: 'Max 2 Karakter'),
                ]),
                suffixText: 'Orang',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No NPWP (Opsional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'npwp',
                controller: controller.npwp.value,
                validator: FormBuilderValidators.numeric(),
                keyboardType: TextInputType.number,
                hintText: 'Masukkan No NPWP (Opsional)',
              ),
            ],
          ),
          const SizedBox(height: 25),

          const DebiturTitleTextLabel(
            text: 'Usaha Peminjam',
          ),
          const SizedBox(height: 10),
          const DebiturSubtitleTextLabel(
            text:
                'Detail Usaha Peminjam yang nantinya akan dijadikan parameter untuk penilaian kelayakan',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'Lamanya Berusaha',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'lamanya_berusaha',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2, errorText: 'Impposibru'),
                ]),
                controller: controller.lamanyaBerusaha.value,
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
                controller: controller.lokasiUsaha.value,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Masukkan Lokasi Usaha',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxLength(100,
                      errorText: 'Max 100 Karakter'),
                ]),
                maxLines: 3,
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
                      onChanged: (value) {
                        controller.jenisUsahaInput.value = value!;
                        debugPrint(value);
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      items: controller.jenisUsahaList,
                      hintText: 'Pilih Jenis Usaha',
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
                    const DebiturTextLabel(
                      text: 'Bidang Usaha',
                    ),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'bidang_usaha',
                      controller: controller.bidangUsaha.value,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      hintText: 'Masukkan Bidang Usaha',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(100,
                              errorText: 'Max 100 Karakter'),
                        ],
                      ),
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
                controller: controller.jumlahKaryawan.value,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Masukkan Jumlah Karyawan',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.maxLength(2,
                      errorText: 'Max 2 Karakter'),
                ]),
                suffixText: 'Orang',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const SizedBox(height: 25),
          const DebiturTitleTextLabel(
            text: 'Pendidikan Peminjam',
          ),
          const SizedBox(height: 10.0),
          const DebiturSubtitleTextLabel(
            text:
                'Detail Pendidikan Peminjam yang nantinya akan dijadikan parameter untuk penilaian kelayakan',
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
                onChanged: (value) {
                  controller.pendidikanInput.value = value!;
                  debugPrint(value);
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                items: controller.pendidikanList,
                hintText: 'Pilih Pendidikan Terakhir',
                filterFn: (jenis, filter) =>
                    jenis.toLowerCase().contains(filter.toLowerCase()),
              ),
            ],
          ),
          const SizedBox(height: 25),

          const DebiturTitleTextLabel(text: 'Pekerjaan Peminjam'),
          const SizedBox(height: 10.0),
          const DebiturSubtitleTextLabel(
            text: 'Detail Pekerjaan Peminjam yang nantinya akan di cetak',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DebiturTextLabel(text: 'Pekerjaan Peminjam Pertama'),
                    const SizedBox(height: 10),
                    FleetimeTextField(
                      name: 'pekerjaan1',
                      controller: controller.pekerjaan1.value,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      hintText: 'Masukkan Pekerjaan Peminjam Pertama',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(100,
                              errorText: 'Max 100 Karakter'),
                        ],
                      ),
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
                      controller: controller.pekerjaan2.value,
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
          const SizedBox(height: 10.0),
          const DebiturSubtitleTextLabel(
            text:
                'Detail Lainnya yang nantinya akan dijadikan parameter untuk penilaian kelayakan',
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(
                text: 'No SKPK (Opsional)',
              ),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'no_skpk',
                controller: controller.noSkpk.value,
                hintText: 'Masukkan No SKPK',
                keyboardType: TextInputType.number,
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
                name: 'tgl_input',
                onChanged: (value) {
                  controller.tanggalSekarangInput.value = value!;
                  debugPrint(value.toString());
                },
                hintText: 'Masukkan Tanggal Input Data',
                errorFormatText: 'Format Tanggal Salah',
                errorInvalidText: 'Tanggal Tidak Valid',
                inputType: InputType.date,
                format: DateFormat('dd MMMM yyyy'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DebiturTextLabel(text: 'Deskripsi Debitur'),
              const SizedBox(height: 10),
              FleetimeTextField(
                name: 'deskripsi_debitur',
                controller: controller.deskripsiDebitur.value,
                maxLines: 5,
                hintText:
                    'Masukkan Deskripsi Debitur atau Generate Deskripsi dari data yang sudah diinputkan dengan klik tombol Generate Deskripsi',
                alignLabelWithHint: true,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(1000,
                        errorText: 'Max 1000 Karakter'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
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
