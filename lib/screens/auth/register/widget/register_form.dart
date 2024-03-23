import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(ESizes.spaceBtwSections),
        child: Column(
          children: [
            // Full Name
            TextFormField(
              decoration: const InputDecoration(labelText: ETexts.fullName),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            // E-Mail
            TextFormField(
              decoration: const InputDecoration(labelText: ETexts.email),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: const InputDecoration(labelText: ETexts.password),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            // Confirm Password
            TextFormField(
              decoration:
                  const InputDecoration(labelText: ETexts.confirmPassword),
            ),
            const SizedBox(height: ESizes.paddingXxl),

            // Register Button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const Text(ETexts.registerButton),
              ),
            )
          ],
        ),
      ),
    );
  }
}
