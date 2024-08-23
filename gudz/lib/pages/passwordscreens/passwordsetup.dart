import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/auth/after_acc_create_page.dart';
import 'package:gudz/utils/constraint.dart';

import 'package:gudz/validators/validator.dart';

class PasswordSetupPage extends StatefulWidget {
  final bool isResetPassword;

  PasswordSetupPage({this.isResetPassword = false});

  @override
  _PasswordSetupPageState createState() => _PasswordSetupPageState();
}

class _PasswordSetupPageState extends State<PasswordSetupPage> {
  bool _obscurePassword = true;
  bool _obscureVerifyPassword = true;
  String _password = '';
  String _verifyPassword = '';

  @override
  Widget build(BuildContext context) {
    final isResetPassword = widget.isResetPassword;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: FormValidators.passwordSetupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'gudz',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontFamily: 'League Spartan',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        Text(
                          isResetPassword ? 'CHANGE PASSWORD' : 'CHOOSE A PASSWORD',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          isResetPassword
                              ? 'Enter a new password for your gudz account:'
                              : 'Enter a Password for your gudz account:\n- At least 1 upper case letter (A-Z)\n- At least 1 number (0-9)\n- At least 8 characters',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: FormValidators.validatePassword,
                          onSaved: (value) => _password = value!,
                          onChanged: (value) => _password = value,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          obscureText: _obscureVerifyPassword,
                          decoration: InputDecoration(
                            hintText: 'Verify Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureVerifyPassword ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureVerifyPassword = !_obscureVerifyPassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) => FormValidators.validatePasswordMatch(value, _password),
                          onSaved: (value) => _verifyPassword = value!,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        child: Text(
                          isResetPassword ? 'Change Password' : 'Set Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          if (FormValidators.passwordSetupFormKey.currentState!.validate()) {
                            FormValidators.passwordSetupFormKey.currentState!.save();
                            // Perform password setup or change logic here
                            if (isResetPassword) {
                              // Navigate to the reset password confirmation page or home page
                              Get.to(() => AccountCreatedPage()); // Replace with the appropriate page
                            } else {
                              // Navigate to the account created page
                              Get.to(() => AccountCreatedPage());
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
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