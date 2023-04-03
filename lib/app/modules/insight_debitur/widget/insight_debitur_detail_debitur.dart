// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/views/components/header_accordion/detail_debitur.dart';
import '../controllers/insight_debitur_controller.dart';

class InsighDebiturDetailDebitur extends StatelessWidget {
  final InsightDebiturController controller;

  const InsighDebiturDetailDebitur({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: HeaderDetailDebitur(controller: controller),
        ),
        Obx(
          () => controller.isDataLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Data Pribadi',
                        style: detailDebiturHeading,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Table Data Pribadi
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(
                            children: [
                              paddedText('ID'),
                              paddedText(controller.insightDebitur.value.id
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('No. Debitur'),
                              paddedText(controller
                                  .insightDebitur.value.noDebitur
                                  .toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Peminjam 1'),
                              paddedText(
                                controller.insightDebitur.value.peminjam1
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Peminjam 2'),
                              controller.insightDebitur.value.peminjam2
                                          .toString() ==
                                      ''
                                  ? paddedText('-')
                                  : paddedText(
                                      controller.insightDebitur.value.peminjam2
                                          .toString(),
                                    ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Peminjam 3'),
                              controller.insightDebitur.value.peminjam3
                                          .toString() ==
                                      ''
                                  ? paddedText('-')
                                  : paddedText(
                                      controller.insightDebitur.value.peminjam3
                                          .toString(),
                                    ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Peminjam 4'),
                              controller.insightDebitur.value.peminjam4
                                          .toString() ==
                                      ''
                                  ? paddedText('-')
                                  : paddedText(
                                      controller.insightDebitur.value.peminjam4
                                          .toString(),
                                    ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Asal KTP 1'),
                              paddedText(
                                controller.insightDebitur.value.ktp1.toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Asal KTP 2'),
                              paddedText(
                                controller.insightDebitur.value.ktp2.toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Alamat 1'),
                              paddedText(
                                controller.insightDebitur.value.alamat1
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Alamat 2'),
                              paddedText(
                                controller.insightDebitur.value.alamat2
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller.insightDebitur.value.alamat2
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Alamat 3'),
                              paddedText(
                                controller.insightDebitur.value.alamat3
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller.insightDebitur.value.alamat3
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Alamat 4'),
                              paddedText(
                                controller.insightDebitur.value.alamat4
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller.insightDebitur.value.alamat4
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('No. KTP 1'),
                              paddedText(
                                controller.insightDebitur.value.noKtp1
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('No. KTP 2'),
                              paddedText(
                                controller.insightDebitur.value.noKtp2
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller.insightDebitur.value.noKtp2
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Pekerjaan 1'),
                              paddedText(
                                controller.insightDebitur.value.pekerjaan1
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Pekerjaan 2'),
                              paddedText(
                                controller.insightDebitur.value.pekerjaan2
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller.insightDebitur.value.pekerjaan2
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('TTL'),
                              paddedText(
                                '${controller.insightDebitur.value.tempatLahir.toString()}, ${DateFormat('dd MMMM yyyy').format(
                                  DateTime.parse(
                                    controller.insightDebitur.value.tanggalLahir
                                        .toString(),
                                  ),
                                )}',
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Umur'),
                              paddedText(
                                controller.insightDebitur.value.umur.toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Deskripsi'),
                              paddedText(
                                controller.insightDebitur.value.deskripsiDebitur
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('No HP'),
                              paddedText(
                                controller.insightDebitur.value.noHp.toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('NPWP'),
                              controller.insightDebitur.value.npwp.toString() ==
                                      ''
                                  ? paddedText('-')
                                  : paddedText(
                                      controller.insightDebitur.value.npwp
                                          .toString(),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Data Agunan',
                        style: detailDebiturHeading,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(
                            children: [
                              paddedText('Pemilik Agunan 1'),
                              paddedText(
                                controller.insightDebitur.value.pemilikAgunan1
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller
                                        .insightDebitur.value.pemilikAgunan1
                                        .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Pemilik Agunan 2'),
                              paddedText(
                                controller.insightDebitur.value.pemilikAgunan2
                                            .toString() ==
                                        ''
                                    ? '-'
                                    : controller
                                        .insightDebitur.value.pemilikAgunan2
                                        .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Data Relasi',
                        style: detailDebiturHeading,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Table Relasi
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(
                            children: [
                              paddedText('Sts Keluarga'),
                              paddedText(
                                controller.insightDebitur.value.statusKeluarga
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Tanggungan'),
                              paddedText(
                                '${controller.insightDebitur.value.jumlahTanggungan.toString()} Orang',
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Data Pendidikan',
                        style: detailDebiturHeading,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Table Pendidikan
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(
                            children: [
                              paddedText('Pendidikan Terakhir'),
                              paddedText(
                                controller.insightDebitur.value.pendidikan
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Data Usaha',
                        style: detailDebiturHeading,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      // Table Usaha
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(0.4),
                          1: FlexColumnWidth(1),
                        },
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        children: [
                          TableRow(
                            children: [
                              paddedText('Lamanya Berusaha'),
                              paddedText(
                                '${controller.insightDebitur.value.lamanyaBerusaha.toString()} Tahun',
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Jenis Usaha'),
                              paddedText(
                                controller.insightDebitur.value.jenisUsaha
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Bidang Usaha'),
                              paddedText(
                                controller.insightDebitur.value.bidangUsaha
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Lokasi Usaha'),
                              paddedText(
                                controller.insightDebitur.value.lokasiUsaha
                                    .toString(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              paddedText('Jumlah Karyawan'),
                              paddedText(
                                controller.insightDebitur.value.jumlahKaryawan
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

Widget paddedText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 17),
    ),
  );
}
