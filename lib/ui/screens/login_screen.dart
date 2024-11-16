import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/config/colors.dart';
import 'package:home_work5_contact_app/config/strings.dart';
import 'package:home_work5_contact_app/ui/screens/register_screen.dart';
import 'package:home_work5_contact_app/ui/widgets/app_button.dart';
import 'package:home_work5_contact_app/ui/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

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
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: passwordController,
              hintText: AppText.hintPassword,
              iconData: Icons.cancel_rounded,
              isPassword: true,
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: () {}, contentText: AppText.loginButtonText),
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
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RegisterScreen()));
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
