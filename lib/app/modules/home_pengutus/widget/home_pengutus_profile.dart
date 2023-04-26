import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:akm/app/modules/home_pengutus/controllers/home_pengutus_controller.dart';
import 'package:akm/app/modules/home_pengutus/widget/components/home_pengutus_profile/home_pengutus_profile_textfield.dart';
import 'package:akm/app/modules/home_pengutus/widget/components/home_pengutus_profile/home_pengutus_provile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PengutusProfile extends StatelessWidget {
  const PengutusProfile({
    Key? key,
    required this.auth,
    required this.controller,
    required this.homeCtrl,
  }) : super(key: key);

  final FirebaseAuth auth;
  final HomePengutusController controller;
  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Colors.pinkAccent,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/home/main_page/profile.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: AvatarPengutus(
                        controller: controller,
                        homeCtrl: homeCtrl,
                      ),
                    ),
                  ),
                  UserInputPengutus(
                    controller: controller,
                    auth: auth,
                  ),
                ],
              ),
              // LinkWithGoogle(
              //   controller: controller,
              //   auth: auth,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
