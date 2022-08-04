import 'package:akm/app/common/style.dart';
import 'package:akm/app/common/waves.dart';
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Greeting extends StatelessWidget {
  Greeting({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 80,
          child: WaveWidget(
            config: CustomConfig(
              colors: WavesSettings.waveColors,
              heightPercentages: WavesSettings.waveHeightPercentages,
              durations: WavesSettings.waveDurations,
            ),
            waveAmplitude: 10,
            size: const Size(double.infinity, double.infinity),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: secondaryColor,
                radius: 25,
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Good ${controller.greeting()} !',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  const Text(
                    'Aulia Octavia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: -45,
          top: -40,
          child: Obx(() => Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: controller.isDarkModeEnabled.value
                        ? const Color.fromARGB(255, 48, 48, 48)
                        : secondaryColor,
                    width: 18,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
