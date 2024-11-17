import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/data/shared_pref.dart';
import 'package:home_work5_contact_app/ui/screens/home_screen.dart';
import 'package:home_work5_contact_app/ui/screens/login_screen.dart';

import '../../config/colors.dart';
import '../../config/strings.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final MyPref _myPref;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPassController = TextEditingController();
  String? errorUserName ;
  String? errorPassword ;
  String? errorConPassword ;

  @override
  void initState() {
    super.initState();
    initMyPref();
  }

  Future<void> initMyPref() async {
    _myPref = MyPref();
    await _myPref.initMyPref();
  }

  void saveData(){
    setState(() {
      if(userController.text.isEmpty){
        errorUserName = "The field must be filled in";
      }
      if(passwordController.text.isEmpty){
        errorPassword = "The field must be filled in";
      }
      if(conPassController.text.isEmpty){
        errorConPassword = "The field must be filled in";
      }
      if(!passwordController.text.contains(conPassController.text)){
        errorConPassword = "The passwords entered are not suitable";
      }
      if(passwordController.text.contains(conPassController.text)
          && userController.text.isNotEmpty && passwordController.text.isNotEmpty){
        _myPref.saveLoginPassword(userController.text, passwordController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else{
        errorUserName = "Unknown error";
      }
    });
    if(passwordController.text.contains(conPassController.text)
    && userController.text.isNotEmpty && passwordController.text.isNotEmpty){
      _myPref.saveLoginPassword(userController.text, passwordController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
      ),
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
              "assets/images/register_logo.png",
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
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: conPassController,
              hintText: AppText.hintConfirmPassword,
              iconData: Icons.cancel_rounded,
              isPassword: true,
              errorText: errorConPassword,
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(
                onPressed: saveData, contentText: AppText.registerButtonText),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppText.registerText1,
                  style: TextStyle(
                      color: AppColor.borderColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    AppText.registerText2,
                    style: TextStyle(
                        color: AppColor.borderColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
