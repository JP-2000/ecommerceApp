import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/signUpWidgets/emailVerificaton.dart';
import 'package:milk_app/ui/screens/loginSystem/signUpPage/util/sendOtpMail.dart';

class RegFormFields{
  static bool isAnyFieldNull;
  static bool isEmailRegistered;
  static bool isPhoneLengthAcceptable;
  static bool arePasswordsSame;

  static Map<String, bool> fields = {
    'firstName' : false,
    'lastName' : false,
    'email' : false,
    'phone' : false,
    'password' : false,
    'confirmPassword' : false,
  };
}

void chekSignUpDetails({
  BuildContext context,
  List users,
  String firstName,
  String lastName,
  String email,
  String phone,
  String password,
  String confirmPassword,
}) {
  //check if any field is null
  checkIfNullFields(
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    password: password,
    confirmPassword: confirmPassword,
  );

  //check email is already registered
  for (int i = 0; i < users.length; i++){
    if (checkStringIgnoringCase(email, users[i].email)){
      RegFormFields.isEmailRegistered = true;
      break;
    }
    else {
      RegFormFields.isEmailRegistered = false;
    }
  }

  //check if phone length is valid
  if(RegFormFields.isAnyFieldNull == false){
    if(phone.length == 10){
      RegFormFields.isPhoneLengthAcceptable = true;
    }
    else{
      RegFormFields.isPhoneLengthAcceptable = false;
    }
  }


  //check if passwords are same
  if (password == confirmPassword) {
   RegFormFields.arePasswordsSame = true;
  }
  else{
    RegFormFields.arePasswordsSame = false;
  }

  if(
  RegFormFields.isAnyFieldNull == false
      && RegFormFields.isEmailRegistered == false
      && RegFormFields.isPhoneLengthAcceptable == true
      && RegFormFields.arePasswordsSame == true
  ) {
    var _random = new Random();
    int otp = 10000 + _random.nextInt(99999 - 10000);
    print(otp);
    sendOtpMail(otp);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EmailVerification(
              userOtp: otp,
              usersList: users,
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone,
              password: password,
              confirmPassword: confirmPassword,
            )
        )
    );
  }
}

bool checkStringIgnoringCase(String str1, String str2) {
  return str1?.toLowerCase() == str2?.toLowerCase();
}

void checkIfNullFields({
  String firstName,
  String lastName,
  String email,
  String phone,
  String password,
  String confirmPassword,
}){
  RegFormFields.fields['firstName'] = returnBool(firstName);
  RegFormFields.fields['lastName'] = returnBool(lastName);
  RegFormFields.fields['email'] = returnBool(email);
  RegFormFields.fields['phone'] = returnBool(phone);
  RegFormFields.fields['password'] = returnBool(password);
  RegFormFields.fields['confirmPassword'] = returnBool(confirmPassword);

  for(String key in RegFormFields.fields.keys){
    if(RegFormFields.fields[key] == false){
      RegFormFields.isAnyFieldNull = true;
      break;
    }
    else{
      RegFormFields.isAnyFieldNull = false;
    }
  }
}

bool returnBool(String text){
  if(text == null){
    return false;
  }
  else{
    return true;
  }
}