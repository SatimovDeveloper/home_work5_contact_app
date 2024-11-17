import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/config/strings.dart';
import 'package:home_work5_contact_app/data/shared_pref.dart';
import 'package:home_work5_contact_app/ui/screens/home_screen.dart';
import 'package:home_work5_contact_app/ui/screens/register_screen.dart';
import 'package:home_work5_contact_app/ui/widgets/app_button.dart';
import 'package:home_work5_contact_app/ui/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final MyPref _myPref;
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorUserName;
  String? errorPassword;


  @override
  initState() {
    initMyPref();
    super.initState();
  }

  Future<void> initMyPref() async {
    _myPref = MyPref();
    await _myPref.initMyPref();
  }

  void onClickLogin() {
    setState(() {
      if (userController.text.isEmpty) {
        errorUserName = "The field must be filled in";
      }
      if (passwordController.text.isEmpty) {
        errorPassword = "The field must be filled in";
      }
      if (!_myPref.getLogin().contains(userController.text)) {
        errorUserName = "incorrect Username";
      }
      if (!_myPref.getPassword().contains(passwordController.text)) {
        errorPassword = "incorrect Password";
      }
      if (_myPref.getLogin()==(userController.text) &&
          _myPref.getPassword()==(passwordController.text)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: AppColor.backgroundColor,),
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/login_logo.png",
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 64,
            ),
            TextFieldApp(
              controller: userController,
              hintText: AppText.hintUserName,
              iconData: Icons.cancel_rounded,
              errorText: errorUserName,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: passwordController,
              hintText: AppText.hintPassword,
              iconData: Icons.cancel_rounded,
              isPassword: true,
              errorText: errorPassword,
            ),

            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: onClickLogin, contentText: AppText.loginButtonText),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppText.loginText1,
                  style: TextStyle(
                      color: AppColor.borderColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 12,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  },
                  child: Text(
                    AppText.loginText2,
                    style: TextStyle(
                        color: AppColor.borderColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),

              ],
            ),
            SizedBox(height: 200,)
          ],
        ),
      ),
    );
  }
}
