import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/passwordscreens/passwordsetup.dart';

class Verifyotp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: Text(
                        'gudz',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5267DC),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter the OTP sent to your linked Email or Phone number.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'OTP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: Text('Verify OTP',style: TextStyle(color: Colors.white,fontSize: 18),),
                    onPressed: () {
                     Get.to(PasswordSetupPage(isResetPassword: false));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5267DC),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(double.infinity, 50), 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))// full width button
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    child: Text('Back',style: TextStyle(color: Colors.grey[800]),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 24), // Add some bottom padding
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}