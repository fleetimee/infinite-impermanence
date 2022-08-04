import 'package:akm/app/modules/penghasilan_xtetap/controllers/penghasilan_xtetap_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class StepOneForm extends StatelessWidget {
  StepOneForm({Key? key}) : super(key: key);

  final controller = Get.put(PenghasilanXtetapController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKeys[1],
      child: Column(
        children: <Widget>[
          const Text(
            'Pengajuan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Isikan data pengajuan dengan jelas dan benar. Kami akan melakukan verifikasi data pengajuan anda dan akan menghubungi anda melalui email setelah pengajuan anda disetujui.',
            style: TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.fade,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FormBuilderDropdown(
            name: 'Jenis Pengajuan',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pilih Jenis Pengajuan',
              labelText: 'Jenis Pengajuan',
              prefixIcon: Icon(Icons.category),
              hintTextDirection: TextDirection.rtl,
            ),
            items: const [
              DropdownMenuItem(
                value: 'BARU',
                child: Text('Baru'),
              ),
              DropdownMenuItem(
                value: 'ADENDUM',
                child: Text('Adendum'),
              ),
              DropdownMenuItem(
                value: 'RESTRUK',
                child: Text('Restrukturisasi'),
              ),
            ],
            onChanged: (String? newValue) {
              controller.jenisPengajuanValue.value = newValue!;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            controller: controller.plafonFasilitasController,
            name: 'Plafon Fasilitas',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan Plafon Fasilitas',
              labelText: 'Plafon Fasilitas',
              prefixText: 'RP',
              prefixIcon: Icon(Icons.attach_money),
              hintTextDirection: TextDirection.rtl,
            ),
            keyboardType: TextInputType.number,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderDropdown(
            name: 'Jenis Penggunaan',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pilih Jenis Penggunaan',
              labelText: 'Jenis Penggunaan',
              prefixIcon: Icon(Icons.car_crash_sharp),
              hintTextDirection: TextDirection.rtl,
            ),
            items: const [
              DropdownMenuItem(
                value: 'INVESTASI',
                child: Text('Investasi'),
              ),
              DropdownMenuItem(
                value: 'MODAL USAHA',
                child: Text('Modal Usaha'),
              ),
              DropdownMenuItem(
                value: 'RESTRUK',
                child: Text('Restrukturisasi'),
              ),
            ],
            onChanged: (String? newValue) {
              controller.jenisPenggunaanValue.value = newValue!;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            controller: controller.tujuanPenggunaanController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  'Deskripsikan tujuan penggunaan secara detail dan jelas. \n\n'
                  'Misal: Perdagangan, Investasi, Modal Usaha',
              labelText: 'Tujuan Penggunaan',
              prefixIcon: Icon(Icons.casino),
              hintMaxLines: 5,
            ),
            maxLines: 5,
            name: 'Tujuan Penggunaan',
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderDateRangePicker(
            name: 'Jangka Waktu',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Pilih Jangka Waktu',
              labelText: 'Jangka Waktu',
              prefixIcon: Icon(Icons.date_range),
              hintTextDirection: TextDirection.rtl,
            ),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050),
            // onChanged: (DateTime? startDate, DateTime? endDate) {
            //   controller.jangkaWaktuStart.value = startDate;
            //   controller.jangkaWaktuEndalue = endDate;
            // },
          ),
        ],
      ),
    );
  }
}
