// 🐦 Flutter imports:
import 'package:akm/app/modules/home/widget/components/home_profile/user_input_components/user_input_reuseable_textfield.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class UserInput extends StatelessWidget {
  final HomeController controller;
  final FirebaseAuth auth;

  const UserInput({super.key, required this.controller, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputProfile(
                  name: 'uid',
                  controller: controller.email = TextEditingController(
                      text: auth.currentUser?.uid ?? 'Unregistered'),
                  readOnly: true,
                  prefixIcon: Icons.numbers_outlined,
                ),
                const SizedBox(height: 10),
                TextInputProfile(
                  name: 'displayNameProfile',
                  controller: controller.displayName = TextEditingController(
                    text: auth.currentUser?.displayName ?? 'Unregistered',
                  ),
                  readOnly: controller.isDisplayNameReadOnly.value,
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 10),
                TextInputProfile(
                  name: 'emailProfile',
                  controller: controller.email = TextEditingController(
                    text: auth.currentUser?.email ?? 'Unregistered',
                  ),
                  readOnly: controller.isEmailReadOnly.value,
                  prefixIcon: Icons.email_outlined,
                ),
              ],
            ),
            // Link a google account
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class TextProfile extends StatelessWidget {
  final String text;
  const TextProfile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
