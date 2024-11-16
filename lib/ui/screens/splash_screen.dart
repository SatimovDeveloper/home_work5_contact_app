import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child:  Image.asset("assets/images/splash_logo.png", fit: BoxFit.fitWidth,),
      ),
    );
  }
}
