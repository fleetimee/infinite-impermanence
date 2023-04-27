// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/widget/components/home_profile/avatar.dart';
import 'package:akm/app/modules/home/widget/components/home_profile/useer_progression.dart';
import 'package:akm/app/modules/home/widget/components/home_profile/user_input.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class FormFirebase extends StatelessWidget {
  const FormFirebase({
    Key? key,
    required this.auth,
    required this.controller,
  }) : super(key: key);

  final FirebaseAuth auth;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: blue400,
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
                      child: Avatar(
                        controller: controller,
                      ),
                    ),
                  ),
                  UserInput(
                    controller: controller,
                    auth: auth,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: UserStatAndProgression(
                          controller: controller,
                        ),
                      ),
                    ),
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
