import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstNameTextField extends StatelessWidget {
  static String firstName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: "Enter First name",
            prefixIcon: Icon(FontAwesomeIcons.user),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          FirstNameTextField.firstName = value;
        },
      ),
    );
  }
}
