// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

// 🌎 Project imports:
import '../../../common/style.dart';
import '../../../models/debtor.dart';
import '../../../models/debtor_details.dart';
import '../controllers/debitur_detail_banget_controller.dart';

class DebiturDetailBangetView extends StatefulWidget {
  const DebiturDetailBangetView({Key? key}) : super(key: key);

  @override
  State<DebiturDetailBangetView> createState() =>
      _DebiturDetailBangetViewState();
}

class _DebiturDetailBangetViewState extends State<DebiturDetailBangetView> {
  final data = Get.arguments;
  final controller = Get.put(DebiturDetailBangetController());

  Debtor debtor = Debtor();
  DebtorDetails debtorDetails = DebtorDetails();

  @override
  void initState() {
    super.initState();
    controller.detailsDebtor(data);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Edit fab

      appBar: AppBar(
        title: Obx(
          () => controller.loadingFetch.value
              ? const Text('Loading')
              : Text(controller.debtorDetails.peminjam1.toString()),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => controller.loadingFetch.value
              ? Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 400,
                  child: LiquidLinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(primaryColor),
                    backgroundColor: Colors.grey,
                    center: Text(
                      "Mencari debitur...",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: GetBuilder<DebiturDetailBangetController>(
                      init: controller,
                      builder: (_) => Column(
                        children: [
                          FutureBuilder(
                            future: controller.img,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data.toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          SizedBox(
                                            height: 400,
                                          ),
                                          // CircleAvatar(
                                          //   maxRadius: 75,
                                          //   backgroundColor: primaryColor,
                                          //   child: Text(
                                          //     controller.debtorDetails.peminjam1
                                          //         .toString()
                                          //         .substring(0, 1),
                                          //     style: GoogleFonts.andika(
                                          //         fontSize: 80),
                                          //   ),
                                          // ),
                                          // const SizedBox(height: 20),
                                          // Text(
                                          //   controller.debtorDetails.peminjam1
                                          //       .toString(),
                                          //   style: GoogleFonts.aBeeZee(
                                          //       fontSize: 30,
                                          //       color: secondaryColor),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // const SizedBox(height: 10),
                                          // Text(
                                          //   controller.debtorDetails.noKtp1
                                          //       .toString(),
                                          //   style: GoogleFonts.aBeeZee(
                                          //     fontSize: 25,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: secondaryColor,
                                          //   ),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://dummyimage.com/600x400/dbd0db/0011ff.jpg&text=Loading+image...',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          SizedBox(
                                            height: 400,
                                          ),
                                          // CircleAvatar(
                                          //   maxRadius: 75,
                                          //   backgroundColor: primaryColor,
                                          //   child: Text(
                                          //     controller.debtorDetails.peminjam1
                                          //         .toString()
                                          //         .substring(0, 1),
                                          //     style: GoogleFonts.andika(
                                          //         fontSize: 80),
                                          //   ),
                                          // ),
                                          // const SizedBox(height: 20),
                                          // Text(
                                          //   controller.debtorDetails.peminjam1
                                          //       .toString(),
                                          //   style: GoogleFonts.aBeeZee(
                                          //       fontSize: 30,
                                          //       color: secondaryColor),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // const SizedBox(height: 10),
                                          // Text(
                                          //   controller.debtorDetails.noKtp1
                                          //       .toString(),
                                          //   style: GoogleFonts.aBeeZee(
                                          //     fontSize: 25,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: secondaryColor,
                                          //   ),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
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
                                        title: Text(controller
                                            .debtorDetails.peminjam1
                                            .toString()),
                                        subtitle: const Text('Peminjam 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.peminjam2
                                            .toString()),
                                        subtitle: const Text('Peminjam 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.pemilikAgunan1
                                            .toString()),
                                        subtitle:
                                            const Text('Pemilik Agunan 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.pemilikAgunan2
                                            .toString()),
                                        subtitle:
                                            const Text('Pemilik Agunan 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.alamat1
                                            .toString()),
                                        subtitle: const Text('Alamat 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(
                                            '${controller.debtorDetails.lamanyaBerusaha.toString()} Tahun'),
                                        subtitle:
                                            const Text('Lamanya Berusaha'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.pendidikan
                                            .toString()),
                                        subtitle: const Text('Pendidikan'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.tempatLahir
                                            .toString()),
                                        subtitle: const Text('Tempat Lahir'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.bidangUsaha
                                            .toString()),
                                        subtitle: const Text('Bidang Usaha'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.noSkpk
                                            .toString()),
                                        subtitle: const Text('No SKPK'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(
                                          DateFormat('EEEE, dd MMMM yyyy')
                                              .format(
                                            DateTime.parse(controller
                                                .debtorDetails.tglSekarang
                                                .toString()),
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
                                        title: Text(controller
                                            .debtorDetails.ktp1
                                            .toString()),
                                        subtitle: const Text('KTP 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.ktp2
                                            .toString()),
                                        subtitle: const Text('KTP 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.noKtp1
                                            .toString()),
                                        subtitle: const Text('No KTP 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.noKtp2
                                            .toString()),
                                        subtitle: const Text('No KTP 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.alamat2
                                            .toString()),
                                        subtitle: const Text('Alamat 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.pekerjaan1
                                            .toString()),
                                        subtitle: const Text('Pekerjaan 1'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.pekerjaan2
                                            .toString()),
                                        subtitle: const Text('Pekerjaan 2'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        // Format tanggal
                                        title: Text(
                                          DateFormat('dd MMMM yyyy').format(
                                            DateTime.parse(
                                              controller
                                                  .debtorDetails.tanggalLahir
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                        subtitle: const Text('Tgl Lahir'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.jenisUsaha
                                            .toString()),
                                        subtitle: const Text('Jenis Usaha'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.umur
                                            .toString()),
                                        subtitle: const Text('Umur'),
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        title: Text(controller
                                            .debtorDetails.statusKeluarga
                                            .toString()),
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
                                title: Text(controller
                                    .debtorDetails.deskripsiDebitur
                                    .toString()),
                                subtitle: const Text('Deskripsi Debitur'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
