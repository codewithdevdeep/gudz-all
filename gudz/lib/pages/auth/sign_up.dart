import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/passwordscreens/passwordsetup.dart';
import 'package:gudz/validators/validator.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  String _emergencyContact = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: FormValidators.signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'gudz',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                            fontFamily: 'League Spartan'
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'ENTER PERSONAL DETAILS',
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(
                          'Add your personal details.',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Full Name',
                          ),
                          validator: FormValidators.validateFullName,
                          onSaved: (value) => _fullName = value!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: FormValidators.validatePhoneNumber,
                          onSaved: (value) => _phoneNumber = value!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email ID',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: FormValidators.validateEmail,
                          onSaved: (value) => _email = value!,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Emergency Contact',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: FormValidators.validatePhoneNumber,
                          onSaved: (value) => _emergencyContact = value!,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (FormValidators.signupFormKey.currentState!.validate()) {
                            FormValidators.signupFormKey.currentState!.save();
                            Get.to(() => PasswordSetupPage(isResetPassword: false));
                          }}
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        child: const Text('Have an account? Login'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}