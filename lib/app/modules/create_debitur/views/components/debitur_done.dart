import 'package:akm/app/routes/app_pages.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Success'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Debitur Berhasil Diinput',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            GifView.asset(
              'assets/images/success_screen/checked.gif',
              frameRate: 30,
              fit: BoxFit.cover,
              loop: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: const Text(
                'Pilih salah satu button dibawah ini untuk melanjutkan, proses penginputan !',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: colorButton(
                      context,
                      'Penghasilan Tetap',
                      () => Get.toNamed(Routes.PENGHASILAN_TETAP),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: colorButton(
                      context,
                      'Penghasilan Tidak Tetap',
                      () => Get.toNamed(Routes.PENGHASILAN_XTETAP),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
