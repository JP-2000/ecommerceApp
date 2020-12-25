import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginPage.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/loginWidgets/passwordTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/loginPage/util/checkUser.dart';


class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
      ),
      onTap: () {

        //reset booleans on tap
        User.isUserRegistered = false;
        User.isPasswordCorrect = false;

        //check conditions for login
        checkUser(
          email: EmailTextField.email,
          password: PasswordTextField.password,
          usersList: Login.usersList,
          context: context,
        );

        // pop up messages for invalid login
        if(User.isUserRegistered == false){
          Scaffold.of(context).showSnackBar(message("Incorrect Email"));
        }
        else if(User.isUserRegistered == true && User.isPasswordCorrect == false){
          Scaffold.of(context).showSnackBar(message("Incorrect Password"));
        }
      },
    );
  }
  Widget message(String text){
    return SnackBar(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 100.0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0
          ),
        ),
      ),
      duration: Duration(milliseconds: 1000),
    );
  }
}
