import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class Angsuran extends StatelessWidget {
  Angsuran({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            'Angsuran Pinjaman Lain',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Bunga Pinjaman Lain',
                  decoration: const InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'Angsuran Perbulan Top',
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(''),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'Angsuran Perbulan Bottom',
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            enabled: false,
            textAlign: TextAlign.center,
            name: 'Total Angsuran Pinjaman Top',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: 'Total Angsuran Pinjaman ',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Pilih Flat/Nominal'),
                  alignment: Alignment.center,
                  name: 'Choice',
                  items: const [
                    DropdownMenuItem(
                        value: 'nominal',
                        child: Text(
                          'Nominal',
                          style: TextStyle(),
                        )),
                    DropdownMenuItem(
                      value: 'flat',
                      child: Text('Flat'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  enabled: false,
                  readOnly: true,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: primaryColor,
                  ),
                  name: 'Total Angsuran Pinjaman Bottom',
                  decoration: const InputDecoration(
                    labelText: 'Total Angsuran',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'Unknown Variable',
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: const InputDecoration(
              labelText: '',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          colorButton(
            context,
            'Hitung Total Angsuran Pinjaman',
            () {},
          ),
          const Divider(
            height: 100,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Angsuran Pinjaman Kredit
          Text(
            'Angsuran Pinjaman Kredit',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Bunga Pinjaman Kredit',
                  controller: controller.bungaPerTahun,
                  decoration: const InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'Angsuran Perbulan Kredit',
                  controller: controller.angsuranPerBulan,
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  decoration: const InputDecoration(
                    labelText: 'Angsuran Perbulan',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Pilih Flat/Nominal'),
                  alignment: Alignment.center,
                  name: 'Choice',
                  items: const [
                    DropdownMenuItem(
                        value: 'nominal',
                        child: Text(
                          'Nominal',
                          style: TextStyle(),
                        )),
                    DropdownMenuItem(
                      value: 'flat',
                      child: Text('Flat'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  name: 'Total Angsuran Kredit',
                  controller: controller.totalBunga,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: primaryColor,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Total Angsuran Kredit',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          colorButton(
            context,
            'Hitung Total Angsuran Pinjaman',
            () {},
          ),

          const Divider(
            height: 100,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Hitung Flat / Efektif
          Text(
            'Hitung Flat / Efektif',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'Flat Initial',
                  controller: controller.flatInitial,
                  decoration: const InputDecoration(
                    labelText: 'Flat Initial',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.efektifInitial,
                  name: 'Efektif Initial',
                  decoration: InputDecoration(
                    labelText: 'Efektif Initial',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        controller.hitungTotalEfektif();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'Flat Perbulan',
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            controller: controller.totalFlatEfektif,
            decoration: const InputDecoration(
              labelText: 'Total Flat / Efektif',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          colorButton(context, 'Hitung Flat / Efektif', () {
            controller.hitungFlatAndEfektif();
          }),
        ],
      ),
    );
  }
}
