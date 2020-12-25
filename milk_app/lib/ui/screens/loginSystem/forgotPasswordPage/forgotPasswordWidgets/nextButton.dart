import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordPage.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/forgotPasswordWidgets/emailTextField.dart';
import 'package:milk_app/ui/screens/loginSystem/forgotPasswordPage/util/checkEmail.dart';

class NextButton extends StatelessWidget {
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
          child: Text("Next", style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.w800),),
        ),
      ),
      onTap: () {
        Bool.isEmailRegistered = false;
        checkEmail(
          users: ForgotPassword.usersList,
          email: EmailTextField.email,
          context: context,
        );
        if(Bool.isEmailRegistered == false){
          Scaffold.of(context).showSnackBar(message("Invalid Email"));
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
