import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordPage.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        "Forgot Password",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForgotPassword()
            )
        );
      },
    );
  }
}
