import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/strings.dart';

class ButtonApp extends StatelessWidget {
  final VoidCallback onPressed;
  final String contentText;
  const ButtonApp({super.key, required this.onPressed, required this.contentText});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none),
          minimumSize: Size(double.infinity, 56),
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        child: Text(
            contentText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)
        ));
  }
}
