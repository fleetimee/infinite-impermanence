// 🐦 Flutter imports:
import 'package:akm/app/modules/login-page/widget/components/login_page_login_form/attribution.dart';
import 'package:akm/app/modules/login-page/widget/components/login_page_login_form/google_sign_in.dart';
import 'package:akm/app/modules/login-page/widget/components/login_page_login_form/login_button.dart';
import 'package:akm/app/modules/login-page/widget/components/login_page_login_form/register_button.dart';
import 'package:akm/app/modules/login-page/widget/components/login_page_login_form/reuseable_form.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/login_page_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/splash_screen/splash_icon.png',
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            FormBuilder(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    FleetimeLoginTextField(
                      name: 'email',
                      controller: controller.email,
                      icon: Icons.email_outlined,
                      hintText: 'Masukkan Email Anda',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(
                      () => FleetimeLoginTextField(
                        name: 'password',
                        controller: controller.password,
                        icon: Icons.lock_outline,
                        hintText: 'Masukkan Password Anda',
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ],
                        ),
                        obscureText: controller.isPasswordVisible.value == true
                            ? false
                            : true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            size: 25,
                            controller.isPasswordVisible.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.isPasswordVisible.value
                              ? controller.isPasswordVisible.toggle
                              : controller.isPasswordVisible.toggle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const RegisterButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LoginButton(controller: controller),
                const SizedBox(
                  height: 15,
                ),
                const Attribution(),
                NotPlannedGoogleSignIn(controller: controller),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
