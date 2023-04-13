// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home_reviewer/controllers/home_reviewer_controller.dart';
import 'package:akm/app/modules/home_reviewer/widget/components/home_reviewer_profile/reviewer_profile_avatar.dart';
import 'package:akm/app/modules/home_reviewer/widget/components/home_reviewer_profile/reviewer_profile_textfield.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class ReviewerProfile extends StatelessWidget {
  const ReviewerProfile({
    Key? key,
    required this.auth,
    required this.controller,
    required this.homeCtrl,
  }) : super(key: key);

  final FirebaseAuth auth;
  final HomeReviewerController controller;
  final HomeController homeCtrl;

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
                      child: AvatarReviewer(
                        controller: controller,
                        homeCtrl: homeCtrl,
                      ),
                    ),
                  ),
                  UserInputReviewer(
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
