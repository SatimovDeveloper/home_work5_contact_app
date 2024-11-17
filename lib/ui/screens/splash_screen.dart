import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/data/shared_pref.dart';
import 'package:home_work5_contact_app/ui/screens/register_screen.dart';

import '../../repository/repository.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late final MyPref pref;
  @override
  void initState() {


    super.initState();
    _checkUser();
  }

  void _checkUser() async{
    pref  = MyPref();
    await pref.initMyPref();
    await Future.delayed(const Duration(seconds: 3));
    var login = pref.getLogin();
    var password = pref.getPassword();


    if(login.contains("@") && password.contains("@")){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterScreen()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
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
