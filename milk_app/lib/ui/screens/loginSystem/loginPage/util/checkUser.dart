import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/passwordTextField.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User{
  static bool admin = false;
  static int uid;
  static bool isUserRegistered = false;
  static bool isPasswordCorrect = false;
}

void checkUser({String email, String password, List usersList, BuildContext context}) {
  int i;
  for(i = 0; i < usersList.length; i++) {
    if (email == usersList[i].email){
      User.isUserRegistered = true;
    }
    if(email == usersList[i].email && password == usersList[i].userPassword){
      User.isPasswordCorrect = true;
    }
    else{
      User.isPasswordCorrect = false;
    }
    if(User.isUserRegistered == true && User.isPasswordCorrect == true){
      User.uid = int.parse(usersList[i].uid);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
      EmailTextField.email = null;
      PasswordTextField.password = null;
      break;
//        _setStatus();
    }
  }
}

Future<void> _setStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("login_status", 2);
}