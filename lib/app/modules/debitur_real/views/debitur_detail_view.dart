import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DebiturDetailView extends GetView<DebiturRealController> {
  const DebiturDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DebiturDetailView'),
        centerTitle: true,
        actions: [
          //Delete
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.deleteDebtor(data.id.toString());
              Get.back();
              controller.fetchDebitur();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          maxRadius: 75,
                          backgroundColor: primaryColor,
                          child: Text(
                            data.peminjam1.toString().substring(0, 1),
                            style: GoogleFonts.andika(fontSize: 80),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data.peminjam1.toString(),
                          style: GoogleFonts.aBeeZee(
                              fontSize: 30, color: secondaryColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.noKtp1.toString(),
                          style: GoogleFonts.aBeeZee(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: secondaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(data.peminjam1.toString()),
                            subtitle: const Text('Peminjam 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.peminjam2.toString()),
                            subtitle: const Text('Peminjam 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.pemilikAgunan1.toString()),
                            subtitle: const Text('Pemilik Agunan 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.pemilikAgunan2.toString()),
                            subtitle: const Text('Pemilik Agunan 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.alamat1.toString()),
                            subtitle: const Text('Alamat 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                                '${data.lamanyaBerusaha.toString()} Tahun'),
                            subtitle: const Text('Lamanya Berusaha'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.pendidikan.toString()),
                            subtitle: const Text('Pendidikan'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.tempatLahir.toString()),
                            subtitle: const Text('Tempat Lahir'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.bidangUsaha.toString()),
                            subtitle: const Text('Bidang Usaha'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.noSkpk.toString()),
                            subtitle: const Text('No SKPK'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              DateFormat('EEEE, dd MMMM yyyy').format(
                                DateTime.parse(data.tglSekarang.toString()),
                              ),
                            ),
                            subtitle: const Text('Tanggal Dibuat'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(data.ktp1.toString()),
                            subtitle: const Text('KTP 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.ktp2.toString()),
                            subtitle: const Text('KTP 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.noKtp1.toString()),
                            subtitle: const Text('No KTP 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.noKtp2.toString()),
                            subtitle: const Text('No KTP 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.alamat2.toString()),
                            subtitle: const Text('Alamat 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.pekerjaan1.toString()),
                            subtitle: const Text('Pekerjaan 1'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.pekerjaan2.toString()),
                            subtitle: const Text('Pekerjaan 2'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            // Format tanggal
                            title: Text(
                              DateFormat('dd MMMM yyyy').format(
                                DateTime.parse(data.tanggalLahir.toString()),
                              ),
                            ),
                            subtitle: const Text('Tgl Lahir'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.jenisUsaha.toString()),
                            subtitle: const Text('Jenis Usaha'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.umur.toString()),
                            subtitle: const Text('Umur'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(data.statusKeluarga.toString()),
                            subtitle: const Text('Status Keluarga'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 500,
                child: Card(
                  child: ListTile(
                    title: Text(data.deskripsiDebitur.toString()),
                    subtitle: const Text('Deskripsi Debitur'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
