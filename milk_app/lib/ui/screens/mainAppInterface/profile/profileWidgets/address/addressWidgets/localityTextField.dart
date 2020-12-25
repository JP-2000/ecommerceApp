import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocalityTextField extends StatelessWidget {
  static String locality;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Enter Locality/ Colony/ Society/ Apartment",
            prefixIcon: Icon(FontAwesomeIcons.home),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        onChanged: (value) {
          LocalityTextField.locality = value;
        },
      ),
    );
  }
}
