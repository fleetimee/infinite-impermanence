// 🐦 Flutter imports:
import 'package:akm/app/modules/home/widget/components/home_profile/user_input_components/user_input_reuseable_textfield.dart';
import 'package:akm/app/modules/home_reviewer/controllers/home_reviewer_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';

class UserInputReviewer extends StatelessWidget {
  final HomeReviewerController controller;
  final FirebaseAuth auth;

  const UserInputReviewer({
    super.key,
    required this.controller,
    required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                controller: TextEditingController(
                    text: auth.currentUser?.uid ?? 'Unregistered'),
                readOnly: true,
                prefixIcon: Icons.numbers_outlined,
              ),
              const SizedBox(height: 10),
              TextInputProfile(
                name: 'displayNameProfile',
                controller: TextEditingController(
                  text: auth.currentUser?.displayName ?? 'Unregistered',
                ),
                readOnly: true,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 10),
              TextInputProfile(
                name: 'emailProfile',
                controller: TextEditingController(
                  text: auth.currentUser?.email ?? 'Unregistered',
                ),
                readOnly: true,
                prefixIcon: Icons.email_outlined,
              ),
            ],
          ),
          // Link a google account
          const SizedBox(height: 10),
        ],
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
