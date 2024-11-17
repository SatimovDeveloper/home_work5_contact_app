import 'package:flutter/material.dart';
import 'package:home_work5_contact_app/repository/repository.dart';

import '../../config/colors.dart';
import '../../config/strings.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}\$');
  String? errorName;
  String? errorPhone;

  void onClickAdd() async{
    setState(() {
      if(nameController.text.isEmpty){
        errorName = "The field must be filled in";
      }
      if(phoneController.text.isEmpty){
        errorPhone = "The field must be filled in";
      }
      if(nameController.text.length<3){
        errorName = "Name is not a suitable length";
      }
      if(!phoneRegExp.hasMatch(phoneController.text)){
        errorPhone = "The phone number format is incorrect";
      }
      if(nameController.text.length>2){
        Navigator.pop(context,{"name":nameController.text, "phone":phoneController.text});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
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
              "assets/images/add_logo.png",
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 100,
            ),
            TextFieldApp(
              controller: nameController,
              hintText: AppText.hintName,
              iconData: Icons.cancel_rounded,
              errorText: errorName,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: phoneController,
              hintText: AppText.hintPhone,
              iconData: Icons.cancel_rounded,
              keyBoardType: TextInputType.phone,
              errorText: errorPhone,
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: onClickAdd, contentText: AppText.addButtonText),
            SizedBox(
              height: 252,
            )
          ],
        ),
      ),
    );
  }
}
