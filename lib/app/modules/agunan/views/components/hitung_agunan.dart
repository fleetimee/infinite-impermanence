// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_tex_js/flutter_tex_js.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan/controllers/agunan_controller.dart';

// ignore: must_be_immutable
class HitungCrrAgunan extends StatelessWidget {
  HitungCrrAgunan({Key? key}) : super(key: key);

  final controller = Get.put(AgunanController());

  String mdContent = """

# Safety Margin

Adalah potongan nilai barang agunan (%) untuk memberikan koreksi nilai terhadap kemungkinan penurunan nilai (barang bergerak) saat akan dieksekusi atau biaya penjualan dan lamanya waktu menjual.

ㅤ

# Liquidation

Nilai likuidasi agunan = Nilai beli x safety margin (%)

ㅤ

# Parameter Agunan
bila tidak mempunyai/tanpa agunan, maka nilainya adallah sama dengan parameter, dimana dimaksudkan adalah nilai agunan immeterial (kepercayaan bank terhadap debitur) sebesar nilai parameter.
- Bila ratio agunan thd kredit dibawah 125%, maka nilai CRR = nol, namun bila = 125%, nilai CRR =65.
- Bila ratio agunan diatas 125% nilai CRR akan naik secara proportional dengan maximum nilai CRR = 95. 
- Nilai maksimum CRR = 95 akan terjadi bila ratio agunan thd kredit maximum 150%

ㅤ

Nilai ratio agunan dimaksud diatas adalah nilai agunan setelah dikurangi safety margin


""";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              controller: controller.tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: primaryColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Hasil',
                  height: 100,
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Ketentuan',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: <Widget>[
                // first tab bar view widget
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: FormBuilder(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/karakter/calculate.png',
                          ),
                          const TexImage(
                            r''' totalAgunan / (kredit / 100) = ratioAgunan ''',
                            fontSize: 20,
                            displayMode: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            enabled: false,
                            textAlign: TextAlign.center,
                            controller: controller.totalNilaiAgunan,
                            style: const TextStyle(fontSize: 30),
                            name: 'Total Agunan',
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Total Agunan',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            controller: controller.kredit,
                            name: 'Kredit yang diajukan',
                            style: const TextStyle(fontSize: 30),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Kredit yang diajukan',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const TexImage(
                            r''' Ratio Agunan / Kredit ''',
                            fontSize: 20,
                            displayMode: true,
                          ),
                          Text(
                            controller.resultRatio.toStringAsFixed(2),
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: // Make text green if value exceed 65 and red if below 65
                                  controller.resultRatio.value >= 65.0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TexImage(
                            r''' Crr ''',
                            fontSize: 20,
                            displayMode: true,
                          ),
                          Text(
                            controller.crr.toStringAsFixed(1),
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: // Make text green if value exceed 65 and red if below 65
                                  controller.crr.value >= 65.0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // second tab bar view widget
                Center(
                  child: Markdown(
                    data: mdContent,
                    padding: const EdgeInsets.all(32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
