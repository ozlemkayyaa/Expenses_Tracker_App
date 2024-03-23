import 'package:expenses_tracker/screens/auth/login/login_screen.dart';
import 'package:expenses_tracker/screens/auth/register/widget/register_form.dart';
import 'package:expenses_tracker/screens/auth/widget/form_divider.dart';
import 'package:expenses_tracker/screens/auth/widget/form_header.dart';
import 'package:expenses_tracker/screens/auth/widget/form_text.dart';
import 'package:expenses_tracker/screens/auth/widget/social_button.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Register Header
            const FormHeader(
                paddingValue: 20.0,
                header: ETexts.registerHeader,
                headerMessage: ETexts.registerMessage),

            // Register Form
            const RegisterForm(),

            // Divider
            const SizedBox(height: ESizes.spaceBtwInputFields),
            const FormDivider(dividerText: ETexts.orSignUp),

            // Social Media Buttons
            const SizedBox(height: ESizes.containerSize),
            const SocialButtons(),

            // FormText
            const SizedBox(height: ESizes.paddingXxl),
            FormText(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                message: ETexts.alreadyAccount,
                buttonName: ETexts.login),
          ],
        ),
      ),
    );
  }
}
