import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailTextField extends StatelessWidget {
  static String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: GestureDetector(
        child: TextField(
          enableInteractiveSelection: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Enter email",
            prefixIcon: Icon(FontAwesomeIcons.envelope, size: 20.0,),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 2.0
                ),
                borderRadius: BorderRadius.circular(20.0)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),

          ),
          onChanged: (value) {
            EmailTextField.email = value;
          },
        ),
      ),
    );
  }
}

