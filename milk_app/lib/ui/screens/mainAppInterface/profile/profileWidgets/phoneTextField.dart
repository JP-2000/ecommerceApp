import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneTextField extends StatelessWidget {
  static String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            labelText: "Enter Phone number",
            prefixIcon: Icon(FontAwesomeIcons.mobile),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          PhoneTextField.phone = value;
        },
      ),
    );
  }
}
