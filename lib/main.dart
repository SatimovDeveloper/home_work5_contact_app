
import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/repository/repository.dart';
import 'package:home_work5_contact_app/ui/screens/login_screen.dart';
import 'package:home_work5_contact_app/ui/screens/register_screen.dart';
import 'package:home_work5_contact_app/ui/screens/splash_screen.dart';

void main(){

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
    home: SplashScreen());
  }
}
