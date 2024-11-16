import 'package:flutter/material.dart';

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
              controller: nameController,
              hintText: AppText.hintName,
              iconData: Icons.cancel_rounded,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldApp(
              controller: phoneController,
              hintText: AppText.hintPhone,
              iconData: Icons.cancel_rounded,
              keyBoardType: TextInputType.phone,
            ),
            SizedBox(
              height: 56,
            ),
            ButtonApp(onPressed: () {}, contentText: AppText.addButtonText),
            SizedBox(
              height: 252,
            )
          ],
        ),
      ),
    );
  }
}
