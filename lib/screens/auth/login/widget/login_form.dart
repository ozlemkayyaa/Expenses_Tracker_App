import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(ESizes.spaceBtwSections),
        child: Column(
          children: [
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

            // Remember Me and Forgot Password?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(
                      ETexts.rememberMe,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    ETexts.forgotPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(height: ESizes.paddingXxl),

            // Login Button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const Text(ETexts.loginButton),
              ),
            )
          ],
        ),
      ),
    );
  }
}
