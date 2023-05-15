// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import '../controllers/intro_screen_controller.dart';

class IntroScreenView extends GetView<IntroScreenController> {
  IntroScreenView({Key? key}) : super(key: key);

  final loginCtrl = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: Obx(() => IntroductionScreen(
            isProgress: true,
            resizeToAvoidBottomInset: true,
            pages: [
              PageViewModel(
                title: 'Your adventure starts here',
                body:
                    "Untuk memulai silahkan lengkapi data diri anda terlebih dahulu",
                image: Lottie.asset(
                  'assets/images/home/hello.zip',
                  animate: true,
                  frameRate: FrameRate(60),
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  bodyTextStyle: TextStyle(fontSize: 19.0),
                  pageColor: Colors.white,
                  imagePadding: EdgeInsets.zero,
                ),
              ),
              PageViewModel(
                title: 'The easiest way to stay connected',
                footer: const Text(
                    'Hint: Gunakan email yang sama dengan yang diberikan oleh admin'),
                bodyWidget: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Email ini digunakan untuk mensinkronkan data anda dengan akun anda",
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      readOnly: controller.isEmailReadOnly.value,
                      name: 'email',
                      onEditingComplete: () {
                        controller.submitEmailFirebase();
                      },
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      controller: controller.email = TextEditingController(
                        text: auth.currentUser?.email ?? '',
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.check_circle_outline,
                            color: GFColors.SUCCESS,
                            size: 25,
                          ),
                          onPressed: () {
                            controller.submitEmailFirebase();
                          },
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        focusColor: Colors.red,
                        fillColor: Colors.grey.shade300,
                        hoverColor: Colors.red,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // add custom google font
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ],
                ),
                image: Lottie.asset(
                  'assets/images/home/email.zip',
                  animate: true,
                  frameRate: FrameRate(60),
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  bodyTextStyle: TextStyle(fontSize: 19.0),
                  pageColor: Colors.white,
                  imagePadding: EdgeInsets.zero,
                ),
              ),
              PageViewModel(
                title: 'Be yourself',
                bodyWidget: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Anda mau di kenal dengan nama apa ? Pastikan nama yang anda masukkan sesuai dengan nama asli anda",
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      readOnly: controller.isDisplayNameReadOnly.value,
                      name: 'displayName',
                      onEditingComplete: () {
                        // controller.submitEmailFirebase();
                        controller.submitDisplayNameFirebase();
                      },
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        // add custom google font
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      controller: controller.displayName =
                          TextEditingController(
                        text: auth.currentUser?.displayName ?? '',
                      ),
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(
                          Icons.alternate_email_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.check_circle_outline,
                            color: GFColors.SUCCESS,
                            size: 25,
                          ),
                          onPressed: () {
                            controller.submitDisplayNameFirebase();
                          },
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        focusColor: Colors.red,
                        fillColor: Colors.grey.shade300,
                        hoverColor: Colors.red,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // add custom google font
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ],
                ),
                image: Lottie.asset(
                  'assets/images/home/display-picture.zip',
                  animate: true,
                  frameRate: FrameRate(60),
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  bodyTextStyle: TextStyle(fontSize: 19.0),
                  pageColor: Colors.white,
                  imagePadding: EdgeInsets.zero,
                ),
              ),
              PageViewModel(
                title: 'Awesome 🎉',
                bodyWidget: const Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Now you are ready to go \n Tekan tombol 'done' untuk melanjutkan",
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                footer: const Text(
                  'Jangan lupa untuk menverifikasi email anda, link google account, dan setting password saat berada di dalam aplikasi',
                  textAlign: TextAlign.center,
                ),
                image: Lottie.asset(
                  'assets/images/home/checked.zip',
                  animate: true,
                  frameRate: FrameRate(60),
                ),
                decoration: const PageDecoration(
                  titleTextStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                  bodyTextStyle: TextStyle(fontSize: 19.0),
                  pageColor: Colors.white,
                  imagePadding: EdgeInsets.zero,
                ),
              ),
            ],
            showSkipButton: false,
            next: const Text("Next"),
            done: const Text("Done",
                style: TextStyle(fontWeight: FontWeight.w700)),
            onDone: () async {
              if (auth.currentUser?.displayName != null ||
                  auth.currentUser?.displayName != '' &&
                      auth.currentUser?.email != null ||
                  auth.currentUser?.email != '') {
                auth.signOut();

                final prefs = await SharedPreferences.getInstance();

                // remove all data from shared preferences
                prefs.clear();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.bottomSlide,
                  title: 'Error',
                  desc: 'Please fill all the form',
                  btnOkOnPress: () {},
                ).show();
              }
            },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Theme.of(context).colorScheme.secondary,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          )),
    );
  }
}
