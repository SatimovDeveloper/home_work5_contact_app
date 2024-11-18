import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/strings.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class EditScreen extends StatefulWidget {
  final Map<String, String> contact;
  const EditScreen({super.key, required this.contact});

  @override
  State<EditScreen> createState() => _EditScreenState();
}
class _EditScreenState extends State<EditScreen> {
  final TextEditingController eNameController = TextEditingController();
  final TextEditingController ePhoneController = TextEditingController();
  String? errorName;
  String? errorPhone;


  @override
  void initState() {
    eNameController.text = widget.contact["name"].toString();
    ePhoneController.text = widget.contact["phone"].toString();
    super.initState();
  }

  void onClickUpdate(){
    setState(() {
      if(eNameController.text.isEmpty){
        errorName = "The field must be filled in";
      }
      if(ePhoneController.text.isEmpty){
        errorPhone = "The field must be filled in";
      }
      if(eNameController.text.length<3){
        errorName = "Name is not a suitable length";
      }
      // if(!phoneRegExp.hasMatch(phoneController.text)){
      //   errorPhone = "The phone number format is incorrect";
      // }
      if(eNameController.text.length>2)
    {
      Navigator.pop(context,
          {"name": eNameController.text, "phone": ePhoneController.text});
    }
  });

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
              "assets/images/add_logo.png",
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 100,
            ),
            TextFieldApp(
              controller: eNameController,
              hintText: AppText.hintName,
              iconData: Icons.cancel_rounded,
              values: eNameController.text,
              errorText: errorName,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: ePhoneController,
              hintText: AppText.hintPhone,
              iconData: Icons.cancel_rounded,
              keyBoardType: TextInputType.phone,
              values: ePhoneController.text,
              errorText: errorPhone,
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: onClickUpdate, contentText: AppText.editButtonText),
            SizedBox(
              height: 252,
            )
          ],
        ),
      ),
    );
  }
}
