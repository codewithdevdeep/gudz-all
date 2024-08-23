import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gudz/pages/auth/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Set up timer
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFF5267DC),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'gudz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/images/bus.png",
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}