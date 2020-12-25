import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/changePassword/changePassword.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class EmailVerification extends StatelessWidget {
  final String email;
  final int otp;

  const EmailVerification({Key key, this.email, this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Email Verification"),
        ),
        body: Center(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("An OTP has been sent o your email"),
                  Text("Enter otp"),
                  otptextfield(context),
                ],
              )
          ),
        )
    );
  }

  Widget otptextfield(BuildContext context) {
    return Center(
      child: OTPTextField(
        length: 5,
        width: 300,
        fieldWidth: 45,
        style: TextStyle(
            fontSize: 20
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) {
          if(pin == otp.toString()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangePassword(email: email,)
                )
            );
          }
        },
      ),
    );
  }
}
