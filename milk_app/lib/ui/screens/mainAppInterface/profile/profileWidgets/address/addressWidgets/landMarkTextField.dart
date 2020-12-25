import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandMarkTextField extends StatelessWidget {
  static String landmark;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Enter Landmark",
            prefixIcon: Icon(FontAwesomeIcons.landmark),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          LandMarkTextField.landmark = value;
        },
      ),
    );
  }
}
