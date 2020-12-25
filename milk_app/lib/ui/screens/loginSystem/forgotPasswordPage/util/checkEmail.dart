import 'dart:math';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordWidgets/emailVerificaton.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/util/sendOtpMail.dart';

class Bool{
  static bool isEmailRegistered = false;
}

void checkEmail({List users, String email, BuildContext context}) {
  for(int i = 0; i < users.length; i++) {
    if(checkStringIgnoringCase(users[i].email, email)) {
      Bool.isEmailRegistered = true;
      var _random = new Random();
      int otp = 10000 + _random.nextInt(99999 - 10000);
      print(otp);
      sendOtpMail(otp);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerification(otp: otp, email: email,),
          ),
      );
    }
  }
  if (Bool.isEmailRegistered == false){
    print("Email is not Registered, Please Signup");
  }
}

bool checkStringIgnoringCase(String str1, String str2) {
  return str1?.toLowerCase() == str2?.toLowerCase();
}