import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home_pengutus/controllers/home_pengutus_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarPengutus extends StatelessWidget {
  const AvatarPengutus({
    super.key,
    required this.controller,
    required this.homeCtrl,
  });

  final HomePengutusController controller;
  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor: Colors.white,
      endRadius: 120,
      duration: const Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: const Duration(milliseconds: 100),
      child: Material(
        shape: const CircleBorder(),
        child: CircleAvatar(
          radius: 90,
          child: CachedNetworkImage(
            imageUrl: homeCtrl.profileImage.value.toString(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
