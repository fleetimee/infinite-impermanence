// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/porsekot_table/views/components/table_porsekot.dart';
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.max(48,
                                errorText: 'Max 48 bln'),
                            FormBuilderValidators.numeric(),
                          ]),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric(),
                              FormBuilderValidators.match(
                                r'^(1|3|4|6|12)$',
                                errorText: 'Harus 1,3,4,6,12',
                              ),
                            ]),
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
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Rerata per bulan',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'rerata_per_bulan',
                        enabled: false,
                        controller: controller.rerataPerbulan,
                        decoration: const InputDecoration(
                          labelText: 'Rerata per bulan',
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
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Umum',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'umum',
                        enabled: false,
                        controller: controller.umum,
                        decoration: const InputDecoration(
                          labelText: 'Umum',
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
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Selisih',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'selisih',
                        enabled: false,
                        controller: controller.selisih,
                        decoration: const InputDecoration(
                          labelText: 'Selisih',
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
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Bunga',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'bunga_keseluruhan',
                        enabled: false,
                        controller: controller.bungaKeseluruhan,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(FontAwesomeIcons.percent),
                          labelText: 'Bunga Keseluruhan',
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
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        '',
                        style: subtitle2,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      // child: FormBuilderTextField(
                      //   name: 'bunga_final',
                      //   enabled: false,
                      //   controller: controller.bungaFinal,
                      //   decoration: const InputDecoration(
                      //     suffixIcon: Icon(FontAwesomeIcons.percent),
                      //     labelText: 'Bunga Final',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(10.0),
                      //       ),
                      //     ),
                      //   ),
                      //   keyboardType: TextInputType.number,
                      // ),
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
