import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/porsekot_table/views/components/table_porsekot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/porsekot_table_controller.dart';

class PorsekotTableView extends GetView<PorsekotTableController> {
  const PorsekotTableView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PorsekotTableView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skedul Angsuran Porsekot',
                  style: title,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderDropdown(
                            decoration: const InputDecoration(
                              labelText: 'Pilih Sistem Angsuran',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            initialValue: 'Efektif',
                            items: controller.sistemAngsuran
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            name: 'sistem_angsuran',
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Expanded(
                          child: Text('Angsuran Kredit'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: FormBuilderTextField(
                          name: 'jangka_waktu',
                          controller: controller.jangkaWaktu,
                          decoration: const InputDecoration(
                            suffix: Text('Bulan'),
                            labelText: 'Jangka Waktu',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Expanded(
                          child: Text(''),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'turun_pokok',
                            controller: controller.turunPokok,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              labelText: 'Turun Pokok',
                              prefix: Text('Setiap'),
                              suffix: Text('Bulan'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'jumlah_bayar',
                            enabled: false,
                            controller: controller.jumlahBayar,
                            decoration: const InputDecoration(
                              suffix: Text('Kali'),
                              labelText: 'Jumlah Bayar',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'suku_bunga',
                            controller: controller.sukuBunga,
                            decoration: const InputDecoration(
                              labelText: 'Suku Bunga',
                              suffixIcon: Icon(FontAwesomeIcons.percent),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'angsuran_pokok',
                            enabled: false,
                            controller: controller.angsuranPokok,
                            decoration: const InputDecoration(
                              labelText: 'Angsuran Pokok',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: FormBuilderTextField(
                          name: 'plafon',
                          controller: controller.plafon,
                          decoration: const InputDecoration(
                            labelText: 'Plafon',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: FormBuilderDateTimePicker(
                            resetIcon: null,
                            onChanged: (value) {
                              controller.tglMulaiKredit.value =
                                  DateFormat('yyyy MM dd').format(value!);
                            },
                            onFieldSubmitted: (value) {
                              controller.tglMulaiKredit.value =
                                  DateFormat('dd MM yyyy').format(value!);
                              debugPrint(value.toString());
                            },
                            onSaved: (value) {
                              controller.tglMulaiKredit.value =
                                  DateFormat('dd MM yyyy').format(value!);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Pilih Tanggal',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            inputType: InputType.date,
                            format: DateFormat('dd/MM/yyyy'),
                            validator: FormBuilderValidators.required(),
                            name: 'Tanggal',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        controller.hitungPorsekot();
                      },
                      child: const Text("Hitung Persekot"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TabelPorsekot(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
