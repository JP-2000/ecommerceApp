import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'changeUserPassword.dart';

class Bool{
  static bool isAnyFieldNull = true;
  static bool arePasswordsSame = false;
  static bool isPasswordLengthValid = false;
}

void checkPasswordConditions({
  String email,
  String password,
  String confirmPassword,
  BuildContext context
}) {
  if(password == null || confirmPassword == null){
    Bool.isAnyFieldNull = true;
  }
  else{
    Bool.isAnyFieldNull = false;
  }
  if(password == confirmPassword){
    Bool.arePasswordsSame = true;
  }
  else{
    Bool.arePasswordsSame = false;
  }
  if(password.length < 6 || confirmPassword.length < 6){
    Bool.isPasswordLengthValid = false;
  }
  else{
    Bool.isPasswordLengthValid = true;
  }
  if(
  Bool.isAnyFieldNull == false
  && Bool.arePasswordsSame  == true
  && Bool.isPasswordLengthValid == true
  ) {
    changeUserPassword(
      email: email,
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
}