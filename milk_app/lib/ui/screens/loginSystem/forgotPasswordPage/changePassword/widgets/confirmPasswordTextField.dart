import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  static String confirmPassWord;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Enter password",
            prefixIcon: Icon(FontAwesomeIcons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          ConfirmPasswordTextField.confirmPassWord = value;
        },
      ),
    );
  }
}
