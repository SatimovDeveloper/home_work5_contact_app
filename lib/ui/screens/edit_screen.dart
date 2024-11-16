import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/strings.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}
class _EditScreenState extends State<EditScreen> {
  final TextEditingController eNameController = TextEditingController();
  final TextEditingController ePhoneController = TextEditingController();
  @override
  void initState() {
    eNameController.text = "Dilshod";
    ePhoneController.text = "+998900997530";
    super.initState();
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
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: () {}, contentText: AppText.editButtonText),
            SizedBox(
              height: 252,
            )
          ],
        ),
      ),
    );
  }
}
