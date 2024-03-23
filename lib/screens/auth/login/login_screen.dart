import 'package:expenses_tracker/screens/auth/widget/form_divider.dart';
import 'package:expenses_tracker/screens/auth/register/register_screen.dart';
import 'package:expenses_tracker/screens/auth/login/widget/login_form.dart';
import 'package:expenses_tracker/screens/auth/widget/form_header.dart';
import 'package:expenses_tracker/screens/auth/widget/form_text.dart';
import 'package:expenses_tracker/screens/auth/widget/social_button.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Header
            const SizedBox(height: ESizes.spaceBtwInputFields),
            const FormHeader(
              paddingValue: 100.0,
              header: ETexts.loginHeader,
              headerMessage: ETexts.loginMessage,
            ),

            // Login Form
            const LoginForm(),

            // Divider
            const SizedBox(height: ESizes.loadingIndicatorSize),
            const FormDivider(dividerText: ETexts.orSignIn),

            // Social Media Buttons
            const SizedBox(height: ESizes.containerSize),
            const SocialButtons(),

            // FormText
            const SizedBox(height: ESizes.containerSize),
            FormText(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                message: ETexts.dontAccount,
                buttonName: ETexts.register),
          ],
        ),
      ),
    );
  }
}
