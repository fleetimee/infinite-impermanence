// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';
import '../controllers/agunan_analisis_controller.dart';

class AgunanAnalisisView extends GetView<AgunanAnalisisController> {
  AgunanAnalisisView({Key? key}) : super(key: key);

  final insightDebiturController = Get.put(InsightDebiturController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisa Agunan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Animate(
                      child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        'assets/images/home/bannerr.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        height: 200,
                      )
                          .animate()
                          .fadeIn() // uses `Animate.defaultDuration`
                          .scale() // inherits duration from fadeIn
                          .move(delay: 300.ms, duration: 600.ms),
                    ),
                  ) // runs after the above w/new duration
                      // inherits the delay & duration from move,
                      ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Harap dibaca terlebih dahulu 💀',
                    style: Theme.of(context).textTheme.titleLarge?.merge(
                          const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 450,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: const [
                          GFListTile(
                            avatar: Text('1. '),
                            titleText:
                                'Sebelum melakukan analisa agunan, harap pastikan bahwa data agunan yang ada sudah benar dan lengkap.',
                            icon: Icon(Icons.info_outline),
                          ),
                          GFListTile(
                            avatar: Text('2. '),
                            titleText:
                                'Jika data agunan belum lengkap, harap segera menghubungi pihak terkait untuk memperbaiki data agunan.',
                            icon: Icon(Icons.info_outline),
                          ),
                          GFListTile(
                            avatar: Text('3. '),
                            titleText:
                                'Jika data agunan sudah lengkap, harap segera melakukan analisa agunan.',
                            icon: Icon(Icons.info_outline),
                          ),
                          GFListTile(
                            avatar: Text('4. '),
                            titleText:
                                'Jika ada data agunan yang salah atau ada yang mau ditambahkan, kalau sudah analisa agunan sebelumnnya silahkan hapus terlebih dahulu kemudian hitung ulang kembali untuk mendapatkan hasil yang terupdate',
                            icon: Icon(Icons.info_outline),
                          ),
                          GFListTile(
                            avatar: Text('5. '),
                            titleText:
                                'Jika ada data agunan tapi nilai agunan nya 0 saat menghitung, silahkan kembali ke panel debitur dan ulangi langkah perhitungan',
                            icon: Icon(Icons.info_outline),
                          ),
                          GFListTile(
                            avatar: Text('6. '),
                            titleText:
                                'Untuk menghitung analisa agunan dibutuhkan sekitar 7 detik, harap bersabar menunggu hingga proses selesai',
                            icon: Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FormBuilderCheckbox(
                    name: 'agree',
                    title: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'I have read and agree to the ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    validator: FormBuilderValidators.equal(
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                ],
              ),
              GFButton(
                onPressed: () {
                  if (controller.formKey.currentState?.saveAndValidate() ??
                      false) {
                    Get.toNamed(Routes.AGUNAN_ANALISIS_CALC, arguments: [
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 1))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 1))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 2))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 2))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 3))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 3))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 4))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 4))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 5))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 5))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 6))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 6))
                      else
                        Agunan(),
                      if (insightDebiturController.listAgunan
                          .any((element) => element.kodeAgunan == 7))
                        insightDebiturController.listAgunan.elementAt(
                            insightDebiturController.listAgunan.indexWhere(
                                (element) => element.kodeAgunan == 7))
                      else
                        Agunan(),
                      data
                    ]);
                  } else {
                    debugPrint('validation failed');
                  }
                },
                text: 'Mulai Hitung',
                color: primaryColor,
                size: GFSize.LARGE,
                fullWidthButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
