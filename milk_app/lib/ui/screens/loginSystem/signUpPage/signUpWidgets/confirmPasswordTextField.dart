import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  static String password;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Confirm Password",
            prefixIcon: Icon(FontAwesomeIcons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          ConfirmPasswordTextField.password = value;
        },
      ),
    );
  }
}
