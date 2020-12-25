import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//email textfield for forgot password screen
class EmailTextField extends StatelessWidget {
  static String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Enter email",
            prefixIcon: Icon(FontAwesomeIcons.envelope),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          EmailTextField.email = value;
        },
      ),
    );
  }
}
