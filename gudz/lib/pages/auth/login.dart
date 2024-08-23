import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/home/homepage.dart';
import 'package:gudz/pages/passwordscreens/forgetpass.dart';
import 'package:gudz/pages/auth/sign_up.dart';
import 'package:gudz/validators/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _phoneNumber = '';
  String _password = '';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: FormValidators.loginFormKey,
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
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'League Spartan',
                            color: theme.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 48),
                        Text(
                          'LOGIN',
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Log in to your gudz account with your phone number and password.',
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: FormValidators.validatePhoneNumber,
                          onSaved: (value) => _phoneNumber = value!,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
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
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => ResetPasswordPage());
                            },
                            child: Text('Forgot Password?'),
                          ),
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
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          if (FormValidators.loginFormKey.currentState!.validate()) {
                            FormValidators.loginFormKey.currentState!.save();
                            Get.to(()=>HomePage());
                            
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        child: Text('Create an Account'),
                        onPressed: () {
                          Get.to(() => SignupPage());
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