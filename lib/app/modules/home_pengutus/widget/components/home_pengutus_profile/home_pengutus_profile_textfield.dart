import 'package:akm/app/modules/home/widget/components/home_profile/user_input_components/user_input_reuseable_textfield.dart';
import 'package:akm/app/modules/home_pengutus/controllers/home_pengutus_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInputPengutus extends StatelessWidget {
  final HomePengutusController controller;
  final FirebaseAuth auth;

  const UserInputPengutus({
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
              TextInputProfilePink(
                name: 'uid',
                controller: TextEditingController(
                    text: auth.currentUser?.uid ?? 'Unregistered'),
                readOnly: true,
                prefixIcon: Icons.numbers_outlined,
              ),
              const SizedBox(height: 10),
              TextInputProfilePink(
                name: 'displayNameProfile',
                controller: TextEditingController(
                  text: auth.currentUser?.displayName ?? 'Unregistered',
                ),
                readOnly: true,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 10),
              TextInputProfilePink(
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
