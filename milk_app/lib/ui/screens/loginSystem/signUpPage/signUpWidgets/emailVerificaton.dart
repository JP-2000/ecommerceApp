import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/util/addUser.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class EmailVerification extends StatelessWidget {
  final int userOtp;
  final List usersList;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  const EmailVerification({
    Key key,
    this.userOtp,
    this.usersList,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword
  }) : super(key: key);

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
                  otp(context),
                ],
              )
          ),
        )
    );
  }

  Widget otp(BuildContext context) {
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
          if (userOtp.toString() == pin) {
            addUser(
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone,
              password: password
            );
            for(int i = 0; i <= 3; i++) {
              if(i < 3){
                Navigator.pop(context);
              }
              else{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()
                    )
                );
              }
            }
          }
        },
      ),
    );
  }
}
