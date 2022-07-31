import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:akm/app/modules/create_debitur/controllers/create_debitur_controller.dart';
import 'package:akm/app/widget/summary_result.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key}) : super(key: key);

  final controller = Get.put(CreateDebiturController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      padding: const EdgeInsets.all(64),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Review Data Debitur',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          // Row Form
          summaryResult('Nama', controller.namaController),
          summaryResult('NIK', controller.nikController),
          summaryResult('Alamat', controller.alamatController),
          summaryResult('Tempat Lahir', controller.tempatLahirController),
          summaryResult('Tanggal Lahir', controller.tanggalLahirController),
          summaryResult('Nama Ibu', controller.namaIbuController),
          summaryResultString('Jenis Kelamin', controller.genderValue.value),
          summaryResultString('Agama', controller.agamaController.value),
          const SizedBox(
            height: 10,
          ),
          summaryResult('No Hp', controller.noHpIndonesiaController),
          summaryResult('No Selular', controller.noSelularIndonesiaController),
          summaryResult('Email', controller.emailController),
          const SizedBox(
            height: 10,
          ),
          summaryResult('Total Penghasilan', controller.moneyController),
          summaryResult('Bidang Usaha', controller.bidangUsahaController),
          summaryResult(
              'Jumlah Tanggungan', controller.jumlahTanggunganController),

          const SizedBox(
            height: 10,
          ),
          summaryResultString('Hubungan', controller.hubunganValue.value),
          if (controller.hubunganValue.value == 'Menikah') ...[
            summaryResult('Nama Pasangan', controller.namaPasanganController),
            summaryResult(
                'Pekerjaan Pasangan', controller.pekerjaanPasanganController),
            summaryResult('NIK Pasangan', controller.nikPasanganController),
            summaryResult('Tempat Lahir Pasangan',
                controller.tempatLahirPasanganController),
            summaryResult('Tanggal Lahir Pasangan',
                controller.tanggalLahirPasanganController),
          ],
          const SizedBox(
            height: 10,
          ),
          summaryResult('Instansi', controller.namaInstansiController),
          summaryResult('Pekerjaan', controller.pekerjaanController),
          const SizedBox(
            height: 10,
          ),
          summaryResult('Provinsi', controller.provinsiController),
          summaryResult('Kabupaten', controller.kabupatenController),
          summaryResult('Kecamatan', controller.kecamatanController),
          summaryResult('Kelurahan', controller.kelurahanController),
          summaryResult('RT', controller.rtController),
          summaryResult('RW', controller.rtController),
          summaryResult('Kode Pos', controller.kodePosController),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.sendData();
                    Get.back();
                  },
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Batal'))
            ],
          )
        ],
      ),
    );
  }
}
