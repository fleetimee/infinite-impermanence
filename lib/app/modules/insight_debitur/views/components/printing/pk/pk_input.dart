import 'dart:convert';

import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/bottomnavbar_button.dart';
import 'package:akm/app/widget/form/text_field.dart';
import 'package:akm/app/widget/text_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputBeforePk extends StatefulWidget {
  const InputBeforePk({super.key});

  @override
  State<InputBeforePk> createState() => _InputBeforePkState();
}

class _InputBeforePkState extends State<InputBeforePk> {
  final data = Get.arguments;

  final _formKey = GlobalKey<FormBuilderState>();

  String mainBranch = '';
  String helperBranch = '';
  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _getOffice();
  }

  _getOffice() async {
    SharedPreferences.getInstance().then((prefs) {
      final officeJsonString = prefs.getString('office');
      final office = json.decode(officeJsonString!);

      setState(() {
        mainBranch = office['cabang_utama'];
        helperBranch = office['cabang_pembantu'];
      });
    });
  }

  final TextEditingController _telpKantor = TextEditingController();
  final TextEditingController _faxKantor = TextEditingController();
  final TextEditingController _pemimpinCapem = TextEditingController();
  final TextEditingController _pemimpinCabut = TextEditingController();
  final TextEditingController _alamatCapem = TextEditingController();
  final TextEditingController _noSubtitusi = TextEditingController();
  final TextEditingController _noSuratKuasa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Perjanjian Kredit ${data.peminjam1}'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataDokumen(
                      noSubtitusi: _noSubtitusi,
                      noSuratKuasa: _noSuratKuasa,
                    ),
                    const SizedBox(height: 16),
                    DataDebitur(
                      data: data,
                    ),
                    const SizedBox(height: 16),
                    DataCabut(
                      pemimpinCabut: _pemimpinCabut,
                      mainBranch: mainBranch,
                    ),
                    const SizedBox(height: 16),
                    DataCapem(
                      pemimpinCapem: _pemimpinCapem,
                      helperBranch: helperBranch,
                      alamatCapem: _alamatCapem,
                      telpKantor: _telpKantor,
                      faxKantor: _faxKantor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarButton(
        text: 'Print',
        icon: Icons.print,
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            debugPrint(_formKey.currentState?.value.toString());

            Map<dynamic, dynamic> formData =
                _formKey.currentState?.value as Map<dynamic, dynamic>;

            Get.toNamed(
              Routes.PK_PRINTING,
              arguments: [
                data,
                formData,
                helperBranch,
                mainBranch,
              ],
            );
          } else {
            debugPrint(_formKey.currentState?.value.toString());
            debugPrint('validation failed');
          }
        },
      ),
    );
  }
}

class DataDokumen extends StatelessWidget {
  const DataDokumen({
    super.key,
    required TextEditingController noSubtitusi,
    required TextEditingController noSuratKuasa,
  })  : _noSubtitusi = noSubtitusi,
        _noSuratKuasa = noSuratKuasa;

  final TextEditingController _noSubtitusi;
  final TextEditingController _noSuratKuasa;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DebiturTitleTextLabel(
          text: 'Data Dokumen',
        ),
        const SizedBox(height: 10),
        const DebiturSubtitleTextLabel(
          text: 'Data Dokumen Seperti No Subtitusi dan Surat Kuasa',
        ),
        const SizedBox(height: 16.0),
        const DebiturTextLabel(text: 'No Subtitusi'),
        const SizedBox(height: 10.0),
        FleetimeTextField(
          name: 'no_subtitusi',
          hintText: '1415/OM 0005 tanggal 10 Agustus 2022 ',
          controller: _noSubtitusi,
          validator: FormBuilderValidators.required(),
          maxLines: 2,
        ),
        const SizedBox(height: 16.0),
        const DebiturTextLabel(text: 'No Surat Kuasa'),
        const SizedBox(height: 10.0),
        FleetimeTextField(
          name: 'no_surat_kuasa',
          hintText: '0160/KP 1006 tanggal 9 Agustus 2022 ',
          controller: _noSuratKuasa,
          validator: FormBuilderValidators.required(),
          maxLines: 2,
        ),
      ],
    );
  }
}

