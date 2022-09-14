// 🐦 Flutter imports:
// ignore_for_file: unused_field

// 🐦 Flutter imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/analisa_ratio.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/angsuran.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/asumsi_keuangan.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/data_keuangan.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/hasil.dart';
import 'package:akm/app/modules/keuangan_analisis/views/components/tutorial.dart';
import '../controllers/keuangan_analisis_controller.dart';

class KeuanganAnalisisView extends GetView<KeuanganAnalisisController> {
  KeuanganAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analisis Keuangan'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Tutorial();
                  },
                );
              },
              icon: const Icon(
                Icons.help_outline,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
                  isScrollable: true,

                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: 'Data Keuangan'),
                    Tab(text: 'Angsuran'),
                    Tab(text: 'Asumsi Keuangan'),
                    Tab(text: 'Analisa Ratio'),
                    Tab(text: 'Summary'),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: FormBuilder(
                  key: controller.formKeyAnalisaKeuangan,
                  onChanged: () {
                    debugPrint(controller
                        .formKeyAnalisaKeuangan.currentState!.value
                        .toString());
                  },
                  autovalidateMode: AutovalidateMode.always,
                  autoFocusOnValidationFailure: true,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      DataKeuangan(),
                      Angsuran(),
                      AsumsiKeuangan(),
                      AnalisaRatio(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FormBuilderTextField(
                            name: 'pinjaman_maksimal',
                            textAlign: TextAlign.center,
                            controller: controller.pinjamanMaksimal,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Pinjaman Maksimal',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'perhitungan_investasi',
                            textAlign: TextAlign.center,
                            controller: controller.perhitunganModalKerja,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            enabled: false,
                            decoration: const InputDecoration(
                                labelText: 'Perhitungan Investasi',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
                          ),
                          FormBuilderTextField(
                            name: 'trade_cycle',
                            textAlign: TextAlign.center,
                            controller: controller.tradeCycle =
                                TextEditingController(
                                    text: data.inputKeuangan.tradeCycle
                                        .toString()),
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            enabled: false,
                            decoration: const InputDecoration(
                                labelText: 'Trade Cycle',
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(FontAwesomeIcons.arrowsRotate)),
                          ),
                          FormBuilderTextField(
                            name: 'kebutuhan_investasi',
                            textAlign: TextAlign.center,
                            controller: controller.kebutuhanInvestasi,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            enabled: false,
                            decoration: const InputDecoration(
                                labelText: 'Kebutuhan Investasi',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
                          ),
                          FormBuilderTextField(
                            name: 'kebutuhan_kredit',
                            textAlign: TextAlign.center,
                            controller: controller.kebutuhanKredit,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            enabled: false,
                            decoration: const InputDecoration(
                                labelText: 'Kebutuhan Kredit',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.rupiahSign)),
                          ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.calculate),
                            label: const Text(
                              "Hitung Semua",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                                foregroundColor: secondaryColor,
                                backgroundColor: primaryColor,
                                shape: const StadiumBorder(),
                                maximumSize:
                                    const Size.fromWidth(double.infinity),
                                fixedSize: const Size(500, 50)),
                            onPressed: () {
                              controller.hitungSemua();

                              showToast(
                                '👀 Berhasil dihitung semua',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor,
                                ),
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: const Duration(seconds: 1),
                                duration: const Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),

                          Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: FormBuilderTextField(
                                  controller: controller.kreditYangDiminta =
                                      MoneyMaskedTextController(
                                    decimalSeparator: '',
                                    thousandSeparator: '.',
                                    precision: 0,
                                    initialValue: double.parse(
                                        data.inputKeuangan.kreditDiusulkan),
                                  ),
                                  enabled: false,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: primaryColor,
                                  ),
                                  name: 'kredit_yang_diminta',
                                  decoration: InputDecoration(
                                    labelText: 'Plafon',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon:
                                        const Icon(FontAwesomeIcons.rupiahSign),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () {
                                    return controller
                                            .isVerificationButtonPressed.value
                                        ? controller.isKreditPassed.isTrue
                                            ? const Icon(
                                                Icons.check_box,
                                                color: Colors.green,
                                                size: 35,
                                              )
                                            : const Icon(
                                                Icons.close_outlined,
                                                color: Colors.red,
                                                size: 35,
                                              )
                                        : const SizedBox();
                                  },
                                ),
                              ),
                            ],
                          ),
                          // FormBuilderSwitch(
                          //   title: const Text('Kredit'),
                          //   name: 'is_kredit_passed',
                          //   onSaved: (value) {
                          //     controller.isKreditPassed.value = value!;
                          //   },
                          //   onChanged: (value) {
                          //     controller.isKreditPassed.value = value!;
                          //   },
                          // ),

                          // Obx(
                          //   () => FormBuilderSwitch(
                          //     name: 'kredit_approved',
                          //     enabled: controller.isKreditPassed.value
                          //         ? true
                          //         : false,
                          //     inactiveThumbColor: secondaryColor,
                          //     decoration: InputDecoration(
                          //       labelText: 'Kredit di setujui',
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       prefixIcon:
                          //           controller.isVerificationButtonPressed.value
                          //               ? controller.isKreditPassed.isTrue
                          //                   ? const Icon(
                          //                       Icons.check_box,
                          //                       color: Colors.green,
                          //                       size: 35,
                          //                     )
                          //                   : const Icon(
                          //                       Icons.close_outlined,
                          //                       color: Colors.red,
                          //                       size: 35,
                          //                     )
                          //               : const SizedBox(),
                          //     ),
                          //     onChanged: (value) {
                          //       controller.isKreditPassed.value = value!;
                          //     },
                          //     onSaved: (value) {
                          //       controller.isKreditPassed.value = value!;
                          //     },
                          //     title: Text(controller.isKreditPassed.isTrue
                          //         ? 'Kredit di setujui'
                          //         : 'Kredit di tolak'),
                          //   ),
                          // ),
                          OutlinedButton.icon(
                            icon: const Icon(Icons.verified),
                            label: const Text(
                              "Verifikasi Kredit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                                foregroundColor: secondaryColor,
                                backgroundColor: primaryColor,
                                shape: const StadiumBorder(),
                                maximumSize:
                                    const Size.fromWidth(double.infinity),
                                fixedSize: const Size(500, 50)),
                            onPressed: () {
                              controller.checkIfCreditPassed();

                              showToast(
                                'Status: ${controller.isKreditPassed.isTrue ? 'Lulus' : 'Gagal'}',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor,
                                ),
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: const Duration(seconds: 1),
                                duration: const Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          LoadingAnimatedButton(
                            child: Text(
                              'Lihat Hasil',
                              style: GoogleFonts.andika(fontSize: 25),
                            ),
                            onTap: () {
                              showBarModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  controller.hitungCrr();
                                  return HasilAnalisa();
                                },
                                backgroundColor: secondaryColor,
                                bounce: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
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

class LoadingAnimatedButton extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final Function() onTap;
  final double width;
  final double height;

  final Color color;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const LoadingAnimatedButton(
      {Key? key,
      required this.child,
      required this.onTap,
      this.width = 300,
      this.height = 75,
      this.color = primaryColor,
      this.borderColor = secondaryColor,
      this.borderRadius = 15.0,
      this.borderWidth = 3.0,
      this.duration = const Duration(milliseconds: 1500)})
      : super(key: key);

  @override
  State<LoadingAnimatedButton> createState() => _LoadingAnimatedButtonState();
}

class _LoadingAnimatedButtonState extends State<LoadingAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(
        widget.borderRadius,
      ),
      splashColor: widget.color,
      child: CustomPaint(
        painter: LoadingPainter(
            animation: _animationController,
            borderColor: widget.borderColor,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
            color: widget.color),
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(5.5),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Animation animation;
  final Color color;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  LoadingPainter(
      {required this.animation,
      this.color = Colors.orange,
      this.borderColor = Colors.white,
      this.borderRadius = 15.0,
      this.borderWidth = 3.0})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = SweepGradient(
              colors: [
                color.withOpacity(.25),
                color,
              ],
              startAngle: 0.0,
              endAngle: vector.radians(180),
              stops: const [.75, 1.0],
              transform:
                  GradientRotation(vector.radians(360.0 * animation.value)))
          .createShader(rect);

    final path = Path.combine(
        PathOperation.xor,
        Path()
          ..addRRect(
              RRect.fromRectAndRadius(rect, Radius.circular(borderRadius))),
        Path()
          ..addRRect(RRect.fromRectAndRadius(
              rect.deflate(3.5), Radius.circular(borderRadius))));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            rect.deflate(1.5), Radius.circular(borderRadius)),
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomCarouselFB2 extends StatefulWidget {
  const CustomCarouselFB2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCarouselFB2State createState() => _CustomCarouselFB2State();
}

class _CustomCarouselFB2State extends State<CustomCarouselFB2> {
  // - - - - - - - - - - - - Instructions - - - - - - - - - - - - - -
  // 1.Replace cards list with whatever widgets you'd like.
  // 2.Change the widgetMargin attribute, to ensure good spacing on all screensize.
  // 3.If you have a problem with this widget, please contact us at flutterbricks90@gmail.com
  // Learn to build this widget at https://www.youtube.com/watch?v=dSMw1Nb0QVg!
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  List<Widget> cards = [
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
        subtitle: "+30 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Designer_re_5v95%201.png?alt=media&token=5d053bd8-d0ea-4635-abb6-52d87539b7ec",
        subtitle: "+30 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Accept_terms_re_lj38%201.png?alt=media&token=476b97fd-ba66-4f62-94a7-bce4be794f36",
        subtitle: "+30 books",
        onPressed: () {})
  ];

  final double carouselItemMargin = 16;

  late PageController _pageController;
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: .7);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: cards.length,
        onPageChanged: (int position) {
          setState(() {
            _position = position;
          });
        },
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: Container(
        child: cards[position],
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb1(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250,
        height: 230,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 90, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
