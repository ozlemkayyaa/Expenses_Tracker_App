import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/bloc/auth_bloc/auth_bloc.dart';
import 'package:expenses_tracker/utils/constants/sizes.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:expenses_tracker/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(ESizes.spaceBtwSections),
        child: Column(
          children: [
            // Full Name
            TextFormField(
              onSaved: (value) {
                _user.fullName = value!;
              },
              validator: EValidator.validateName,
              controller: fullNameController,
              decoration: const InputDecoration(labelText: ETexts.fullName),
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

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

            // Confirm Password
            TextFormField(
              obscureText: _obscureText,
              validator: EValidator.validatePassword,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: ETexts.confirmPassword,
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
            const SizedBox(height: ESizes.paddingXxl),

            // Register Button
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(Registered(
                            emailController.text,
                            passwordController.text,
                            fullNameController.text));
                      }
                    },
                    child: const Text(ETexts.registerButton),
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
