import 'package:flutter/material.dart';
import '../../config/colors.dart';

class TextFieldApp extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData iconData;
  final bool isPassword;
  final TextInputType keyBoardType;
  final String values;

  const TextFieldApp(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconData,
      this.isPassword = false,
      this.keyBoardType = TextInputType.text,
      this.values = ""});

  @override
  State<TextFieldApp> createState() => _TextFieldAppState(value: values);

}

class _TextFieldAppState extends State<TextFieldApp> {
  _TextFieldAppState({required this.value});
  bool obscure = true;
  String value;
  @override
  Widget build(BuildContext context) {

    return widget.isPassword
        ? TextField(
            keyboardType: widget.keyBoardType,
            controller: widget.controller,
            style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            obscureText: obscure,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColor.borderColor),
                ),
                labelText: widget.hintText,
                labelStyle: TextStyle(
                    color: AppColor.hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: obscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                suffixIconColor: AppColor.borderColor),
          )
        : TextField(
            keyboardType: widget.keyBoardType,
            controller: widget.controller,
            onChanged: (values) {
              setState(() {
                value = values;
              });
            },
            style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: AppColor.borderColor),
                ),
                labelText: widget.hintText,
                labelStyle: TextStyle(
                    color: AppColor.hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                suffixIcon: value.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.controller.clear();
                           value = "";
                          });
                        },
                        icon: Icon(widget.iconData),
                      )
                    : null,
                suffixIconColor: AppColor.borderColor),
          );
  }
}
