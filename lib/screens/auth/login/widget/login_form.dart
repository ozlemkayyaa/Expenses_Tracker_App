import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/auth_bloc/auth_bloc.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final User _user = User();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(ESizes.spaceBtwSections),
        child: Column(
          children: [
            // E-Mail
            TextFormField(
              onSaved: (value) {
                _user.email = value!;
              },
              validator: EValidator.validateEmail,
              controller: emailController,
              decoration: const InputDecoration(labelText: ETexts.email),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            // Password
            TextFormField(
              obscureText: _obscureText,
              validator: EValidator.validatePassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: ETexts.password,
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Giriş butonu tıklandığında AuthBloc'a giriş olayını ilet
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(LoggedIn(
                              emailController.text,
                              passwordController.text,
                            ));
                      }
                    },
                    child: const Text(ETexts.loginButton),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
