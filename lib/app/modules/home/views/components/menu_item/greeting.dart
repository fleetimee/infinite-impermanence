// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// 🌎 Project imports:
import '../../../../../common/style.dart';
import '../../../../../common/waves.dart';
import '../../../controllers/home_controller.dart';

class Greeting extends StatelessWidget {
  Greeting({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  final account = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[900]?.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
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
              Obx(() => CircleAvatar(
                    radius: 30,
                    child: CachedNetworkImage(
                      imageUrl: controller.profileImage.value == ''
                          ? 'https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
                          : '${controller.profileImage}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Selamat ${controller.greeting()}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Text(
                    account,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                  // Date text now
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 65,
          right: 10,
          child: Text(
            controller.dateNow(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