class DataCapem extends StatelessWidget {
  /// This is data for helper branch
  /// that will be printed on the pk
  const DataCapem({
    super.key,
    required TextEditingController pemimpinCapem,
    required this.helperBranch,
    required TextEditingController alamatCapem,
    required TextEditingController telpKantor,
    required TextEditingController faxKantor,
  })  : _pemimpinCapem = pemimpinCapem,
        _alamatCapem = alamatCapem,
        _telpKantor = telpKantor,
        _faxKantor = faxKantor;

  final TextEditingController _pemimpinCapem;
  final String helperBranch;
  final TextEditingController _alamatCapem;
  final TextEditingController _telpKantor;
  final TextEditingController _faxKantor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DebiturTitleTextLabel(
          text: 'Data Kantor Capem',
        ),
        const SizedBox(height: 10),
        const DebiturSubtitleTextLabel(
          text: 'Data kantor capem yang sudah anda pilih sebelumnya',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Pemimpin Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'pemimpin_kantor',
          controller: _pemimpinCapem,
          hintText: 'Masukkan Nama Pemimpin Kantor',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Nama Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'pembantu',
          controller: TextEditingController(text: helperBranch),
          maxLines: 3,
          hintText: 'Kantor Pembantu',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Alamat Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'alamat_kantor',
          controller: _alamatCapem,
          hintText: 'Masukkan Alamat Kantor',
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'No Telp Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'telp_kantor',
          controller: _telpKantor,
          hintText: 'Masukkan No Telp Kantor',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'No Fax Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'fax_kantor',
          controller: _faxKantor,
          hintText: 'Masukkan No Fax Kantor',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}

class DataCabut extends StatelessWidget {
  const DataCabut({
    super.key,
    required TextEditingController pemimpinCabut,
    required this.mainBranch,
  }) : _pemimpinCabut = pemimpinCabut;

  final TextEditingController _pemimpinCabut;
  final String mainBranch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DebiturTitleTextLabel(
          text: 'Data Kantor',
        ),
        const SizedBox(height: 10),
        const DebiturSubtitleTextLabel(
          text: 'Data kantor capem yang sudah anda pilih sebelumnya',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Pemimpin Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'pemimpin_cabut',
          controller: _pemimpinCabut,
          hintText: 'Masukkan Nama Pemimpin Kantor',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Nama Kantor'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'utama_kantor',
          controller: TextEditingController(text: mainBranch),
          maxLines: 3,
          hintText: 'Kantor Utama',
        ),
      ],
    );
  }
}

class DataDebitur extends StatelessWidget {
  const DataDebitur({
    super.key,
    required this.data,
  });

  final DebiturInsight data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DebiturTitleTextLabel(
          text: 'Data Peminjam (Read Only)',
        ),
        const SizedBox(height: 10),
        const DebiturSubtitleTextLabel(
          text: 'Detail data peminjam yang akan diproses',
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Nama Peminjam'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'peminjam1',
          hintText: 'Nama Peminjam',
          controller: TextEditingController(text: data.peminjam1),
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Alamat Peminjam'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'alamat1',
          hintText: 'Alamat Peminjam',
          controller: TextEditingController(text: data.alamat1),
          readOnly: true,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        const DebiturTextLabel(text: 'Domisili KTP Peminjam Pertama'),
        const SizedBox(height: 10),
        FleetimeTextField(
          name: 'ktp1',
          hintText: 'No. KTP Peminjam',
          controller: TextEditingController(text: data.ktp1),
          readOnly: true,
        ),
      ],
    );
  }
}
